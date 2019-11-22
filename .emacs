;; * Emacs Startup Behavior

(require 'server) ; so file association works on windows and
(server-start)  ; for emacsclient (emacsclientw on Windows)

(add-to-list 'default-frame-alist '(fullscreen . fullheight)) ; startup at full height
(save-place-mode 1) ; remember cursor position when returning to a file

(setq inhibit-startup-message t
      inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode) ; so scratch is an org buffer

;; * Package Configuration

;; Avoid complaints, put before (require 'package)
;; https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t) 
(add-to-list   'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list   'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(unless (package-installed-p 'use-package) ; so can do a totally clean start
  (message "Installing use-package, diminish and refreshing")
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'diminish)) ; wouldn't install w/ use-package for some reason

;; from: http://cachestocaches.com/2015/8/getting-started-use-package/
(eval-when-compile
  (require 'use-package))

(use-package bind-key) ; inside use-package invoke with :bind-key

(setq use-package-always-ensure t) ; so use-package always installs missing pkgs

(use-package try) ; M-x try to test a pkg w/o installing it

;; * Computer-specific setup
;; ** OS-dependent settings
(defvar running-ms-windows
  (eq system-type 'windows-nt))

(defvar running-gnu-linux
  (string-match "linux" (prin1-to-string system-type)))

(if running-gnu-linux
    (progn (setq os-which-cmd "which")
           (global-set-key [f11] 'eshell) ; almost Unix, consistent across OS's
           (global-set-key [C-f11] 'shell) ; native shell
           ;; force chrome on Linux
           (setq browse-url-browser-function (quote browse-url-generic))
           (setq browse-url-generic-program "google-chrome")
	   ;; old UW SSLI: change to whatever is the latest
	   (setq ps-lpr-command "lp"
		 ps-lpr-switches (list "-dssli")))) 

(if running-ms-windows  ; more windows setup is also later in .emacs
    (progn 
      ;;Try to match winxp minimize command (also matches works in Gnome?)
      ;; Alt-space minimizes frame in winxp. Ideally, it'd be [Alt-space n]
      ;; Code gotten by: M-x global-set-key <RET> KEY CMD <RET>, <ESC> <ESC>
      (global-set-key "\240" (quote iconify-frame))
      ;; menu key is M-x, like it is on Linux
      (global-set-key (kbd "<apps>") 'execute-extended-command)
      (global-set-key [f11] 'eshell) ; almost Unix, consistent across OS's
      (global-set-key [C-f11] 'powershell) ; native shell
      (setq w32-use-w32-font-dialog nil)
      (setq os-which-cmd "where")
      (setq
       ps-lpr-command "c:\\Program Files\\gstools\\gsview\\gsview32.exe"
       ps-lpr-switches (list "/p" "-sDEVICE=mswinpr" "-") )
      ))
      ;; ;; So emacs recognizes Cygwin's path names
      ;; ;; (http://www.khngai.com/emacs/cygwin.php)
      ;; ;; NOTE: now obsolete, so must copy it from .emacs.d/* to .emacs.d/elpa
      ;; (use-package cygwin-mount 
      ;;   :config (cygwin-mount-activate))
      ;; (setq cygwin-bin-dir "c:/cygwin64/bin/")
      ;; (defun cygwin-shell ()
      ;;   "Run cygwin bash in shell mode."
      ;;   (interactive)
      ;;   (let ((explicit-shell-file-name (concat cygwin-bin-dir "bash"))
      ;;         (call-interactively 'shell)))
      ;;   (global-set-key [M-f11] 'cygwin-shell)))) ; cygwin bash

;; ** Individual Computer-dependent settings

(setq computerNm (downcase system-name)) ; downcase: was getting random case
(pcase (eval 'computerNm)
  ("cpr-scotto"     ; Clean Power Research desktop
   (progn (setq shareDir "c:/Users/Scott/OneDrive - Clean Power Research")))
  ("desktop-6bq3kmf" ; Surface Pro
   (setq shareDir "C:/Users/scott/OneDrive - Clean Power Research"))
  ("desktop-rvtj6ua" ; Surface Go
   (setq shareDir "C:/Users/scott/OneDrive - Clean Power Research"))
   (progn (warn "Can't assign shareDir for unknown computer: %s" computerNm)
	  (setq shareDir (concat "unknown_computer_" computerNm "_shareDir")))
  )

(unless (file-readable-p shareDir)
  (warn "shareDir %s doesn't exist or not readable" shareDir))
(setq docDir (expand-file-name "ref" shareDir))
(unless (file-readable-p docDir)
  (warn "docDir %s doesn't exist or not readable" docDir))
(message "computerNm %s shareDir %s docDir %s" computerNm shareDir docDir)

;; ** Screen/terminal dependent settings

(if window-system
    (progn
      ;; middle mouse click on url starts browser in every file
      (when (fboundp 'goto-address) (add-hook 'find-file-hooks 'goto-address))
      (define-key global-map [S-down-mouse-3] 'imenu))
  (progn
    ;; on a term or cmdshell:
    (menu-bar-mode -1) ;menubar off when on an xterm (xemacs does automatically)
    (set-face-background 'region "pale turquoise"))) ;works on xterm

;; Adjust pixel-based values depending upon screen DPI
;; Modified (use workingarea not geometry) unhammer's code at:
;; https://emacs.stackexchange.com/questions/28390/quickly-adjusting-text-to-dpi-changes
;; Compare with http://dpi.lv/
(defun my-dpi (&optional display)
  "Get the DPI of DISPLAY. 
DISPLAY is a display name, frame or terminal, as in
`display-monitor-attributes-list'."
  (cl-flet ((pyth (lambda (w h)
                    (sqrt (+ (* w w)
                             (* h h)))))
            (mm2in (lambda (mm)
                     (/ mm 25.4))))
    (let* ((atts (frame-monitor-attributes))
           (pix-w (cl-fourth (assoc 'workarea atts)))
           (pix-h (cl-fifth (assoc 'workarea atts)))
           (pix-d (pyth pix-w pix-h))
           (mm-w (cl-second (assoc 'mm-size atts)))
           (mm-h (cl-third (assoc 'mm-size atts)))
           (mm-d (pyth mm-w mm-h)))
      (/ pix-d (mm2in mm-d)))))

(defun calcDivNpix ()
  "Computes # pix for window divider based on screen DPI.
TODO: make this a general function."

  (let* ((nPixHigh 6.0)    # Home monior (Dell 4K)
        (DPIhigh   185.0)
        (nPixLow   3.0)    # CPR monitor
        (DPIlow    94.0)
        DPIthis nPixThis)

    (setq DPIthis (my-dpi))
    (message "DPIthis %s" DPIthis)
    (setq nPixThis (max 1 (round (+ (* (/ (- nPixHigh nPixLow) (- DPIhigh DPIlow)) (- DPIthis DPIlow)) nPixLow))))))


;; set window divider width custom variables (setq is said to be the
;; way to do this in .emacs, instead of calling customize-set-variable).
(setq nPixDiv (calcDivNpix))
(message "nPixDiv: %s" nPixDiv)
(setq window-divider-default-bottom-width nPixDiv)
(setq window-divider-default-right-width nPixDiv)

;; (set-window-scroll-bars nil 11 t) ; currenT WINDOW
;;(setq-default scroll-bar-width 50) ; default or all new windows and
;;frames
;; (modify-all-frames-parameters ) should change them all
;; (message "%s" (frame-parameters)) prints frame params
;;
;; need to change both initial and default params:
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Emacs-ignores-frame-parameters.html

;; TODO also set pixel width of scrollbars, etc
;; TODO Use dispwatch, https://github.com/mnp/dispwatch, to change these things dynamically
;;      Also: https://emacs.stackexchange.com/questions/28390/quickly-adjusting-text-to-dpi-changes
;; TODO change font too?

;; to install it with the ps-print package, which I hadn't for 21.8, at least.
(require 'ps-print)
(setq
 ps-print-color-p t
 ps-paper-type 'a4
 ps-bottom-margin (/ (* 72 2.0) 2.54))

;; * Operating System Interaction

(defun sdo/find-exec(cmd_name &optional notFoundMsg)
  "Finds path to executable 'cmd_name' and returns it."
  (let (cmd_path nfmsg retpathstr)
         (setq cmd_path (executable-find cmd_name))
         (if (not cmd_path)
             (if notFoundMsg
                 (warn "%s not found. %s" cmd_name notFoundMsg)
               (warn  "%s not found." cmd_name))
           (progn (message "found %s at: %s" cmd_name cmd_path)
                  (setq retpathstr cmd_path))))) ; there must be a better way...

;; ** Shell Mode
;; Make up/down arrows search cmd history like tcsh
(require 'shell)
(define-key shell-mode-map [up]	'comint-previous-matching-input-from-input)
(define-key shell-mode-map [down] 'comint-next-matching-input-from-input)

;; so ^M doesn't show up in Linux xemacs shell while logged in to Solaris
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

(if running-ms-windows ; so emacs uses command.com for shell
    (setq process-coding-system-alist'(("cmdproxy" . (raw-text-dos . raw-text-dos)))))

;; So passwords aren't displayed
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
;; patterns for my pwd, ssh, or krb prompts
(setq usrnm (user-login-name))
(setq comint-password-prompt-regexp
      (concat "\\(\\([Oo]ld \\|[Nn]ew \\|^\\|^" usrnm" @.*'s \\|^" usrnm
	      ".*'s \\|[Pp]assword for \\)[Pp]assword\\|pass phrase\\|" usrnm
	      "@.*\\):\\s *\\'"))

;; ** Eshell
;; Helps with editing commands, cursor jumping.  See
;; https://www.masteringemacs.org/article/complete-guide-mastering-eshell
(require 'eshell)
(require 'em-smart) ; I'm not sure what all this does, but no harm...
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

;; ** Powershell (Windows)

(if running-ms-windows  ; could be in OS-specific section too
    (use-package powershell))

;; ** Remote Process Communication

;; Could put scp/ftp or whatever here, if I need that someday

;; TRAMP almost never used, slows things down
;; tramp: remote ssh, like ange-ftp: info page command different for gnu/xemacs
;;(require 'tramp)
;; su uses uuencoding: not as good as mimencode (sm) but not installed on Suns
;;(setq tramp-default-method "su")
;; mimeencoding is installed on finch and eagle, so could use there and
;; force su on other machines e.g. "/[su/orca]~"
;;(setq tramp-default-method "sm")

;; * Backups, autosaves, autoloads
;; From: https://www.emacswiki.org/emacs/BackupDirectory
;; Do this especially since TempoBox gets confused w/ ~ @ filename front
(message "Saving ~ backups to ~/.backups_emacs") 
(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist
      '(("." . "~/.backups_emacs"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups

(message "Saving # autosaves to %s" temporary-file-directory)
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      create-lockfiles nil)

(global-auto-revert-mode t) ; updates when file changes, like Matlab.

;; * Window Config, Desktop Save and Restore
;; ** Adjusting Window Orientation
(use-package transpose-frame ; tons of functions: I'm just picking this one
  :config (global-set-key (kbd "C-|")  'rotate-frame-clockwise))

(winner-mode 1) ; Undo window config: C-c left; Redo window config: C-c right

;; ** Attempts at saving desktop

;; Perspectives for emacs
;; From: https://github.com/andresilva/emacs.d/blob/master/init.el

;; Use one folder for all save/history/cache files (more than persp-mode uses it)
(defconst !/savefile-dir (expand-file-name "savefile" user-emacs-directory))
(unless (file-exists-p !/savefile-dir)
  (make-directory !/savefile-dir))


;; https://github.com/Bad-ptr/persp-mode.el  
(use-package persp-mode
  :ensure t
  :diminish persp-mode
  
  :init
  (setq wg-morph-on nil ;; switch off animation
        persp-add-buffer-on-after-change-major-mode t
        persp-auto-resume-time -1
        persp-autokill-buffer-on-remove 'kill-weak
        persp-save-dir (expand-file-name "persp-confs/" !/savefile-dir))

  (add-hook 'after-init-hook (lambda () (persp-mode 1)))
  
  :config
  (defvar !//persp-last-selected-perspective persp-nil-name
    "Previously selected perspective.")
  (defun !//persp-save-last-selected-perspective (_ _ &optional _)
    (setq !//persp-last-selected-perspective persp-last-persp-name))
  (advice-add 'persp-activate :before #'!//persp-save-last-selected-perspective))

;; from: https://github.com/Bad-ptr/persp-mode.el/issues/93#issuecomment-392282950
(with-eval-after-load "persp-mode"
  (defvar persp-indirrect-buffers-to-restore nil)
  
  (persp-def-buffer-save/load
   :tag-symbol 'def-indirect-buffer
   :predicate #'buffer-base-buffer
   :save-function
   #'(lambda (buf tag vars)
       (list tag (buffer-name buf) vars
             (buffer-name (buffer-base-buffer))))
   :load-function
   #'(lambda (savelist)
       (destructuring-bind
           (buf-name vars base-buf-name &rest _rest) (cdr savelist)
         (push (cons buf-name base-buf-name)
               persp-indirrect-buffers-to-restore)
         nil)))

  (add-hook 'persp-after-load-state-functions
            #'(lambda (&rest _args)
                (dolist (ibc persp-indirrect-buffers-to-restore)
                  (let* ((nbn (car ibc))
                         (bbn (cdr ibc))
                         (bb (get-buffer bbn)))
                    (when bb
                      (when (get-buffer nbn)
                        (setq nbn (generate-new-buffer-name nbn)))
                      (make-indirect-buffer bb nbn t))))
                (setq persp-indirrect-buffers-to-restore nil))))

;; buggy, as of April 8, 2017
;;(require 'desktop+) ; needed?
;; experiment: does this save indirect buffers?
;;(load "c:/Users/scott/Downloads/nxhtml-master/nxhtml-master/util/winsav.el")
                                        ;(winsav-save-mode 1);
;;
;; Works if only one session is saved. If save a second one, it's broken
;; ;; Better session management
;;
;; (defconst user-cache-directory
;; (expand-file-name (concat user-emacs-directory ".cache/"))
;; "My emacs storage area for persistent files.")
;; ;; create the `user-cache-directory' if it doesn't exist
;; (make-directory user-cache-directory t)
;;
;; (desktop-save-mode 0) ;ensure there's no interference w/ builtin mode
;; (use-package desktop+
;;   :ensure t
;;   :commands (desktop+-create desktop+-load)
;;   :config
;;   (setq desktop+-base-dir (concat user-cache-directory "desktop"))
;;   (defun my/desktop-frame-title-function (desktop-name)
;;     (list (concat "%f | [" desktop-name "]")))
;;   (setq desktop+-frame-title-function
;;         'my/desktop-frame-title-function)
;;   )

;;  (require 'bookmark+) ;fancy bookmarks and desktop session saving (no work)

;; something's wrong with this download,
;; says: error: Non-hex digit used for Unicode escape

;;  (load "~\lib\emacs\nxhtml-master\util\winsav.el");
;; (winsav-save-mode 1);
;; (require 'winsav-save-configuration)

;; * Search and Replace (see also Swiper/Ivy)
;; ** Web Search
(use-package google-this      ;; TODO: compare with counsel-search
  :diminish google-this-mode
  :config
  (google-this-mode 1)) ; bound to C-c / g (and other bindings after '/')

;; ** File System Search

(use-package ag
  :after counsel
  :config
  ;; supposed to work on Windows: https://github.com/abo-abo/swiper/issues/672
  (setq counsel-ag-base-command "ag --vimgrep --nocolor --nogroup %s")  
  ;; DOESN'T WORK.  Neither does counsel-ag
  ;; so can use ag inside of eshell. Installation: run alias ag 'ag-eshell $1' in eshell. This puts this elisp in emacs.d/eshell/alias, so need to do this for each install.
  ;; from: https://github.com/tomjakubowski/.emacs.d/issues/3
  (defun ag-eshell (string)
    "Search with ag using the current eshell directory and a given string.
   To be used from within an eshell alias
   (`alias ag 'ag-eshell $1'` within eshell)"
    (ag/search string (eshell/pwd))))

;; ** Search/Replace within Buffer

;; Bindings for searching with currently highlighted string
;; See also "C-c s") 'swiper-isearch-thing-at-point)
(define-key isearch-mode-map "\M-s" 'isearch-repeat-forward)  ; word forward
(define-key isearch-mode-map "\M-r" 'isearch-repeat-backward) ; word backward

(use-package replace-from-region
  :config                    ; default was query-replace
  (global-set-key (kbd "M-%") 'query-replace-from-region))

;; So isearch searches for selected region, if there is one.  From:
;;http://stackoverflow.com/questions/202803/searching-for-marked-selected-text-in-emacs
;; NOTE: C-s C-w (extra C-w's expand region) also works well
;; TODO: Replace with isearch with ivy search?
;; See also "C-c s") 'swiper-isearch-thing-at-point)
(defun jrh-isearch-with-region ()
  "Use region as the isearch text."
  (when mark-active
    (let ((region (funcall region-extract-function nil)))
      (deactivate-mark)
      (isearch-push-state)
      (isearch-yank-string region))))
(add-hook 'isearch-mode-hook #'jrh-isearch-with-region)

;; C-; on symbol/word edits all instances in scope & other things. C-; to exit
(use-package iedit
  :config
  (defun iedit-within-defun ()
    "Do iedit search and replace within current defun (equivalent to C-0 C-;)"
    (interactive)
    (let ((current-prefix-arg '(0))) (call-interactively 'iedit-mode)))
  :init
  (define-key prog-mode-map (kbd "C-;") 'iedit-within-defun))

;; ** Expand-Region
;; handy with, at least, wrap-region for italics, bold,... emphasis
(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; * Swiper/Ivy

;; TODO: evalulate https://github.com/Yevgnen/ivy-rich
;; Help while in ivy search:
;;  hydra: C-o;
;;  full help: C-h m
(use-package swiper
  :diminish ivy-mode
  :init
  ;;(setq ivy-use-virtual-buffers t) ; ivy-switch-buffer also shows recent files
  (setq ivy-count-format "(%d/%d) ") ; show candidate index/count in swiper
  ;; Search with swiper, handles org-mode headline unfold much better than helm
  ;; C-s C-w (extra C-w's expand region) also works well
  ;; I added -i to counsel-grep-base-command so grep is case-insensitive
  ;;  (fset 'swiper-func 'counsel-grep-or-swiper) ; uses grep for long files, esp. org
  (fset 'swiper-func-forward 'swiper) ; standard swiper, slow on large org files
  (fset 'swiper-func-backward 'swiper-backward) ; standard swiper, slow on large org files

  ;; TODO: combine forward bacward into one function instead of this hack
  (defun sdo/swiper-region-forward ()
    "If region selected, swipe for it forward, else do normal swiper call"
    (interactive)
    (if mark-active
        (let ((region (funcall region-extract-function nil)))
          (deactivate-mark)
          (swiper-func-forward region))
      (swiper-func-forward)))

  (defun sdo/swiper-region-backward ()
    "If region selected, swipe for it backwards, else do normal swiper call"
    (interactive)
    (if mark-active
        (let ((region (funcall region-extract-function nil)))
          (deactivate-mark)
          (swiper-func-backward region))
      (swiper-func-backward)))

  (global-set-key "\C-s" 'sdo/swiper-region-forward)
  (global-set-key "\C-r" 'sdo/swiper-region-backward)
  ;; see also jrh-isearch-with-region
  (global-set-key (kbd "C-c s") 'swiper-isearch-thing-at-point)
  ;; ivy-views integrate with ivy-switch-buffer (See https://oremacs.com/2016/06/27/ivy-push-view/).  That's probably nice but I'm still using ido-switch-buffer b/c of its rectangular view.  So, I've bound ivy-switch view to something close to switch-buffer.
  ;; NOTE, however, that somebody has posted an ivy-rectangle view.  I must have an email for that or something.
  (global-set-key (kbd "C-c v") 'ivy-push-view)
  (global-set-key (kbd "C-c V") 'ivy-pop-view) ; works like delete
  (global-set-key (kbd "C-x V") 'ivy-switch-view)
  ;; actually, this seems to do the (nearly) same thing as C-s s
  (global-set-key (kbd "C-c C-r") 'ivy-resume)) ;Resume last ivy completion sess

(use-package counsel ; better kill-ring 2nd yanking
  :init
  :diminish counsel-mode
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)) ; needed?
   :config
   ;; Internet search, compare w/ google-this
   ;; TODO: make it search for region if selected, like
   ;; sdo/swiper-region and for thing at point, like c-c s
   ;; (swiper-isearch-thing-at-point) does now.  There are many
   ;; *-at-point functions already here.  Maybe one is an inspiration.
   ;; Some existing funcs call emac's symbol-at-point.
   (global-set-key (kbd "C-S-s")  'counsel-search)) ; doesn't work in :bind

(use-package ivy-explorer ; ido-grid-mode for ivy: C-f/b/p/n/a/e navigate the grid
  :after ivy
  :diminish ivy-explorer-mode
  :config
  (require 'ivy-explorer) ; needed?
  ;; use ivy explorer for all file dialogs
  (ivy-explorer-mode 1)
  ;; not strictly necessary
  (counsel-mode 1))

;;(use-package ivy-hydra) ; bound to C-o (is this helpful?)

;; from: https://github.com/abo-abo/swiper/issues/2021
;;; Ivy Hydra
;; replace the ivy-hydra with this learning one
;; uses regular ivy-mode keybindings to provide cleaner help and aid learning
(defhydra hydra-ivy (:hint nil
                     :color pink)
"

Navigation:
_C-n_/_C-p_ next/previous  _M-<_/_M->_ begin/end  _C-v_/_M-v_ scroll up/down
_C-'_ select with avy

Use current selection to:
_RET_,_C-m_ default action  _M-o_ choose from actions
_C-M-j_ use current input not selection

Do action with current selection and loop to choose more items:
_C-M-m_ default action  _C-M-o_ choose action
_C-M-n_/_C-M-p_ default action and select next/previous

Insert into input field:
_TAB_ complete input as far as possible
_C-j_ or _TAB_ _TAB_ complete directory and search or complete filename and do action
_M-n_/_M-p_ history next/previous  _M-i_ selection  _M-j_ word-at-point
_C-r_ reverse search history  _C-s_ next line or last from history if empty 

Other operations with current candidates:
_S-SPC_ restrict to current matches  _M-w_ saves selections to kill ring
_C-c C-o_ open candidates in ivy-occur buffer

Other:
_c_ toggle calling  _M-c_ toggle case folding  _M-r_ toggle regexp
_C-c C-s_ rotate sort function if multiple defined
_C-c C-a_ toggle user configured ignore lists
_C-M-a_ change default action from list for this session
"
  ;; Navigation
  ("M-<" ivy-beginning-of-buffer)
  ("C-n" ivy-next-line)
  ("C-p" ivy-previous-line)
  ("M->" ivy-end-of-buffer)
  ("C-v" ivy-scroll-up-command)
  ("M-v" ivy-scroll-down-command)
  ;; Single selection, action, exit
  ("RET" ivy-done :exit t)
  ("C-m" ivy-done :exit t)
  ("M-o" ivy-dispatching-done :exit t)
  ("C-j" ivy-alt-done :exit t)
  ("TAB" ivy-partial-or-done :exit t)
  ("C-M-j" ivy-immediate-done :exit t)
  ("C-'" ivy-avy :exit nil)
  ;; Multiple selections, actions, no exit
  ("C-M-m" ivy-call)
  ("C-M-o" ivy-dispatching-call)
  ("C-M-n" ivy-next-line-and-call)
  ("C-M-p" ivy-previous-line-and-call)
  ;; alter input
  ("M-n" ivy-next-history-element)
  ("M-p" ivy-previous-history-element)
  ("M-i" ivy-insert-current)
  ("M-j" ivy-yank-word)
  ("S-SPC" ivy-restrict-to-matches)
  ("C-r" ivy-reverse-i-search)
  ("C-s" ivy-next-line-or-history)
  ;; other
  ("M-w" ivy-kill-ring-save)
  ;; non-standard utilities
  ("c" ivy-toggle-calling)
  ("M-c" ivy-toggle-case-fold)
  ("M-r" ivy-toggle-regexp-quote)
  ("C-c C-s" ivy-rotate-sort)
  ("C-c C-a" ivy-toggle-ignore)
  ("C-M-a" ivy-read-action)
  ("C-c C-o" ivy-occur :exit t)
  )
(define-key ivy-minibuffer-map (kbd "C-o") 'hydra-ivy/body)

(defun org-toggle-outline-visibility ()
  "Hides all subheadlines or restores original visibility before toggle.
   Eventually use this to speed up ivy by showing everything, searching and then unshowing everything."

  (interactive)

  ;; NAH, need to call "hide everything on one call; save outline on next.  Also, apparently need for arguments for org-save-outline-visibility:  see emacs help. 

  (org-save-outline-visibility nil))

;; * IDO Mode
;; Ido mode (a replacement for iswitchb and much else).  Much is in customizations
;; advice from: http://www.masteringemacs.org/article/introduction-to-ido-mode
;; See also sdo/get-recentf() in keybinding section, which (currently) uses ido
;; Ivy is fancier but I'm keeping Ido around because it has a nice
;; grid mode that isn't available for Ivy (but see ivy-explorer).
;;
;; Should be placed after ivy to avoid partial ivy overwrites of ido functions

(ido-mode 1) ; https://github.com/DarwinAwardWinner/ido-completing-read-plus
(ido-everywhere 1)

;; From: http://stackoverflow.com/questions/17986194/emacs-disable-automatic-file-search-in-ido-mode
;; so it doesn't search for file completions in other directories.  Really
;; hoses up dired directory create, for example.
(setq ido-auto-merge-work-directories-length -1)
(use-package ido-completing-read+
  :config (ido-ubiquitous-mode 1)) ; run it (almost) everywhere

;; how files are ordered in the ido mini-buffer
(setq ido-file-extensions-order '(".org" ".m" ".R" "_emacs" ".emacs" ".txt" ".py" ".pl" ".pm" ".el" ".c" ".cpp" ".h" ".rb" ".xml"))

(use-package ido-grid-mode ;; https://github.com/emacsmirror/ido-vertical-mode
  :config (ido-grid-mode 1))

(use-package flx-ido
  :init
  ;; copied from https://github.com/bdd/.emacs.d/blob/master/packages.el
  (setq gc-cons-threshold (* 20 (expt 2 20)) ido-use-faces nil) ; megabytes
  :config
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

;; I also have a hydra set up to do counsel bindings but ido-describe-bindings is here because it also shows unicode chars (that I don't know how to activate with my keyboard, but at least they're there...)
(use-package ido-describe-bindings
  :config (global-set-key (kbd "C-h b") 'ido-describe-bindings))

;; ido- matching for emacs commands: https://www.reddit.com/r/emacs/comments/1xnhws/speaking_of_emacs_modes_flx_flxido_ido_smex_helm/?st=iu1g56lu&sh=554484fb
(use-package smex
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;; * Company Mode
;; Used in other packages.  Maybe put this section there instead of here.

(use-package company)

;; * Scrolling, Cursor Movement and Selection

(setq scroll-step 1)
(global-set-key (kbd "M-[") 'scroll-down) ; page up
(global-set-key (kbd "M-]") 'scroll-up)   ; page down

;;Return to mark: https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org
(bind-key "C-x p" 'pop-to-mark-command) 
(setq set-mark-command-repeat-pop t) ; so C-x p keeps going backwards in marks

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line
         number input"
  (interactive)
  (unwind-protect
      (progn
	(display-line-numbers-mode 1)               ; only on current buffer
	(goto-line (read-number "Goto line: ")))
    (display-line-numbers-mode -1)))                 ; only on current buffer
(global-set-key (kbd "M-=") 'goto-line-with-feedback)

(global-set-key (kbd "C-M-=") 'global-display-line-numbers-mode) ; toggles all

;; So C-arrow keys move cursor to different buffer (C-S-arrow moves buffers)
(setq windmove-wrap-around t ) ; wrap windows around edge, like torus space
;; Overwrites org keys I don't use (are inhibited in org setup)
(global-set-key (kbd "<C-up>")     'windmove-up)
(global-set-key (kbd "<C-down>")   'windmove-down)
(global-set-key (kbd "<C-left>")   'windmove-left)
(global-set-key (kbd "<C-right>")  'windmove-right)

;; Traverse cursor movement history across windows and frames using mouse buttons usually bound to browser forward/back.
;; On MS sculpt mouse, swipe down is 'back'; swipe up is 'forward'
(define-key global-map [mouse-4] 'next-multiframe-window)
(define-key global-map [mouse-5] 'previous-multiframe-window)

(use-package smart-region ; smart region selection expand
  :init (global-set-key (kbd "C--") 'smart-region)) ; C-x toggles to start/end

;; * Buffer Handling
;; ** Buffer naming
;; Renames buffers containing same file names, different dirs
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p 1)

(global-set-key "n" 'rename-buffer)

;; ** List Buffers w/ ctl-mouse1
(defun cw-build-buffers ()
  "Popup buffer menu."
  (interactive "@")
  (run-hooks 'activate-menubar-hook)
  (popup-menu (car (find-menu-item current-menubar '("Buffers")))))
(global-set-key [(control button1)] 'cw-build-buffers)

;; ** ibuffer (better than the default buffer?)
;;http://cestlaz.github.io/posts/using-emacs-34-ibuffer-emmet/
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
	       ("dired" (mode . dired-mode))
	       ("org" (name . "^.*org$"))

	       ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
	       ("programming" (or
			       (mode . python-mode) ;; works w/ elpy?
			       (mode . matlab-mode)
			       (mode . cperl-mode)
			       (mode . ess-mode)
			       (mode . c++-mode)))
	       ("emacs" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Messages\\*$")))
	       ))))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-auto-mode 1)
	    (setq truncate-lines t) ; pathnames get long
	    (redraw-display) ; to truncate is activated
	    (ibuffer-switch-to-saved-filter-groups "default")))

;; Don't show filter groups if there are no buffers in that group
(setq ibuffer-show-empty-filter-groups nil)

;; Don't ask for confirmation to delete marked buffers
(setq ibuffer-expert t)

;; ** Buffer movement
;; So ctl-shift-arrow keys move buffers within a frame (ctl-arrows move cursor)
;; (org-mode keys should have already been unbound in the org section)
(use-package buffer-move
  :config
  (global-set-key (kbd "<C-S-up>")     'buf-move-up)
  (global-set-key (kbd "<C-S-down>")   'buf-move-down)
  (global-set-key (kbd "<C-S-left>")   'buf-move-left)
  (global-set-key (kbd "<C-S-right>")  'buf-move-right))

;; tab keys work across buffers like browsers across tabs
(global-set-key (kbd "<C-tab>")  'other-window) ; forwards

;; ;; CAN'T GET THIS TO WORK: CYCLE BUFFERS BACKWARDS
;; (global-set-key (kbd "<C-S-tab>") (lambda () (interactive) (other-window -1)))

;; (defun other-window-backwards ()
;;   (interactive "P") 
;;   (other-window -1))
;; (global-set-key (kbd "<C-S-tab>")  'other-window-backwards) ; backwards

;; (defun other-window-backwards ()
;;   (interactive "P") 
;;   (call-interactively 'grep))
;; (global-set-key (kbd "<C-S-tab>")  'other-window) ; backwards

;; ** Indirect buffers
(defun sdo/clone-indirect-buffer-other-frame (newname display-flag &optional norecord)
  "Like `clone-indirect-buffer' but display in another frame."
  (interactive
   (progn
     (if (get major-mode 'no-clone-indirect)
	 (error "Cannot indirectly clone a buffer in %s mode" mode-name))
     (list (if current-prefix-arg
	       (read-buffer "Name of indirect buffer: " (current-buffer)))
	   t)))
  
  (let* ((pop-up-windows nil) ; may not do anything: nil or t behavior is same
	 (value (clone-indirect-buffer newname nil norecord)))
    (switch-to-buffer-other-frame value)))

(global-set-key (kbd "C-x c")   'clone-indirect-buffer) ; C-x C-c kills emacs
(global-set-key (kbd "C-x 4 c") 'clone-indirect-buffer-other-window)
(global-set-key (kbd "C-x 5 c") 'sdo/clone-indirect-buffer-other-frame)

;; * File Finding / Opening
;; ** Dired Mode
;; *** Generic Dired and Win32 integration

;; TODO: when I do this, dired-subtree doesn't work.  Figure out why, fix.
;; So dired puts folders at top.  The discovered ls program must
;; handle GNU switches (e.g. OSX doesn't)
;(setq insert-directory-program (sdo/find-exec "ls" "For dired folder ordering"))
;(setq dired-listing-switches "-laGh1v --group-directories-first")
;(setq dired-listing-switches "-laGh1v")
;(setq ls-lisp-dirs-first t) ; for Windows, when runs lisp ls by default
(add-hook  'dired-mode-hook
	   (lambda ()
             (dired-hide-details-mode) ; less junk.  ) restores orig format
             ;; make dired search case insensitive (default is case sensitive)
	     (setq case-fold-search t)
             ;; override for dired, where this is annoying, for some reason
	     (define-key dired-mode-map (kbd "C-x C-f") 'find-file)
	     (if running-ms-windows
		 ;; Assumes this is emacsw32.  If not, must require
		 ;; w32-integ or something like that. Overwrite some
		 ;; org-mode bindings.
		 (progn (define-key dired-mode-map (kbd "C-c o")
			  'w32-integ-dired-explorer-open)
			(define-key dired-mode-map (kbd "C-c p")
			  'w32-integ-dired-explorer-print)
			;; put this in a global place, not just dired?
			(define-key dired-mode-map (kbd "C-c C-o")
			  'w32shell-explorer-here)
                        )
			;; ;; FIX so only run if CYGWIN so windows/cygwin
			;; ;; links properly.  Display is sensible but dired
			;; ;; can't follow either ordinary cygwin link or the
			;; ;; windows shortcut link that cygwin makes with
			;; ;; "winsymlinks" in the CYGWIN environment
			;; ;; variable
			;; (setq ls-lisp-use-insert-directory-program t) ; ext. ls
			;; (setq insert-directory-program (concat cygwin-bin-dir "ls"))
			;; )
	       )
	     ))

;; so that dired automatically updates stale directory list when buffer revisted
(setq dired-no-confirm `(revert-subdirs))
;; I want to do these w/o interrupting emacs prompts
(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)

;; *** Dired subtree and project explorer

;; From: https://mads-hartmann.com/2016/05/12/emacs-tree-view.html
;; TODO: if cursor on '.' do nothing.  If cursor on '..' pop a directory
;; TODO: add the code for projectile/project explorer

;; PROBLEM with this is that once you go up a dir, it never toggles
;; again, due to a saved state, I suppose
;; (defun mhj/dwim-toggle-or-open ()
;;   "Toggle subtree or open the file."
;;   (interactive)
;;   (if (file-directory-p
;;        (dired-get-file-for-visit))
;;       (let ((dir-at-point (file-name-nondirectory(dired-get-filename nil t))))
;;         (if (string= dir-at-point "..")
;;             (dired-find-file) ;; go up a dir
;;           (if (not (string= dir-at-point ".")) ;; do nothing if on '.'
;;               (progn
;;                 (message "called toggle")
;;                 ;; (message "%s string= '.': %s" raw (string= raw "."))
;;                 ;; (message "%s string= '..': %s" raw (string= raw ".."))
;;                 ;;                             (directory-file-name
;;                 ;;                              (file-name-directory raw))))
;;                 ;; (message "bottom 2dir: %s " (file-name-nondirectory raw))
;;                 ;; (dired-subtree-toggle)
;;                 (revert-buffer)))))
;;     (dired-find-file)))

(defun mhj/dwim-toggle-or-open ()
  "Toggle subtree or open the file."
  (interactive)
  (if (file-directory-p (dired-get-file-for-visit))
      (progn
    (dired-subtree-toggle)
    (revert-buffer))
    (dired-find-file)))

;; TODO: Click both does tree and opens new dired window.  Get rid of
;; the open.
(defun mhj/mouse-dwim-to-toggle-or-open (event)
  "Toggle subtree or the open file on mouse-click in dired."
  (interactive "e")
  (let* ((window (posn-window (event-end event)))
     (buffer (window-buffer window))
     (pos (posn-point (event-end event))))
    (progn
      (with-current-buffer buffer
    (goto-char pos)
    (mhj/dwim-toggle-or-open)))))

(use-package dired-subtree
  :demand
  :bind
  (:map dired-mode-map
    ("<enter>" . mhj/dwim-toggle-or-open)
    ("<return>" . mhj/dwim-toggle-or-open)
    ("<tab>" . mhj/dwim-toggle-or-open)
    ("<down-mouse-1>" . mhj/mouse-dwim-to-toggle-or-open))
  :config
  (progn
    ;; Function to customize the line prefixes (I simply indent the lines a bit)
    (setq dired-subtree-line-prefix (lambda (depth) (make-string (* 2 depth) ?\s)))
    (setq dired-subtree-use-backgrounds nil)))

;; Bugfixed version of the function in  dired-subtree.el
;; (dired-subtree package)
;; See my bug report https://github.com/Fuco1/dired-hacks/issues/164
(defun dired-subtree-insert ()
  "Insert subtree under this directory."
  (interactive)
  (when (and (dired-subtree--dired-line-is-directory-or-link-p)
             (not (dired-subtree--is-expanded-p)))
    (let* ((dir-name (dired-get-filename nil t))
           (listing (dired-subtree--readin (file-name-as-directory dir-name)))
           beg end)
      (read-only-mode -1)
      (move-end-of-line 1)
      ;; this is pretty ugly, I'm sure it can be done better
      (save-excursion
        (insert listing)
        (setq end (+ (point) 2)))
      (newline)
      (setq beg (point))
      (let ((inhibit-read-only t))
        (remove-text-properties (1- beg) beg '(dired-filename)))
      (let* ((ov (make-overlay beg end))
             (parent (dired-subtree--get-ov (1- beg)))
             (depth (or (and parent (1+ (overlay-get parent 'dired-subtree-depth)))
                        1))
             (face (intern (format "dired-subtree-depth-%d-face" depth))))
        (when dired-subtree-use-backgrounds
          (overlay-put ov 'face face))
        ;; refactor this to some function
        (overlay-put ov 'line-prefix
                     (if (stringp dired-subtree-line-prefix)
                         (if (not dired-subtree-use-backgrounds)
                             (apply 'concat (-repeat depth dired-subtree-line-prefix))
                           (cond
                            ((eq nil dired-subtree-line-prefix-face)
                             (apply 'concat
                                    (-repeat depth dired-subtree-line-prefix)))
                            ((eq 'subtree dired-subtree-line-prefix-face)
                             (concat
                              dired-subtree-line-prefix
                              (propertize
                               (apply 'concat
                                      (-repeat (1- depth) dired-subtree-line-prefix))
                               'face face)))
                            ((eq 'parents dired-subtree-line-prefix-face)
                             (concat
                              dired-subtree-line-prefix
                              (apply 'concat
                                     (--map
                                      (propertize dired-subtree-line-prefix
                                                  'face
                                                  (intern (format "dired-subtree-depth-%d-face" it)))
                                      (number-sequence 1 (1- depth))))))))
                       (funcall dired-subtree-line-prefix depth)))
        (overlay-put ov 'dired-subtree-name dir-name)
        (overlay-put ov 'dired-subtree-parent parent)
        (overlay-put ov 'dired-subtree-depth depth)
        (overlay-put ov 'evaporate t)
        (push ov dired-subtree-overlays))
      (goto-char beg)
      (dired-move-to-filename)
      (read-only-mode 1)
      (run-hooks 'dired-subtree-after-insert-hook))))

;; *** Dired narrow: show only string matches, then edit only narrowed part

;; '/', type a narrowing string  starts it, 'g' ends the narrowing
;; also see: narrow-or-widen-dwim
(use-package dired-narrow
  :ensure t
  :bind (:map dired-mode-map ("/" . dired-narrow)))

;; ** Find-file and URL
;;
;; find-file is currently overwritten by ido, which is a pain about pasting in full file paths.  Kludge is to type c-f c-f so orig find-file is called, which handles full-paths fine.
;;
;; But ivy just handles it.
;; https://emacs.stackexchange.com/questions/18128/quickly-open-file-by-full-path-in-clipboard
;;
;; TODO: I would like to use ivy but functions below use find-file-other-window and find-file-other-frame, which have no ivy analogs.
;;

;; Avoid extra "file or url" text in minibuf; use ffap only @ valid URL or path
(defun find-file-guessing (arg)
  "Call find-file with file at point if valid. With a universal argument,
 force call to find-file"
  (interactive "P")
  (let ((target (and (not arg) (require 'ffap) (ffap-guesser))))
    (if target
	(ffap)
      (call-interactively 'find-file))))

(defun find-file-guessing-other-window (arg)
  "Call find-file with file at point if valid. With a universal argument,
 force call to find-file"
  (interactive "P")
  (let ((target (and (not arg) (require 'ffap) (ffap-guesser))))
    (if target
	(ffap-other-window)
      (call-interactively 'find-file-other-window))))

(defun find-file-guessing-other-frame (arg)
  "Call find-file with file at point if valid. With a universal argument,
 force call to find-file"
  (interactive "P")
  (let ((target (and (not arg) (require 'ffap) (ffap-guesser))))
    (if target
	(ffap-other-frame)
      (call-interactively 'find-file-other-frame))))

(global-set-key (kbd "C-x C-f") 'find-file-guessing) ; overridden by dired-mode-hook
(global-set-key (kbd "C-x 4 f") 'find-file-guessing-other-window)
(global-set-key (kbd "C-x 5 f") 'find-file-guessing-other-frame)
;;(global-set-key (kbd "C-x f") 'find-file-literally); erases set-fill-column

;; ** Name of file in current buffer (kind of the opposite of ffap)

;; From: http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/  and https://github.com/bbatsov/prelude
(defun copy-current-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(global-set-key (kbd "C-c c") 'copy-current-file-name-to-clipboard) 

;; ** Find recent files
;; *** recentf exclusion of uninteresting files
(setq recentf-exclude '( "/.emacs.bmk$"
			 ".emacs~"
			 "\\.ido.last$" ; ido mode (emacs)
			 "session\\.[a-f0-9]*$" ; emacs
			 "~$" ; emacs (and others) backup
			 "\\.pdfsync$" ; LaTeX
			 "\\.toc" ; LaTeX
			 "\\.aux$" ; LaTeX
			 ))

;; *** Uniquified recentf utils, from: https://gist.github.com/vedang/8645234

;; Implement functionality similar to uniquify to make recentf results bearable
;; Requires s.el and dash.el - awesome libraries from Magnar Sveen
;; Hat-tip : Baishampayan Ghose for the clojure implementation at
;; https://gist.github.com/ghoseb/8432086
(use-package s)     ; was require
(use-package dash)  ; was require

(defun explode (d)
  "Explode a directory name to its subcomponents."
  (s-split "/" d))

(defun tails* (coll acc)
  "Return successive tails of a collection."
  (if (cdr coll)
      (tails* (cdr coll) (cons coll acc))
    (cons coll acc)))

(defun tails (coll)
  "Return successive tails of a collection."
  (tails* coll '()))

(defun paths (d)
  "Given a single directory, return all the possible sub-paths / name
  representations for it."
  (mapcar (lambda (xs) (s-join "/" xs)) (tails (explode d))))

(defun index-coll (tab coll)
  "Given a table and a collection, add each entry of the
  collection into the table. If the key already exists, inc it's
  value by 1"
  (mapcar (lambda (x) (puthash x (+ 1 (gethash x tab 0)) tab)) coll)
  tab)

;; This returns unique filenames of the form subtmp/tmp.org tmp/tmp.org but this messes up sorting since the 1st char comes from the dir, not the basename.  Also, buffer uniquify separates with '|'.  Should ideally match that for consistency.
(defun vm/uniquify (filenames)
  "Given a bunch of filenames (as returned by `recentf-list'),
  simplify the names to make them more easily readable."
  (let* ((expanded-paths (mapcar 'paths filenames))
         (tab (make-hash-table :test 'equal))
         (freqs (mapcar (apply-partially 'index-coll tab) expanded-paths)))
    (mapcar (apply-partially '-first (lambda (x) (= 1 (gethash x tab 0))))
            expanded-paths)))

;; *** My recentf functions
(require 'recentf)

(defun sdo/uniquify-like-buffers (vm-unique-filename)
  "Reformats filenames with smallest unique paths to buffer name style"
  (string-join (reverse (split-string vm-unique-filename "/")) "|"))

;; a modified ido-recentf-open(), from: https://gist.github.com/vedang/8645234
(defun sdo/find-recentf-func (find-file-func)
  "Select a recently visited file with Ido and then find it with FIND-FILE-FUNC.
\n(fn FIND-FILE-FUNC)"
  
  (let* ((unique-filenames (mapcar (lambda (fnm)
                                     (sdo/uniquify-like-buffers fnm))
                                   (vm/uniquify recentf-list)))
         (filename-map (-partition 2 (-interleave unique-filenames
                                                  recentf-list)))
         (short-filename (ido-completing-read "Choose recent file: "
                                              unique-filenames
                                              nil
                                              t)))
    (if (and short-filename (not (equal "" short-filename)))
      (let ((longish-filename (cadr (assoc short-filename filename-map))))
        (if longish-filename
            (funcall find-file-func longish-filename)
          (message "Quit")))
      (message "Quit"))))

(defun sdo/find-recentf ()
  "Find a recent file and put it in current window"
  (interactive)
  (sdo/find-recentf-func 'find-file))

(defun sdo/find-recentf-other-window (arg)
  "Find a recent file and put it in other window"
  (interactive "P")
  (sdo/find-recentf-func 'find-file-other-window))

(defun sdo/find-recentf-other-frame (arg)
  "Find a recent file and put it in other frame"
  (interactive "P")
  (sdo/find-recentf-func 'find-file-other-frame))

(global-set-key (kbd "C-x C-r") 'sdo/find-recentf)
(global-set-key (kbd "C-x 4 r") 'sdo/find-recentf-other-window) ; like find-file
(global-set-key (kbd "C-x 5 r") 'sdo/find-recentf-other-frame)

;; ** Find recent directories
;; From: http://pragmaticemacs.com/emacs/open-a-recent-directory-in-dired-revisited
;; And:  http://stackoverflow.com/questions/23328037/in-emacs-how-to-maintain-a-list-of-recent-directories
(defun bjm/ivy-dired-recent-dirs ()
  "Present a list of recently used directories and open the selected one in dired"
  (interactive)
  (let ((recent-dirs
         (delete-dups
          (mapcar (lambda (file)
                    (if (file-directory-p file)
                        file
                      (file-name-directory file)))
                  recentf-list))))

    (let ((dir (ivy-read "Directory: "
                         recent-dirs
                         :re-builder #'ivy--regex
                         :sort nil
                         :initial-input nil)))
      (dired dir))))

;; Overwrites ido-list-directory, which was less useful than this
(global-set-key (kbd "C-x C-d") 'bjm/ivy-dired-recent-dirs)

;; ** another recent directory: puts dir history in in 'C' and 'R'
;; https://github.com/jixiuf/ivy-dired-history
;; (use-package ivy-dired-history
;;   :config
;;   (require 'savehist)
;;   (add-to-list 'savehist-additional-variables 'ivy-dired-history-variable)
;;   (savehist-mode 1)
;;   ;; or if you use desktop-save-mode
;;   ;; (add-to-list 'desktop-globals-to-save 'ivy-dired-history-variable)
;;   (with-eval-after-load 'dired
;;     (require 'ivy-dired-history)
;;     ;; if you are using ido,you'd better disable ido for dired
;;     ;; (define-key (cdr ido-minor-mode-map-entry) [remap dired] nil) ;in ido-setup-hook
;;     (define-key dired-mode-map "," 'dired)))

;;* Function key bindings
;; ** functions run by function keys
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max) nil))

;; clear any buffer.  Was eshell/clear
;; from http://www.khngai.com/emacs/eshell.php
(defun clear-buffer ()
  "Clear the buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; From: https://gist.github.com/WaYdotNET/700416
;; which has a bunch of other align functions too
(defun align-equals (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end
		(rx (group (zero-or-more (syntax whitespace))) "=") 1 1 ))

;; ** function key assignments
(global-set-key [f1] 'revert-buffer)
(global-set-key [f2] 'vc-dir)
(global-set-key [f3] 'ediff-files)
(global-set-key [f4] 'indent-buffer)
;; (use-package igrep
;;   :config
;;   (setq igrep-options "-i") ; -n is default for igrep
;;   (global-set-key [f5] 'igrep)
;;   (global-set-key [f6] 'igrep-find))
(global-set-key [f5] 'lgrep)
(global-set-key [f6] 'rgrep)
(global-set-key [f7] 'clear-buffer)
(global-set-key [f8] 'compile)
(global-set-key [f9] 'align-equals)
;; f10 reserved for remote desktop (vnc, thinlink, etc.)
;;(global-set-key [f11] 'shell) (make OS-dependent, above)
(global-set-key [f12] 'repeat-complex-command)

;; * Programming Modes
;; ** General purpose programming config

;; determines what mode is entered, based on file extension
(setq auto-mode-alist
      (append
       '(("\\.C$"    . c++-mode)
	 ("\\.H$"    . c++-mode)
	 ("\\.cc$"   . c++-mode)
	 ("\\.cpp$"  . c++-mode)
	 ("\\.hh$"   . c++-mode)
	 ("\\.c$"    . c++-mode)
	 ("\\.cpp$"  . c++-mode)
	 ("\\.h$"    . c++-mode)
	 ("\\.dvc$"  . yaml-mode)
	 ("\\.java$" . java-mode)
	 ("\\.m$" . matlab-mode)
	 ) auto-mode-alist))

;; When saving files, set execute permission if #! is in first line.
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(put 'eval-expression 'disabled nil) ; disabled by default
(global-set-key "\e;" 'comment-line) ; like dwim but better: no region, cmmnt repeats

;; does this make org-mode slower?  If so, disable it like this: http://stackoverflow.com/questions/24814988/emacs-disable-auto-complete-in-python-mode
(use-package auto-complete
  :diminish auto-complete-mode
  :diminish global-auto-complete-mode
  :diminish auto-complete-minor-mode
  :config (global-auto-complete-mode))

;; so M-n and M-p look for symbol at point.  Is redundant with highlight-thing
;; also can replace like iedit, M-' globally and C-u M-' within defun (after M-n or M-p)
;; Note that I've remapped er\iedit to iedit-within-defun
;; From https://github.com/itsjeyd/emacs-config/blob/emacs24/init.el
(use-package smartscan
  :defer t
  :config (global-smartscan-mode t))

;; works but not narrowed to defun, can't edit symbol by just typing, like in Matlab
;; (use-package auto-highlight-symbol
;;   :init
  ;;   (global-auto-highlight-symbol-mode))

;; *** Ediff

;; TODO report ediff 'm' bug: Typing 'm' in ediff minibuffer spreads
;; emacs across a width equal to both dual monitors, although emacs's
;; left edge is always put on the left edge of the right monitor, even
;; if it was originally in the left monitor

;; Do not pop up a separate window "frame" for ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; Avoid folding headlines when ediffing org-mode
;; from: https://emacs.stackexchange.com/questions/21335/prevent-folding-org-files-opened-by-ediff
(add-hook 'ediff-prepare-buffer-hook #'outline-show-all)

;; *** Outshine: org-mode like headlines in programming and other modes
(use-package outshine
;; this works if I run it from inside .emacs but not after a clean start  
;;  :bind (:map outline-minor-mode-map ("S-<tab>" . outshine-cycle-buffer))
  :diminish outline-mode
  :diminish outline-minor-mode
  :config
  (add-hook 'outline-minor-mode-hook 'outshine-mode) ; for outshine itself
  (add-hook 'prog-mode-hook 'outline-minor-mode)     ; all prog modes
  ;; from https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-outshine.el
  (bind-keys
   :map outline-minor-mode-map
   ("<backtab>" . outshine-cycle-buffer))) ;Global cycle using S-TAB
  
;; *** Vertical indent lines in programming modes
(use-package highlight-indent-guides
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character)) ; nicest, thinnest lines

;; ** Matlab mode

;; Got errors about obsolete code when I first isntalled this in packages. Note that abo-abo says that this package is no longer maintained (but did he meant THIS package or is THIS package actually his package? the 'matlab' package below is 'matlab-emacs' in sourceforge).  Anyway, abo-abo has a new matlab package, maybe worth trying.

;; started from: https://github.com/thisirs/dotemacs/blob/master/lisp/init-matlab.el
(use-package matlab 
  :ensure matlab-mode
  :mode ("\\.m$" . matlab-mode)
  :commands (matlab-shell)
  :config
  (setq matlab-shell-command "matlab")
  (setq matlab-shell-command-switches '("-nodesktop" "-nosplash"))

  ;; Don't switch to figure window
  (setenv "WINDOWID" (frame-parameter (selected-frame) 'outer-window-id))

  (setq-default matlab-change-current-directory t)
  (setq-default matlab-functions-have-end t)
  (setq-default matlab-indent-function-body 'guess)
  (setq matlab-indent-end-before-return t)

  ;;(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist)) ; in big list already
  (defun my-matlab-mode-hook ()
    (local-set-key "\M-j" #'join-to-next-line)
    (local-set-key "\M-;" 'comment-dwim)
    (auto-fill-mode -1)
    (setq fill-column 80)		; where auto-fill should wrap
    (define-key matlab-mode-map [f1] 'matlab-fill-paragraph) ; override global
    (define-key matlab-mode-map "\e;" 'comment-dwim) ; override matlab's commenter
    )
  (setq matlab-mode-hook 'my-matlab-mode-hook)

  ;;so matlab R12 runs in emacs and don't get a splash over remote connections prevents error messages from starting GUI but then plots don't work
  (setq matlab-shell-command-switches '("-nodesktop -nosplash"))

  (defun matlab-shell-fix-slowness ()
    (remove-hook 'comint-output-filter-functions 'matlab-shell-render-html-anchor t)
    (remove-hook 'comint-output-filter-functions 'matlab-shell-render-errors-as-anchor t))
  (add-hook 'matlab-shell-mode-hook #'matlab-shell-fix-slowness))

(provide 'init-matlab)

;; ** elisp
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (set (make-local-variable 'dabbrev-case-fold-search) nil)
	     (set (make-local-variable 'dabbrev-case-replace) nil)))

;; ** C/C++
;; note: connect to common hook used by new cc-mode
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (set (make-local-variable 'dabbrev-case-fold-search) nil)
	     (set (make-local-variable 'dabbrev-case-replace) nil)))

;;; cc-mode.el Customizations for both c-mode and c++-mode
(require 'cc-mode)  ; needed so c-default-style (below) is defined
(setq c-default-style "stroustrup") ; good but overwrites c-basic-offset to 4
(setq c-basic-offset 2)  ; indents are multiples of this

(defun my-c-mode-common-hook ()
  (c-toggle-auto-hungry-state 1) ; not sure what this does
  (setq c-tab-always-indent nil) ;; so tab key, after first token, works as tab
  (setq c-basic-offset 2)  ; indents are multiples of this
  (define-key c++-msode-map "\C-c\C-L" 'ifdef-line)
  (define-key c++-mode-map "\C-c\C-R" 'ifdef-region))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; for commenting out a line or region of C-code
(defun ifdef-line()
  "Surround a line of a C program with #if 0 and #endif."
  (interactive)
  (beginning-of-line)
  (insert "#if 0 /*----------------------------------------------------------------*/\n")
  (next-line 1)
  (insert "#endif /*---------------------------------------------------------------*/\n"))
(defun ifdef-region(start end)
  "Surround a region of a C program with #if 0 and #endif."
  (interactive "r")
  (goto-char end)
  (beginning-of-line)
  (insert "#endif /*------------------------------------------------------*/\n")
  (goto-char start)
  (beginning-of-line)
  (insert "#if 0 /*------------------------------------------------------*/\n")
  (goto-char end)
  (next-line 2))

(use-package xcscope ; Source code brower like etags but better
  :config
  (define-key cscope-list-entry-keymap "q" 'quit-window)) ; so quits like dired

;; ** Python

;; needed by elpy & py-cmd autofix-on-save
(setq pythonbin (sdo/find-exec "python"
                           "Is needed by elpy & py-python autofix-on-save"))

(setq autopep8bin (sdo/find-exec "autopep8"
                             "Is needed by elpy & py-autopep8 autofix-on-save"))
(when autopep8bin (use-package py-autopep8))

;; Use Elpy instead of python-mode.
;; REQUIRES AT LEAST THESE PYTHON LIBS: jedi flake8 autopep8
;; See: 
;; https://github.com/jorgenschaefer/elpy
;; docs: https://elpy.readthedocs.io/en/latest/index.html
;; run python in buffer with C-c C-c, once elpy-mode is enabled

;; TODO: verify that python jedi being installed (if not will elpy will look for it and hant itself (as of Sept 9, 2019)
;;       pip show jedi
;; seems to work even if pkg was installed by conda

(sdo/find-exec "flake8" "Is needed by elpy for code checks")

(use-package flycheck-pos-tip)

(use-package elpy
  :defer t
  :init
  (elpy-enable)
  ;; jupyter recommended over ipython (how s/ this work w/ conda env switch?):
  ;; https://elpy.readthedocs.io/en/latest/ide.html#interpreter-setup
  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters
               "jupyter")
  
  ;; use flycheck, not elpy's flymake
  ;; (https://realpython.com/blog/python/emacs-the-best-python-editor/)
  ;; To use flycheck for over 40 languages, do this:
  ;;   (global-flycheck-mode)
  (use-package flycheck)
  (when (require 'flycheck nil t)
    (progn (message "found flycheck package")
           (flycheck-pos-tip-mode)
           (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
           (add-hook 'elpy-mode-hook 'flycheck-mode)))

  (define-key python-mode-map (kbd "C-c i") 'elpygen-implement)

  (if autopep8bin
      (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)))

;; So C-c i generates a python function/method stub from symbol @ point
(use-package elpygen) ; seems to be separate from elpy, despite the name

;; for Python mode comment filling
;; https://stackoverflow.com/questions/2214199/how-to-use-emacs-to-write-comments-with-proper-indentation-line-length-and-wra
(require 'newcomment)
(add-hook 'python-mode-hook (progn
                              (setq comment-auto-fill-only-comments 1)
                              (setq-default auto-fill-function 'do-auto-fill)))

;; (use-package anaconda-mode  ;; elpy alternative?
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode))


;; ;; I haven't managed to get conda package to work, lately
;; ;; working with python anaconda environments (is also customized)
;; ;; my anaconda isn't at conda's expected place (~/.anaconda3) so here, I expect that I have set the ANACONDA_HOME environment variable to whatever anaconda is installed on this machine.
;; (setq conda-home-dir (getenv "ANACONDA_HOME"))
;; (message "conda-home-dir = %s" conda-home-dir)
;; (use-package conda
;;   :defer t
;;   :init
;;   ;; if you want interactive shell support, include:
;;   (conda-env-initialize-interactive-shells)
;;   ;; if you want eshell support, include:
;;   (conda-env-initialize-eshell)
;;   ;; auto activation causes the emacs startup error "Error: (error "elpy-use-ipython is deprecated; see https://elpy.readthedocs.io/en/latest/ide.html#interpreter-setup")"
;;   ;; this is on elpy 1.18.0
;;   ;; if you want auto-activation (see below for details), include:
;;   ;; (conda-env-autoactivate-mode t) ;; avoid annoying messages, do by hand
;;   )

;; (use-package python ; does this work w/ elpy?
;;   :defer t
;;   :config
;;   (define-key python-mode-map (kbd "<backtab>") 'python-back-indent))

;; conflicts with attempt to run jupyter?
;; This doesn't seem to help make editing .ipynb files any better
;; maybe babel is better, esp. w/ ob-ein ?
;; https://www.reddit.com/r/emacs/comments/a43l0i/emacs_with_jupyter_notebooks/
(use-package ein
  :ensure t
  :commands (ein:notebooklist-open))

;; ** Perl

;; Use CPerl mode instead of perl-mode (both come with emacs)
(require 'cperl-mode) ; so keymap stuff below works
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))
(defalias 'perl-mode 'cperl-mode)

(define-key cperl-mode-map [f1] 'cperl-fill-paragraph)

(require 'compile)
(add-to-list 'compilation-error-regexp-alist
	     '(".* \\([-a-zA-Z._/]+\\) line \\([0-9]+\\)." 1 2))

(add-hook 'cperl-mode-hook
	  (lambda ()
	    (set (make-local-variable 'compile-command)
		 (format "perl -cw %s"
			 (file-name-nondirectory buffer-file-name)))))

;; ** VC source code control

(eval-after-load "vc-hooks"
  '(define-key vc-prefix-map "=" 'vc-ediff)) ; so C-x v = will use ediff

;; ** R language
(use-package ess
  :defer t ; avoid long init during emacs startup
  :config
  (setq ess-ask-for-ess-directory nil)
  (setq ess-local-process-name "R")

  ;; SO NOTE: a bug makes this not work when R isn't already started:
  ;; error is: "> Error: unexpected '>' in ">"
  (defun my-ess-start-R ()
    (interactive)
    (if (not (member "*R*" (mapcar (function buffer-name) (buffer-list))))
        (progn
          (delete-other-windows)
          (setq w1 (selected-window))
          (setq w1name (buffer-name))
          (setq w2 (split-window w1 nil t))
          (R)
          (set-window-buffer w2 "*R*")
          (set-window-buffer w1 w1name))))

  ;; almost works, but doesn't switch to R buffer like similar R func in C-ret
  (defun my-ess-eval ()
    (interactive)
    (my-ess-start-R)
    (if (and transient-mark-mode mark-active)
        (call-interactively 'ess-eval-region)
      (call-interactively 'ess-eval-buffer)))
  (add-hook 'ess-mode-hook
            '(lambda()
               (local-set-key [(shift return)] 'my-ess-eval)))
               ;; but flycheck does nothing if I vist an R file.  Need to do some extra config?
;;               (flycheck-mode t)))

  (add-hook 'inferior-ess-mode-hook
            '(lambda()
               ;; Make up/down arrows search cmd history like tcsh
               (define-key inferior-ess-mode-map [up]
                 'comint-previous-matching-input-from-input)
               (define-key inferior-ess-mode-map [down]
                 'comint-next-matching-input-from-input)))

  ;; ESS autocomplete support
  ;; http://ess.r-project.org/Manual/ess.html#Auto_002dcomplete
  ;; setup will take too much time?
  (setq ess-use-auto-complete 'script-only))

(use-package ess-R-data-view :after ess)
(use-package ess-smart-equals :after ess)
(use-package ess-smart-underscore :after ess)
(use-package ess-view :after ess)

;; ** Ruby
(add-hook 'ruby-mode-hook
	  (lambda ()
	    (set (make-local-variable 'compile-command)
		 (format "ruby -cw %s"
			 (file-name-nondirectory buffer-file-name)))))

;; ** gud debugger
(add-hook 'gud-mode-hook
	  '(lambda ()
             ;; conflicts w/ other home bindings...
	     (local-set-key [home]   ; move to beginning of line, after prompt
			    'comint-bol)
	     (local-set-key [up]     ; cycle backward through command history
			    '(lambda () (interactive)
			       (if (comint-after-pmark-p)
				   (comint-previous-input 1)
				 (previous-line 1))))
	     (local-set-key [down]    ; cycle forward through command history
			    '(lambda () (interactive)
			       (if (comint-after-pmark-p)
				   (comint-next-input 1)
				 (forward-line 1))))))

;; ** C#

(use-package csharp-mode)
(use-package omnisharp
  :after csharp-mode
  :after company)

;; Inspired by: https://github.com/OmniSharp/omnisharp-emacs

;; maybe this can go inside of use-package ominsharp?
(eval-after-load
  'company
  '(add-to-list 'company-backends #'company-omnisharp))

(defun my-csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (electric-pair-local-mode 1) ;; Emacs 25
  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)

;; ** YAML

(use-package yaml-mode
  :mode ("\\.yml$" "\\.dvc$")) ;; data version control (DVC) files

;; * Narrowing
;; Default emacs narrowing has too many keys: wipe them out and make
;; it a toggle from
;; http://endlessparentheses.com/emacs-narrow-or-widen-dwim.html (has
;; a bunch of other toggles, maybe handy but I'll stick w/ this for
;; now) Could also try recursive-narrow:
;; https://marmalade-repo.org/packages/recursive-narrow
;;
;; Note that dired-narrow is different, narrows based on search terms

(defun narrow-or-widen-dwim (p)
  "Widen if buffer is narrowed, narrow-dwim otherwise.
Dwim means: region, org-src-block, org-subtree, or
defun, whichever applies first. Narrowing to
org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer
is already narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
	((region-active-p)
	 (narrow-to-region (region-beginning)
			   (region-end)))
	((derived-mode-p 'org-mode)
	 ;; `org-edit-src-code' is not a real narrowing
	 ;; command. Remove this first conditional if
	 ;; you don't want it.
	 (cond ((ignore-errors (org-edit-src-code) t)
		(delete-other-windows))
	       ((ignore-errors (org-narrow-to-block) t))
	       (t (org-narrow-to-subtree))))
	((derived-mode-p 'latex-mode)
	 (LaTeX-narrow-to-environment))
	(t (narrow-to-defun))))
;; Wipes out Emacs' entire narrowing keymap. Now there's only a toggle.
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)

;; * Org Mode
;; ** Org Basic Config

(use-package org
  :ensure org-plus-contrib ; fewer clean install errors, still must restart 3X
  :pin org
  :diminish org-mode  ;; doesn't hide the "Org" in modeline, for some reason
  :config
  (define-key global-map "\C-cl" 'org-store-link)
  (global-set-key (kbd "C-c L") 'org-insert-link-global) ; insert in any buffer
  (global-set-key (kbd "C-c o") 'org-open-at-point-global) ; open in any buffer
  (global-set-key "\C-cb" 'org-iswitchb) ; switch between org buffers
  ;;(global-set-key "\C-cc" 'org-capture) ; ovewrites org-ref-bibtex bindings
  ;;(define-key global-map "\C-ca" 'org-agenda) ; I don't use agenda

  ;; Unbind standard org keys so can always use for buffer-move
  (define-key org-mode-map (kbd "<C-S-up>") nil) ; was timestamp clock up sync
  (define-key org-mode-map (kbd "<C-S-down>") nil) ; was timestamp clck dwn sync
  (define-key org-mode-map (kbd "<C-S-left>")  nil) ; was switch TODO set
  (define-key org-mode-map (kbd "<C-S-right>") nil) ; was switch TODO set

  ;; open docx files in default application (ie msword)
  ;; https://emacs.stackexchange.com/questions/22485/org-mode-pandoc-export-to-docx-and-open
  (setq org-file-apps
      '(("\\.docx\\'" . default)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . default)
        ("\\.pdf\\'" . default)
        (auto-mode . emacs)))
  
  ;; Nicer bullets for non-headline lists (does this slow down org mode?)
  ;; others: https://www.w3schools.com/charsets/ref_utf_symbols.asp
  ;; ◇ ▷ ◈ ◎ ☆ ★ ☉ ♢ ♦ ━ ─ ⊣ ▬ ⊲ ✔ ✤ ✥ ✩ ✦ ✪ ✱ ✸ ✽ ➜ ➤
  (font-lock-add-keywords
   'org-mode
   '(("^ +\\(-\\) "
      (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "▬"))))
     ("^ +\\(*\\) "
      (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "✤")))))))

 (use-package org-bullets
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode)
  :config
  (setq org-bullets-bullet-list
        '("●" "●" "￭" "￭" "￮" "￮" "▪" "▪" "▸" "▸" "•" "•")))

(use-package org-autolist ; new - or -[ ] w/ return
  :after org
  :diminish org-autolist-mode
  :config
  (add-hook 'org-mode-hook #'org-autolist-mode)) 

;; Quick org emphasis:  Select text & hit key below. smart-region pkg helps.
;; Handy using er/expand, mapped to C-=
(use-package wrap-region
  :diminish wrap-region-mode
  :diminish wrap-region-minor-mode
  :config
  (add-hook 'org-mode-hook #'wrap-region-mode)
  (wrap-region-add-wrapper "*" "*" nil 'org-mode)  ; bold
  (wrap-region-add-wrapper "/" "/" nil 'org-mode)  ; italics
  (wrap-region-add-wrapper "_" "_" nil 'org-mode)  ; underline
  (wrap-region-add-wrapper "=" "=" nil 'org-mode)  ; literal
  (wrap-region-add-wrapper "~" "~" nil 'org-mode)  ; code
  (wrap-region-add-wrapper "+" "+" nil 'org-mode)) ; strikeout

(use-package org-cliplink ; make hyper link from URL in clipboard
  :config (define-key org-mode-map (kbd "C-c y") 'org-cliplink))

;; ** Org-ref

;; org-ref commented out b/c it produces and error as soon as the 1st cite: link is encounted (and this makes org-bullets not work)

;; --setup from org-ref website---------------------------------

;; the CRASH HAPPENS EVEN IF I HAVE ONLY THE LINE BELOW in my .init
;; and the crash is on the 1st cite:link in my .bib
;; (require 'org-ref)

;; ;; see org-ref for use of these variables
;; (setq org-ref-bibliography-notes (expand-file-name "notes.org" docDir)
;;       org-ref-default-bibliography '((expand-file-name "energy.bib" docDir))
;;       org-ref-pdf-directory '((expand-file-name "papers" docDir)))

;; ;; for helm key completion
;; ;; (setq bibtex-completion-bibliography "~/Dropbox/bibliography/references.bib"
;; ;;       bibtex-completion-library-path "~/Dropbox/bibliography/bibtex-pdfs"
;; ;;       bibtex-completion-notes-path (expand-file-name "notes.org" docDir))

;; ;;Adding this stuff from the org-ref page DOESN'T HELP
;; (setq reftex-default-bibliography org-ref-default-bibliography)

;; --original org-ref setup-------------------------------------
;; org-ref causes an error when emacs reads the 1st org-ref cite: link.  The .org file is still read, but org-bullets fails then, for some reason.

;; ; packages required by org-ref but not picked up, for some reason
;; (use-package helm-bibtex)
;; (use-package pdf-tools)

;; Inspiration: https://github.com/bixuanzju/emacs.d/blob/master/emacs-init.org
;; (use-package org-ref
;;   :after org
;;   :init
;;   (let ((default-directory docDir))
;;     (setq org-ref-bibliography-notes (expand-file-name "notes.org")
;;           org-ref-default-bibliography (expand-file-name "energy.bib")
;;           org-ref-pdf-directory (expand-file-name "papers")
;;           reftex-default-bibliography org-ref-default-bibliography
;;     ;;       bibtex-completion-bibliography org-ref-default-bibliography
;;     ;;       bibtex-completion-library-path org-ref-pdf-directory
;;     ;;       bibtex-completion-notes-path org-ref-bibliography-notes
;;           ))
;;   ;; ;; showing broken links slowed down energytop.org (but much less in Oct. 2017)
;;   ;; ;;  https://github.com/jkitchin/org-ref/issues/468
;;   (setq org-ref-show-broken-links nil) ;still need to prohibit broken link show?
;;   :config
;;   (define-key bibtex-mode-map "\C-cj" 'org-ref-bibtex-hydra/body)
;;   ;; bibtex-key generator: firstauthor-year-title-words (from bixuanzju)
;;   (setq bibtex-autokey-year-length 4
;;         bibtex-autokey-name-year-separator "-"
;;         bibtex-autokey-year-title-separator "-"
;;         bibtex-autokey-titleword-separator "-"
;;         bibtex-autokey-titlewords 2
;;         bibtex-autokey-titlewords-stretch 1
;;         bibtex-autokey-titleword-length 5)
;;    ;; org-ref causes an error when emacs reads the 1st org-ref cite: link.  The .org file is still read, but org-bullets fails then, for some reason.
;; ;;   ;; Make org-ref cite: link folded in emacs.  Messes up Latex export:
;; ;;   ;; https://github.com/jkitchin/org-ref/issues/345#issuecomment-262646855
;;   (org-link-set-parameters "cite" :display nil)
;; )

;; Unfortunately, this may screw up linking to techreports:
;; https://github.com/jkitchin/org-ref/issues/205
;; at least they work after I comment it out
;;(bibtex-set-dialect 'biblatex); so org-ref can recognize more entry types e.g. patent
 
;; ** Org Mode Dedicated Targets
(require 'org)

;; --- Hide org-mode dedicated targets -----------------------------------------
;; Hides the <<>> around dedicated targets; the face of the remaining visible text is set by customizing the face: org-target
;; Inspiration: https://emacs.stackexchange.com/questions/19230/how-to-hide-targets
;; but regexp there worked only for all :alnum: targets.  I tried to invert org-target-regexp but couldn't get that to work, so here, I'm just matching printable chars in the middle.
(defcustom org-hidden-links-additional-re "\\(<<\\)[[:print:]]+?\\(>>\\)"
  "Regular expression that matches strings where the invisible-property of the sub-matches 1 and 2 is set to org-link."
  :type '(choice (const :tag "Off" nil) regexp)
  :group 'org-link)
(make-variable-buffer-local 'org-hidden-links-additional-re)

(defun org-activate-hidden-links-additional (limit)
  "Put invisible-property org-link on strings matching `org-hide-links-additional-re'."
  (if org-hidden-links-additional-re
      (re-search-forward org-hidden-links-additional-re limit t)
    (goto-char limit)
    nil))

(defun org-hidden-links-hook-function ()
  "Add rule for `org-activate-hidden-links-additional' to `org-font-lock-extra-keywords'.
You can include this function in `org-font-lock-set-keywords-hook'."
  (add-to-list 'org-font-lock-extra-keywords
	       '(org-activate-hidden-links-additional
		 (1 '(face org-target invisible org-link))
		 (2 '(face org-target invisible org-link)))))

(add-hook 'org-font-lock-set-keywords-hook #'org-hidden-links-hook-function)

;; IMPROVEMENT: Parse headlines w/ links in them; give option for clean target text
;; IMPROVEMENT: Make this work for across files, like jkitchn's better-link thing
(defun create-and-link-dedicated-org-target (callPrefix)
  "Makes or reads a dedicated org-mode link target (<<X>>) and puts an internal link to it ([[X]]) into the kill ring; you can reference the target somewhere else by pasting the link.

Where the target goes:
  No prefix
    Region Selected: region is replaced with the new target;
    Cursor on existing target: target is only read: no buffer changes;
    Cursor on headline: headline text is replaced with new target;
    Otherwise: the user is prompted to enter the target text and a
               new full target is inserted at point.
  C-u prefix
    Region Selected: new target is placed to the right of the region;
    Cursor on existing target: target is only read: no buffer changes;
    Cursor on headline: headline text becomes the target text, and the full
                        target is inserted on the line below the headline;
    Otherwise: the user is prompted to enter the target text and a
               new full target is inserted at point.
This function avoids making messed up targets by exiting without doing anything if the target text would contain link or target symbols."
  (interactive "p")

  (if (eq major-mode 'org-mode)
      (let* ((separatePaste (eq callPrefix 4))
	     (targBdy
	      (cond
	       (mark-active
		(funcall region-extract-function nil))
	       ((org-at-target-p)
		(save-excursion
		  (let* ((p1 (progn (skip-chars-backward "^<“") (point)))
			 (p2 (progn (skip-chars-forward  "^>”") (point))))
		    (buffer-substring p1 p2))))
	       ((org-at-heading-p)
		(or (nth 4 (org-heading-components))
		    (read-string "Target text: ")))
	       (t
		(read-string "Target text: "))
	       ))
	     (targDclr (concat "<<" targBdy ">>")))

	(if (string-match "\\(\\[\\[\\)\\|\\(]]\\)\\|\\(<<\\)\\|\\(>>\\)" targBdy)
	    (message
	     "Found link/target symbols ([[,]],<<,>>): Manually select region?")
	  (unless (org-at-target-p)
	    (cond
	     (mark-active
	      (if separatePaste
		  (progn (goto-char (region-end))
			 (insert (format " %s" targDclr)))
		(delete-region (region-beginning) (region-end))
		(insert targDclr)
		(deactivate-mark)))
	     ((org-at-heading-p)
	      (if separatePaste
		  (progn (end-of-line)
			 (insert (format "\n%s" targDclr))
			 (org-indent-line))
		(org-edit-headline targDclr)))
	     (t
	      (insert targDclr))))

	  (kill-new (concat "[[" targBdy "]]"))
	  ))
    (message "Not in org-mode buffer")
    ))
(global-set-key "\em" 'create-and-link-dedicated-org-target)

;; ** Display whole subtree using :PROPERTIES:

;; Keeps tree open if property set, but property drawer is left hanging open (but see above?)
;;From: https://emacs.stackexchange.com/questions/36232/org-mode-property-to-make-subtree-visibility-bimodal/36273

(advice-add 'org-cycle :around #'my/org-cycle)

(defun my/toggle-bimodal-cycling (&optional pos)
  "Enable/disable bimodal cycling behavior for the current heading."
  (interactive)
  (let* ((enabled (org-entry-get pos "BIMODAL-CYCLING")))
    (if enabled
        (org-entry-delete pos "BIMODAL-CYCLING")
      (org-entry-put pos "BIMODAL-CYCLING" "yes"))))

(defun my/org-cycle (fn &optional arg)
  "Make org outline cycling bimodal (FOLDED and SUBTREE) rather than trimodal (FOLDED, CHILDREN, and SUBTREE) when a heading has a :BIMODAL-CYCLING: property value."
  (interactive)
  (if (and (org-at-heading-p)
           (org-entry-get nil "BIMODAL-CYCLING"))
      (my/toggle-subtree)
    (funcall fn arg)))

(defun my/toggle-subtree ()
  "Show or hide the current subtree depending on its current state."
  (interactive)
  (save-excursion
    (outline-back-to-heading)
    (if (not (outline-invisible-p (line-end-position)))
        (outline-hide-subtree)
      (outline-show-subtree))))

;; this does hide the drawers on open but it doesn't close ANYTHING on the 2nd cycle
(defun my/toggle-subtree-hide-drawers ()
  "Show or hide the current subtree depending on its current state."
  (interactive)
  (save-excursion
    (outline-back-to-heading)
    (if (not (outline-invisible-p (line-end-position)))
        (outline-hide-subtree)
      (progn (outline-show-subtree)
             (org-cycle-hide-drawers 'children)))))

;; Converts lines to checkboxes; convert them to TODO's with: C-c C-*
;; https://stackoverflow.com/questions/18667385/convert-lines-of-text-into-todos-or-check-boxes-in-org-mode
(defun org-set-line-checkbox (arg)
  (interactive "P")
  (let ((n (or arg 1)))
    (when (region-active-p)
      (setq n (count-lines (region-beginning)
                           (region-end)))
      (goto-char (region-beginning)))
    (dotimes (i n)
      (beginning-of-line)
      (insert "- [ ] ")
      (forward-line))
    (beginning-of-line)))

;;(global-set-key [C-f1] 'my/toggle-subtree) 
;;(global-set-key [C-f2] 'my/toggle-subtree) 

;; ** Hide :PROPERTIES: Drawer

;; From:
;;https://stackoverflow.com/questions/17478260/completely-hide-the-properties-drawer-in-org-mode

;; The following answer completely hides everything from :PROPERTIES: through :END:. It can be tested by evaluating (org-cycle-hide-drawers 'children), or (org-cycle-hide-drawers 'all), or in conjunction with the other functions relating to cycling the outline views. The standard functions to unfold that are included within the org-mode family all work -- e.g., show-all; org-show-subtree; etc.

(require 'org)

(defun org-cycle-hide-drawers-all ()
  "Rehide all drawers in buffer after a visibility state change."
  (interactive)
  (org-cycle-hide-drawers 'all))

(defun org-cycle-hide-drawers-children ()
  "Rehide drawers in children in this tree after a visibility state change."
  (interactive)
  (org-cycle-hide-drawers 'children))

(defun org-cycle-hide-drawers (state)
  "Re-hide all drawers after a visibility state change."
  (when (and (derived-mode-p 'org-mode)
             (not (memq state '(overview folded contents))))
    (save-excursion
      (let* ((globalp (memq state '(contents all)))
             (beg (if globalp
                    (point-min)
                    (point)))
             (end (if globalp
                    (point-max)
                    (if (eq state 'children)
                      (save-excursion
                        (outline-next-heading)
                        (point))
                      (org-end-of-subtree t)))))
        (goto-char beg)
        (while (re-search-forward org-drawer-regexp end t)
          (save-excursion
            (beginning-of-line 1)
            (when (looking-at org-drawer-regexp)
              (let* ((start (1- (match-beginning 0)))
                     (limit
                       (save-excursion
                         (outline-next-heading)
                           (point)))
                     (msg (format
                            (concat
                              "org-cycle-hide-drawers:  "
                              "`:END:`"
                              " line missing at position %s")
                            (1+ start))))
                (if (re-search-forward "^[ \t]*:END:" limit t)
                  (outline-flag-region start (point-at-eol) t)
                  (user-error msg))))))))))

;; ** Org Export

(use-package ox-minutes :defer 5) ; nice(er) ascii export, but slow start

;; (use-package ox-pandoc
;;   :ensure t
;;   :after ox
;;   :defer t
;;   :config
;;   ;; default options for all output formats
;;   (setq org-pandoc-options '((standalone . t))
;;         ;; cancel above settings only for 'docx' format
;;         org-pandoc-options-for-docx '((standalone . nil))))
;; ;;        ;; special settings for beamer-pdf and latex-pdf exporters
;; ;;        org-pandoc-options-for-beamer-pdf '((pdf-engine . "xelatex"))
;; ;;        org-pandoc-options-for-latex-pdf '((pdf-engine . "xelatex"))))

;; I couldn't get pandoc to work after converting .emacs to use-package.  I had two problems
;;
;; 1.) On my SP4 with a clean install, I got the error "ox-pandoc was not provided"
;; 2.) on my work laptop, I somehow didn't see this, but no pandoc functions showed up on the org-export-dispatch list either.
;;
;; ;; Pandoc
;; ;; default options for all output formats. Intially from: https://github.com/kawabata/ox-pandoc
(use-package ox-pandoc
  :init
  (setq org-pandoc-options '((standalone . t)))
  ;; cancel above settings only for 'docx' format
  (setq org-pandoc-options-for-docx '((standalone . nil)))
  ;; special settings for beamer-pdf and latex-pdf exporters
  (setq org-pandoc-options-for-beamer-pdf '((latex-engine . "pdflatex")))
  (setq org-pandoc-options-for-latex-pdf '((latex-engine . "pdflatex")))
  ;; (setq org-pandoc-options-for-beamer-pdf '((latex-engine . "xelatex")))
  ;; (setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")))
  :config
  ;; the below did not help after org-mode use of use-package, and may have messed up startup on a clean install
  ;;
  ;; Delay loading but let org-export-dispatch menu still see it.  Actually, unless I do this, I don't see pandoc in the menu at all.  From https://github.com/kawabata/ox-pandoc/issues/7
  (with-eval-after-load 'ox (require 'ox-pandoc)))

;; * Writing Tools
;; ** General Editing

(setq next-line-add-newlines nil) ; don't create newlines for arrows @ buff end
;; use spaces instead of tabs so other programs see indentation correctly
(setq-default indent-tabs-mode nil)

;; handy gnu things which for some reason are disabled by default for some reason
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(defun insert-date-string ()  "Insert a nicely formated date string."
       (interactive)
       (insert (format-time-string "%Y-%m-%d")))
(global-set-key (kbd "C-c i") 'insert-date-string)

(add-hook 'text-mode-hook
	  '(lambda ()
	     (set (make-local-variable 'dabbrev-case-fold-search) t)
	     (set (make-local-variable 'dabbrev-case-replace) t)))

;; ** Writing and editing

;; Run Google translate. There are tons of customizations
;; https://github.com/atykhonov/google-translate
(global-set-key "\C-ct" 'google-translate-smooth-translate)
;; use C-n to switch language translation direction
(setq google-translate-translation-directions-alist '(("en" . "de") ("de" . "en")))

;; Word counting
(defun count-words-buffer ()
  "Print number of words in the buffer."
  (interactive)
  (count-words-region (point-min) (point-max)))

(defun count-words-region (beginning end)
  "Print number of words in the region."
  (interactive "r")
  (message "Counting words in region ... ")

  (save-excursion ; 1. Set up appropriate conditions.
    (let ((count 0))
      (goto-char beginning)

      (while (and (< (point) end) ; 2. Run the while loop.
		  (re-search-forward "\\w+\\W*" end t))
	(setq count (1+ count)))

      (cond ((zerop count) ; 3. Send a message to the user.
	     (message
	      "The region does NOT have any words."))
	    ((= 1 count)
	     (message
	      "The region has 1 word."))
	    (t
	     (message
	      "The region has %d words." count))))))

(global-set-key "\C-c\C-b" 'count-words-buffer)

(use-package flyspell-correct
  :config
  (require 'flyspell-correct-ido)
  (define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-previous-word-generic))

;; finds repeated words
(defun find-find-word-word ()
  (interactive)
  (re-search-forward "\\b\\(\\w+\\)\\W+\\1\\b"))
;; (global-set-key "\e=" 'find-find-word-word) ; use this for goto-line-with-feedback

(use-package writegood-mode
  :config
  (global-set-key "\C-cg" 'writegood-mode)
  (global-set-key "\C-c\C-gg" 'writegood-grade-level)
  (global-set-key "\C-c\C-ge" 'writegood-reading-ease))


;; https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org
;; do I like this?
(use-package artbollocks-mode
  :defer t
  :config
  (setq artbollocks-weasel-words-regex
        (concat "\\b" (regexp-opt
                       '("one of the"
                         "should"
                         "just"
                         "sort of"
                         "a lot"
                         "probably"
                         "maybe"
                         "perhaps"
                         "I think"
                         "really"
                         "pretty"
                         "nice"
                         "action"
                         "utilize"
                         "leverage") t) "\\b"))
  ;; Don't show the art critic words, or at least until I figure
  ;; out my own jargon
  (setq artbollocks-jargon nil))

(defun toggle-writing-tools ()
  "Enable/disable writing and proofing tools"
  (interactive)
  ;; why don't these modes turn off when this function is called twice?  They do when called individually and interactively
  (flyspell-mode)
  (writegood-mode)
  (artbollocks-mode)) ;; do I like this?
  
(global-set-key (kbd "C-c W") 'toggle-writing-tools)

;; ** Latex

;; Hack: (use-package auctex) doesn;t work because, "once installed, auctex overrides the tex package":
;; http://cachestocaches.com/2015/8/getting-started-use-package/
(use-package tex :defer t :ensure auctex) ; a hack for auctex
(use-package auctex-latexmk :defer t)

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (define-key LaTeX-mode-map "\C-xn"
	      nil)))

;; Faster latex entry: http://orgmode.org/manual/CDLaTeX-mode.html#CDLaTeX-mode
;;
;; When scimax/org-return, maybe use it instead.  May go back to this if the two are merged.
(use-package cdlatex
  :diminish org-cdlatex-mode
  :config (add-hook 'org-mode-hook 'turn-on-org-cdlatex))

;; * Emacs Command Execution

;; undo-tree was useful once in a while, but it was buggy on 19.03.21 so I removed it.
;; C-/ is like old undo, C-? is redo.  C-x u visualizes an undo tree, q to exit
;; (use-package undo-tree
;;   :diminish undo-tree-mode
;;   :config
;;   (global-undo-tree-mode)
;;   (setq undo-tree-visualizer-timestamps t)
;;   (setq undo-tree-visualizer-diff t))

(fset 'yes-or-no-p 'y-or-n-p) ; type just "y" instead of "yes"

(use-package which-key ; complex key hints, better than guide-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  (which-key-setup-side-window-right-bottom)) ; do bottom if no room on side

; setup ideas from: https://github.com/malb/emacs.d/blob/master/malb.org
(use-package helm-org  
  :config (progn
            (setq helm-org-headings-fontify t)

            (defun malb/helm-in-buffer ()
              "The right kind™ of buffer menu."
              (interactive)
              (if (eq major-mode 'org-mode)
                  (call-interactively #'helm-org-in-buffer-headings)
                (call-interactively #'helm-semantic-or-imenu)))

            (add-to-list 'helm-commands-using-frame 'helm-org-in-buffer-headings)
            (add-to-list 'helm-commands-using-frame 'helm-semantic-or-imenu)))

(use-package helm-descbinds)
;;  :config (helm-descbinds-mode))

(use-package helm-swoop
  :ensure t
  :defer t
  :bind
  (;;("C-x c s" . helm-swoop)
   ("M-i" . helm-swoop)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all))
  :config
  (progn
    (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
    (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop))
  )

(use-package hydra) ; otherwise defhydra is unknown.  I'm not sure why.
(defhydra hydra-utils (:color blue :hint nil)
  "
Utils:
^Info1^         ^Info2/cust^     ^Org^                      ^Misc^
--------------------------------------------------------------------------------
_b_: bindings   _m_: mode        _P_: parent headings       _a_: calc
_s_: symbol     _i_: info        _A_: heading in agenda     _p_: counsel-yank-pop
_k_: key        _c_: cust-appr   _q_: swoop org buffers     _e_: ediff-buffers
_f_: face       _C_: cust-mode   _o_: org-indent-mode       _E_: ediff-files
--------------------------------------------------------------------------------
           _._: mark position _/_: jump to mark
"
;;  ("b" counsel-descbinds)
  ("b" helm-descbinds)
  ;;  ("s" describe-symbol)
  ("s" helpful-at-point)
  ;;  ("k" describe-key)
  ("k" helpful-key)
  ("f" describe-face)
  ;;    ("m" manual-entry)
  ("m" describe-mode)
  ;; could add describe face
  ("i" info)
  ("c" customize-apropos)
  ("C" customize-mode)
  ;; could add customize face

  ;; could make hydra two level
  ;; 1st, 2nd level: all describe functions
  ;; 2nd, 2nd level: all customize

  ("P" helm-org-parent-headings)
  ("A" helm-org-agenda-files-headings)
  ("q" helm-multi-swoop-org)
  ("o" org-indent-mode) ; toggles org text to headline level & other stuff
  ;;("H" helm-mini) ; buffers & recent files: like ivy with "virtual buffers"

  ("a" calc)
  ("p" counsel-yank-pop)
  ("e" ediff-buffers)
  ("E" ediff-files)

  ("." org-mark-ring-push :color red)
  ("/" org-mark-ring-goto :color blue)
  ;; ("B" helm-buffers-list)
  )
;; ("R" helm-recentf)
(global-set-key (kbd "<M-apps>") 'hydra-utils/body) ; for fullsize keyboard
(global-set-key (kbd "<C-lwindow>") 'hydra-utils/body) ; no apps on Surface Go

(use-package helpful ; better emacs info: https://github.com/Wilfred/helpful
  :bind
  ( ; Note that the built-in `describe-function' includes both functions
   ;; and macros. `helpful-function' is functions only, so we provide
   ;; `helpful-callable' as a drop-in replacement.
   ("C-h f" .  #'helpful-callable)
   ("C-h v" .  #'helpful-variable)
   ("C-h k" .  #'helpful-key)
   ;; Lookup the current symbol at point. C-c C-d is a common keybinding
   ;; for this in lisp modes.
   ("C-c C-d" .  #'helpful-at-point)
   ;; Look up *F*unctions (excludes macros).
   ;;
   ;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
   ;; already links to the manual, if a function is referenced there.
   ("C-h F" . #'helpful-function)
   ;; Look up *C*ommands.
   ;;
   ;; By default, C-h C is bound to describe `describe-coding-system'. I
   ;; don't find this very useful, but it's frequently useful to only
   ;; look at interactive functions.
   ("C-h C" . #'helpful-command)))

;; ;;--------------------------------

;; ;; Note that the built-in `describe-function' includes both functions
;; ;; and macros. `helpful-function' is functions only, so we provide
;; ;; `helpful-callable' as a drop-in replacement.
;; (global-set-key (kbd "C-h f") #'helpful-callable)

;; (global-set-key (kbd "C-h v") #'helpful-variable)
;; (global-set-key (kbd "C-h k") #'helpful-key)

;; I also recommend the following keybindings to get the most out of helpful:

;; ;; Lookup the current symbol at point. C-c C-d is a common keybinding
;; ;; for this in lisp modes.
;; (global-set-key (kbd "C-c C-d") #'helpful-at-point)

;; ;; Look up *F*unctions (excludes macros).
;; ;;
;; ;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
;; ;; already links to the manual, if a function is referenced there.
;; (global-set-key (kbd "C-h F") #'helpful-function)

;; ;; Look up *C*ommands.
;; ;;
;; ;; By default, C-h C is bound to describe `describe-coding-system'. I
;; ;; don't find this very useful, but it's frequently useful to only
;; ;; look at interactive functions.
;; (global-set-key (kbd "C-h C") #'helpful-command)
;; ;;--------------------------------

;; * Appearance

(global-set-key (kbd "C->") 'text-scale-increase)
(global-set-key (kbd "C-<") 'text-scale-decrease)

;; Different background color if started from root
(if (string-match "root" (user-real-login-name))
    (set-face-background 'default "lavender"))

(require 'font-lock)
;;fontlock fonts (fontlock must be on before this (done in gnu/xemacs files above)
(setq font-lock-maximum-decoration t)  ; gaudy fontification
(set-face-foreground 'font-lock-comment-face "grey40")
(set-face-foreground 'font-lock-keyword-face "blue")
(set-face-foreground 'font-lock-string-face "aquamarine4")
(set-face-foreground 'font-lock-variable-name-face "darkgreen")
(set-face-foreground 'font-lock-function-name-face "blue")
(set-face-foreground 'font-lock-type-face "blue3")

(global-font-lock-mode t) ;so fontlocking is always turned on (diff for xemacs)
;; color the cursor red if in overwrite mode
;; https://www.emacswiki.org/emacs/EmacsNiftyTricks
(setq hcz-set-cursor-color-color "")
(setq hcz-set-cursor-color-buffer "")
(defun hcz-set-cursor-color-according-to-mode ()
  "change cursor color according to some minor modes."
  ;; set-cursor-color is somewhat costly, so we only call it when needed:
  (let ((color
	 (if buffer-read-only "black"
	   (if overwrite-mode "red"
	     "RoyalBlue3"))))
    (unless (and
	     (string= color hcz-set-cursor-color-color)
	     (string= (buffer-name) hcz-set-cursor-color-buffer))
      (set-cursor-color (setq hcz-set-cursor-color-color color))
      (setq hcz-set-cursor-color-buffer (buffer-name)))))
(add-hook 'post-command-hook 'hcz-set-cursor-color-according-to-mode)

(use-package beacon ; Flashes the cursor's line when you scroll.  Helpful.
  :diminish beacon-mode
  :config
  (beacon-mode 1))

(show-paren-mode 1) ; turn on blinking parens

;; visual line mode messes up org-tables but is GREAT for everything else
(global-visual-line-mode +1) ; soft line wrapping
(global-set-key (kbd "C-c w") 'toggle-truncate-lines) ; e.g. to view org-mode tables

(display-time-mode 1) ; time on the modeline (is customized)

;; Right justifies time & other stuff in mode-line-misc-info, but undoes prevous modeline buffer uniquification (maybe I want to fix that...)
(use-package smart-mode-line 
  :config
  (setq sml/theme nil) ; don't change existing modeline faces
  (sml/setup))

(column-number-mode 1) ; in mode-line
(mouse-avoidance-mode 'animate)  ; get mouse out of way of cursor, is customized

(auto-fill-mode -1)  ; don't do autofill: do visual wrap instead
;; in case some other mode sets this hook in text mode
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

;; Sets the wrap-prefix property on the fly so that single-long-line
;; paragraphs get word-wrapped in a way similar to what you'd get with
;; M-q using adaptive-fill-mode,
;; However, it doesn't indent 2nd line numbered or lettered lists
(use-package adaptive-wrap ; required for visual line mode hook below?
  :diminish adaptive-wrap-prefix-mode
;;  :config (add-hook 'visual-line-mode-hook (adaptive-wrap-prefix-mode +1)))
  :config (add-hook 'visual-line-mode-hook
  		    (lambda ()
  		      (adaptive-wrap-prefix-mode +1)
  		      (diminish 'visual-line-mode))))
;;Other adaptive-wrap settings I could use but
;; don't want extra indent after bullet
;; (with-eval-after-load 'adaptive-wrap
;;   (setq-default adaptive-wrap-extra-indent 0))
;;  (setq-default adaptive-wrap-extra-indent 2))

;; turn fill-paragraph into a fill/unfill toggle
(use-package unfill
  :bind ([remap fill-paragraph] . unfill-toggle))

;; turn off the bell
(setq bell-volume 0)
(setq sound-alist nil)
(setq visible-bell t)
;; turn off the annoying alarm bell (is this redundant?)
(setq ring-bell-function 'ignore)

;; * Variables Set By Emacs's built-in Customization Interface 
;; ** Custom Set Variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-hscroll-mode (quote current-line))
 '(aw-background t)
 '(blink-cursor-mode nil)
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(counsel-grep-base-command "grep -nEi '%s' %s")
 '(delete-selection-mode nil)
 '(dired-dwim-target t)
 '(display-time-24hr-format t)
 '(display-time-default-load-average nil)
 '(display-time-load-average-threshold 100000000)
 '(display-time-mode t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(elpy-rpc-python-command "python")
 '(emacsw32-style-frame-title t)
 '(ess-ido-flex-matching t)
 '(ess-language "R" t)
 '(ess-own-style-list
   (quote
    ((ess-indent-level . 2)
     (ess-continued-statement-offset . 2)
     (ess-brace-offset . 0)
     (ess-expression-offset . 2)
     (ess-else-offset . 0)
     (ess-brace-imaginary-offset . 0)
     (ess-continued-brace-offset . 0)
     (ess-arg-function-offset . 2)
     (ess-arg-function-offset-new-line . 2)
     (ess-close-brace-offset . 0))))
 '(ess-ps-viewer-pref "gv")
 '(ess-style (quote OWN))
 '(focus-follows-mouse t)
 '(gud-chdir-before-run nil)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-cannot-complete-command (quote ido-grid-mode-tab))
 '(ido-create-new-buffer (quote always))
 '(ido-everywhere t)
 '(ido-grid-mode t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-filename-at-point (quote guess))
 '(ido-use-url-at-point t)
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries nil)
 '(indicate-empty-lines t)
 '(ivy-mode t)
 '(ivy-wrap t)
 '(load-home-init-file t t)
 '(load-prefer-newer t)
 '(matlab-comment-column 0)
 '(matlab-comment-region-s "% ")
 '(matlab-cont-level 2)
 '(matlab-fill-strings-flag 0)
 '(matlab-indent-function-body nil)
 '(matlab-indent-level 2)
 '(mouse-autoselect-window 0.5)
 '(mouse-avoidance-nudge-dist 10)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) p\. 1) ((control)))))
 '(mouse-wheel-tilt-scroll t)
 '(org-agenda-files
   (quote
    ("c:/Users/sotterson/OneDrive/shareHW/school/GIZcolombia/GIZcolombia.org")))
 '(org-confirm-shell-links (quote y-or-n-p))
 '(org-ctrl-k-protect-subtree t)
 '(org-cycle-include-plain-lists (quote integrate))
 '(org-directory "~/")
 '(org-ellipsis "…")
 '(org-export-backends (quote (ascii html latex odt org confluence freemind s5)))
 '(org-export-with-broken-links (quote mark))
 '(org-fontify-done-headline t)
 '(org-fontify-emphasized-text t)
 '(org-from-is-user-regexp nil)
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-latex-pdf-process (quote ("latexmk -pdf -output-directory=%o -f %f")))
 '(org-list-allow-alphabetical t)
 '(org-list-empty-line-terminates-plain-lists t)
 '(org-modules
   (quote
    (org-bibtex org-info org-inlinetask org-mouse org-protocol org-choose org-man)))
 '(org-occur-case-fold-search (quote (quote smart)))
 '(org-odd-levels-only t)
 '(org-outline-path-complete-in-steps nil)
 '(org-pretty-entities nil)
 '(org-preview-latex-process-alist
   (quote
    ((dvipng :programs
             ("latex" "dvipng")
             :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
             (1.0 . 1.0)
             :latex-compiler
             ("latex -interaction nonstopmode -output-directory %o %f")
             :image-converter
             ("dvipng -fg %F -bg %B -D %D -T tight -o \"%o%b.png\" %f"))
     (dvisvgm :programs
              ("latex" "dvisvgm")
              :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :use-xcolor t :image-input-type "dvi" :image-output-type "svg" :image-size-adjust
              (1.7 . 1.5)
              :latex-compiler
              ("latex -interaction nonstopmode -output-directory %o %f")
              :image-converter
              ("dvisvgm %f -n -b min -c %S -o %o%b.svg"))
     (imagemagick :programs
                  ("latex" "convert")
                  :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
                  (1.0 . 1.0)
                  :latex-compiler
                  ("pdflatex -interaction nonstopmode -output-directory %o %f")
                  :image-converter
                  ("convert -density %D -trim -antialias %f -quality 100 %o%b.png")))))
 '(org-refile-targets (quote ((nil :maxlevel . 6))))
 '(org-special-ctrl-k nil)
 '(org-speed-commands-user (quote (("s" . narrow-or-widen-dwim))))
 '(org-startup-align-all-tables t)
 '(org-startup-indented nil)
 '(org-startup-truncated t)
 '(org-use-speed-commands t)
 '(outshine-org-style-global-cycling-at-bob-p t)
 '(outshine-use-speed-commands t)
 '(package-selected-packages
   (quote
    (ivy-hydra helm-org dired-narrow shell-pop dired-subtree ivy-rich ivy-explorer flycheck-cstyle flycheck-cython flycheck-inline flycheck-pos-tip multi-line org-ref yaml-mode flycheck csharp-mode omnisharp org-bullets py-autopep8 smex helm ivy elpygen ox-pandoc powershell helpful dired+ helm-descbinds smart-mode-line smartscan artbollocks-mode highlight-thing try conda counsel swiper-helm esup auctex auctex-latexmk psvn helm-cscope xcscope ido-completing-read+ helm-swoop ag ein company elpy anaconda-mode dumb-jump outshine lispy org-download w32-browser replace-from-region xah-math-input flyspell-correct flyspell-correct-ivy ivy-bibtex google-translate gscholar-bibtex helm-google ox-minutes transpose-frame which-key smart-region beacon ox-clip hl-line+ copyit-pandoc pandoc pandoc-mode org-ac flycheck-color-mode-line flycheck-perl6 iedit wrap-region avy cdlatex latex-math-preview latex-pretty-symbols latex-preview-pane latex-unicode-math-mode f writegood-mode auto-complete matlab-mode popup parsebib org-cliplink org-autolist key-chord ido-grid-mode ido-hacks ido-describe-bindings hydra google-this google-maps flx-ido expand-region diminish bind-key biblio async adaptive-wrap buffer-move)))
 '(paren-message-truncate-lines nil)
 '(recentf-max-menu-items 60)
 '(recentf-max-saved-items 200)
 '(recentf-mode t)
 '(replace-char-fold t)
 '(require-final-newline nil)
 '(safe-local-variable-values
   (quote
    ((org-todo-keyword-faces
      ("ACCEPTED" . "green")
      ("TRY" . "red")
      ("REJECTED" . "gray")))))
 '(save-interprogram-paste-before-kill t)
 '(scroll-bar-mode (quote right))
 '(scroll-step 1)
 '(search-default-mode (quote char-fold-to-regexp))
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(sml/modified-char "•")
 '(sml/position-percentage-format nil)
 '(sml/vc-mode-show-backend t)
 '(swiper-action-recenter nil)
 '(tool-bar-mode nil)
 '(visual-line-fringe-indicators (quote (nil top-right-angle)))
 '(w32-use-w32-font-dialog nil)
 '(window-divider-default-places t)
 '(window-divider-mode t))
 ;; '(w32shell-cygwin-bin "C:\\cygwin64\\bin"))

;; ** Custom Set Faces

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 102 :width normal :foundry "outline" :family "Consolas"))))
 '(aw-leading-char-face ((t (:foreground "red" :weight bold))))
 '(cperl-array ((t (:background "*" :foreground "saddlebrown" :slant italic))))
 '(cperl-hash ((t (:background "*" :foreground "darkgreen" :slant oblique))))
 '(cperl-nonoverridable ((t (:background "*" :foreground "black" :weight normal))))
 '(cursor ((t (:background "blue"))))
 '(dired-directory ((t (:foreground "MediumBlue"))))
 '(dired-ignored ((t (:foreground "NavajoWhite4"))))
 '(ediff-even-diff-face-A ((((class color)) (:background "light grey" :foreground "red"))))
 '(ediff-even-diff-face-B ((((class color)) (:background "light grey" :foreground "red"))))
 '(ediff-odd-diff-face-A ((t (:background "gray" :foreground "black"))))
 '(ediff-odd-diff-face-B ((t (:background "gray" :foreground "black"))))
 '(eshell-ls-archive ((((class color) (background light)) (:foreground "green4" :weight bold))))
 '(eshell-ls-backup ((((class color) (background light)) (:inherit dired-ignored))))
 '(eshell-ls-directory ((((class color) (background light)) (:inherit dired-directory :weight bold))))
 '(eshell-ls-product ((((class color) (background light)) (:foreground "DarkSeaGreen"))))
 '(eshell-ls-special ((((class color) (background light)) (:foreground "darkred" :weight bold))))
 '(eshell-prompt ((t (:foreground "SlateGray" :weight bold))))
 '(flyspell-incorrect ((t (:underline (:color "firebrick1" :style wave)))))
 '(font-lock-builtin-face ((((type tty) (class color)) (:foreground "red"))))
 '(font-lock-function-name-face ((t (:foreground "navy" :weight bold))))
 '(font-lock-keyword-face ((nil (:foreground "navy"))))
 '(font-lock-string-face ((t (:foreground "black" :slant italic))))
 '(fringe ((t (:background "gray93" :foreground "light slate gray" :weight bold))))
 '(highlight-indentation-face ((t (:foreground "light gray"))))
 '(hl-line ((t (:background "gray97"))))
 '(ido-first-match ((t (:background "antique white" :weight bold))))
 '(isearch ((t (:background "papaya whip" :foreground "black"))))
 '(lazy-highlight ((t (:background "honeydew3"))))
 '(matlab-region-face ((t (:background "LightSteelBlue1"))))
 '(mode-line ((t (:background "RoyalBlue4" :foreground "snow" :box (:line-width -1 :style released-button) :weight bold))))
 '(org-code ((t (:inherit black :inverse-video nil :weight bold :family "Courier New"))))
 '(org-done ((t (:foreground "Gray" :weight bold))))
 '(org-done-face ((t (:foreground "gray" :weight bold))))
 '(org-ellipsis ((t (:foreground "dark slate gray" :weight normal))))
 '(org-headline-done ((((class color) (background light)) (:foreground "gray"))))
 '(org-headline-done-face ((((class color) (background light)) (:foreground "Gray"))))
 '(org-level-1 ((nil (:weight bold))))
 '(org-level-2 ((((class color) (background light)) (:foreground "black"))))
 '(org-level-3 ((((class color) (background light)) (:foreground "black"))))
 '(org-level-4 ((((class color) (background light)) (:foreground "black"))))
 '(org-level-5 ((((class color) (background light)) (:foreground "black"))))
 '(org-level-6 ((((class color) (background light)) (:foreground "black"))))
 '(org-level-7 ((((class color) (background light)) (:foreground "black"))))
 '(org-level-8 ((((class color) (background light)) (:foreground "black"))))
 '(org-link ((t (:foreground "blue3"))))
 '(org-table ((((class color) (background light)) (:background "honeydew1" :foreground "black"))))
 '(org-tag ((nil (:foreground "dark green" :slant italic :weight bold))))
 '(org-target ((t (:foreground "dark slate blue" :weight bold))))
 '(org-todo ((t (:foreground "Firebrick" :weight normal))))
 '(org-verbatim ((t (:inherit shadow :weight bold))))
 '(org-warning ((t (:foreground "firebrick" :weight normal))))
 '(region ((t (:background "LightSteelBlue1"))))
 '(sml/modified ((t (:inherit sml/not-modified :foreground "firebrick" :weight bold))))
 '(table-cell-face ((t (:background "honeydew1" :foreground "black" :inverse-video nil))))
 '(writegood-duplicates-face ((t (:underline (:color "orange" :style wave)))))
 '(writegood-passive-voice-face ((t (:underline (:color "MediumOrchid1" :style wave))))))

