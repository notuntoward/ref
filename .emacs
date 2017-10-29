;; .EMACS (nonheadline needed here for outshine global tabbing)
;; * Emacs Startup Behavior

(require 'server) ; so file association works on windows and emacsclient
;; So don't get annoying warning/question when killing a buffer loaded w/
;; emacsclient.  See
;; http://shreevatsa.wordpress.com/2007/01/06/using-emacsclient/
;; but this doesn't work in windows 10 either: still get warnings when kill
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; starts debugger when .emacs file error but I'm not sure what to do with that
;;(setq debug-on-error t)

;;http://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

;; remember cursor position, for emacs 25.1 or later
;; per-buffer: https://www.masteringemacs.org/article/whats-new-in-emacs-25-1
(save-place-mode 1)

;; Emacs looks at default Emacs init file AFTER it looks here.
;; So the initializations here could be written over.
;; So:  Could inhibit loading the default init file.
(setq inhibit-default-init 1)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;; If have boot slowness
;;(use-package esup) ;; for profiling .emacs startup time (obsolete?)

;; * Package Configuration

(prefer-coding-system 'utf-8); avoid complaints, put before (require 'package)
;; from: https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(require 'package)
(add-to-list   'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list   'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
;; adds about 2+ secs to load time @ home
;;(package-refresh-contents)

;; For totaly clean start

(unless (package-installed-p 'use-package) ;; for totally clean start
  (message "Installing use-package and refreshing")
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t) ; so use-package always installs if missing

;; ;; I needed to do (use-package org :ensure org-plus-contrib) so that org-modules would work on a clean install. But this caused an old version of org to be installed.
;; ;; But is there a problem like: "I'm using this in my config, but whenever a third-party package (e.g., elfeed-org) gets installed with use-package, the default org is downloaded and installed. This cannot be right, any ideas how I can prevent that from happening?"
;; ;;https://emacs.stackexchange.com/questions/7890/org-plus-contrib-and-org-with-require-or-use-package                                        ;
;; ;; This is supposed to fix that
;; ;; From:  https://github.com/jwiegley/use-package/issues/319
;; (require 'cl) ; for remove-if
;; (let* ((package--builtins '()) ; <- this does the trick
;;        (missing (remove-if 'package-installed-p my-packages)))
;;   (when missing
;;     (package-refresh-contents)
;;     (mapc 'package-install missing)))

;; * Computer-specific setup

(defvar running-ms-windows
  (eq system-type 'windows-nt))
;; why??
;; (defvar running-ms-windows
;;   (string-match "windows" (prin1-to-string system-type)))

(defvar running-gnu-linux
  (string-match "linux" (prin1-to-string system-type)))

(if running-gnu-linux
    (progn (setq os-which-cmd "which")
           (global-set-key [f11] 'shell) ; normal shell if not windows
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
      (global-set-key [f11] 'eshell) ; emacs built-in, almost unix
      (global-set-key [C-f11] 'cmd-shell) ; DOS
      (setq w32-use-w32-font-dialog nil)
      (setq os-which-cmd "where")
      (setq
       ps-lpr-command "c:\\Program Files\\gstools\\gsview\\gsview32.exe"
       ps-lpr-switches (list "/p" "-sDEVICE=mswinpr" "-") )
      ;; So emacs recognizes Cygwin's path names
      ;; (http://www.khngai.com/emacs/cygwin.php)
      (use-package cygwin-mount 
	:config (cygwin-mount-activate))
      (setq cygwin-bin-dir "c:/cygwin64/bin/")
      (defun cygwin-shell ()
        "Run cygwin bash in shell mode."
        (interactive)
        (let ((explicit-shell-file-name (concat cygwin-bin-dir "bash"))
	      (call-interactively 'shell)))
	(global-set-key [M-f11] 'cygwin-shell)))) ; cygwin bash

(setq computerNm (downcase system-name)) ; downcase: was getting random case
(pcase (eval 'computerNm)
  ("desktop-lkl5mc1"  ; Surface Pro 4
   (setq shareDir "c:/Users/scotto/Tempo Box/shareHW"))
  ("nb-sotterson"     ; work laptop
   (progn (setq shareDir "~/shareHW/")))
  (_
   (progn (warn "Can't assign shareDir for unknown computer: %s" computerNm)
	  (setq shareDir (concat "unknown_computer_" computerNm "_shareDir"))))
  )
(setq docDir (expand-file-name "../ref" shareDir))
(message "computerNm %s shareDir %s docDir %s" computerNm shareDir docDir)

(if window-system
    (define-key global-map [S-down-mouse-3] 'imenu)
  (progn
    ;; on a term or cmdshell:
    (menu-bar-mode -1) ;menubar off when on an xterm (xemacs does automatically)
    (set-face-background 'region "pale turquoise")) ;works on xterm
  )

;; to get rid of the ^M's in the shell output
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)
;; for PC, so emacs uses command.com for shell
(setq process-coding-system-alist
      '(("cmdproxy" . (raw-text-dos . raw-text-dos))))

;; to install it with the ps-print package, which I hadn't for 21.8, at least.
(require 'ps-print)
(setq
 ps-print-color-p t
 ps-paper-type 'a4
 ps-bottom-margin (/ (* 72 2.0) 2.54))

;; * Operating System Interaction
;; ** Shell Mode
;; Make up/down arrows search cmd history like tcsh
(require 'shell)
(define-key shell-mode-map [up]	'comint-previous-matching-input-from-input)
(define-key shell-mode-map [down] 'comint-next-matching-input-from-input)

;; so ^M doesn't show up in Linux xemacs shell while logged in to Solaris
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; So passwords aren't displayed
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
;; patterns for my pwd, ssh, or krb prompts
(setq usrnm (user-login-name))
(setq comint-password-prompt-regexp
      (concat "\\(\\([Oo]ld \\|[Nn]ew \\|^\\|^" usrnm" @.*'s \\|^" usrnm
	      ".*'s \\|[Pp]assword for \\)[Pp]assword\\|pass phrase\\|" usrnm
	      "@.*\\):\\s *\\'"))

;; ** Eshell
;; as recommended: https://www.masteringemacs.org/article/complete-guide-mastering-eshell
;; em-smart doesn't seem to do anything, nor does anything else immediately below
(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

;; middle mouse click on url starts browser in every file
(when (fboundp 'goto-address) (add-hook 'find-file-hooks 'goto-address))

(add-hook 'text-mode-hook
	  '(lambda ()
	     (set (make-local-variable 'dabbrev-case-fold-search) t)
	     (set (make-local-variable 'dabbrev-case-replace) t)))

;; ** Remote Process Communication

;; could put scp/ftp or whatever here, if I need that someday

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

(global-auto-revert-mode t) ; updates when file changes, like Matlab. Avoids conflicts?

;; * Window Config, Desktop Save and Restore
;; ** Adjusting Window Orientation
(use-package transpose-frame ; tons of functions: I'm just picking this one
  :config (global-set-key (kbd "C-|")  'rotate-frame-clockwise))

(winner-mode 1) ; Undo window config: C-c left; Redo window config: C-c right

;; Traverse window movement history w/ mouse buttons usually bound to browser forward/back.  Goes through frames too, but may have to move mouse if frame gets out of focus.  On MS sculpt mouse, swipe down is 'back'; swipe up is 'forward'
(define-key global-map [mouse-4] 'next-multiframe-window)
(define-key global-map [mouse-5] 'previous-multiframe-window)

;; ** Attempts at saving desktop
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
;; "search" the web
(use-package google-this
  :diminish google-this-mode
  :config
  (google-this-mode 1)) ; bound to C-c / g (and other bindings after '/')

;; ** File System Search

;; Requires ag package to be installed
;; DOESN'T WORK.  Neither does counsel-ag
;; so can use ag inside of eshell
;; from: https://github.com/tomjakubowski/.emacs.d/issues/3
(defun ag-eshell (string)
  "Search with ag using the current eshell directory and a given string.
   To be used from within an eshell alias
   (`alias ag 'ag-eshell $1'` within eshell)"
  (ag/search string (eshell/pwd)))
;; Then run alias ag 'ag-eshell $1' in eshell
;; This puts this elisp in emacs.d/eshell/alias, so need to do this for each install.

;; supposed to work on Windows: https://github.com/abo-abo/swiper/issues/672
(setq counsel-ag-base-command "ag --vimgrep --nocolor --nogroup %s")  

;; ** Search/Replace within Buffer

;; Bindings for searching with currently highlighted string
;; searching a word forwards by M-s
(define-key isearch-mode-map "\M-s" 'isearch-repeat-forward) ;
;; searching a word backwards by M-r
(define-key isearch-mode-map "\M-r" 'isearch-repeat-backward) ;

(use-package replace-from-region
  :config
  (global-set-key (kbd "M-%") 'query-replace-from-region)); default was query-replace

;; When hit C-s (default emacs binding) with a region selected, use it as the search string.  From: http://stackoverflow.com/questions/202803/searching-for-marked-selected-text-in-emacs
;; NOTE: C-s C-w (extra C-w's expand region) also works well
(defun jrh-isearch-with-region ()
  "Use region as the isearch text."
  (when mark-active
    (let ((region (funcall region-extract-function nil)))
      (deactivate-mark)
      (isearch-push-state)
      (isearch-yank-string region))))
(add-hook 'isearch-mode-hook #'jrh-isearch-with-region)

;; * Swiper/Ivy
(use-package swiper
  :diminish ivy-mode
  :init
  (progn
    (setq ivy-use-virtual-buffers t) ; ivy-switch-buffer also shows recent files
    (setq ivy-count-format "(%d/%d) ") ; show candidate index/count in swiper
    ;; Search with swiper, handles org-mode headline unfold much better than helm
    ;; C-s C-w (extra C-w's expand region) also works well
    ;; I added -i to counsel-grep-base-command so grep is case-insensitive
    ;;  (fset 'swiper-func 'counsel-grep-or-swiper) ; uses grep for long files, esp. org
    (fset 'swiper-func 'swiper) ; standard swiper, slow on large org files
    (defun sdo/swiper-region ()
      "If region selected, swipe for it, else do normal swiper call"
      (interactive)
      (if mark-active
	  (let ((region (funcall region-extract-function nil)))
	    (deactivate-mark)
	    (swiper-func region))
	(swiper-func)))))

;; binding swiper inside use-package looked hard.  Just do this for now, fix later
(global-set-key "\C-s" 'sdo/swiper-region)
;;(global-set-key "\C-s" 'swiper) ; bind it instead to sdo/swiper-region
;; ivy-views integrate with ivy-switch-buffer (See https://oremacs.com/2016/06/27/ivy-push-view/).  That's probably nice but I'm still using ido-switch-buffer b/c of its rectangular view.  So, I've bound ivy-switch view to something close to switch-buffer.  
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view) ; works like delete
(global-set-key (kbd "C-x V") 'ivy-switch-view)
;; actually, this seems to do the (nearly) same thing as C-s s
(global-set-key (kbd "C-c C-r") 'ivy-resume) ; Resume the last ivy completion session
;; mabye nice but I want to preserve reverse search direction
;;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; This didn't install counsel.  I had to do it by hand.  Something to do w/ counsel being on melpa, not elpa?
;; but... video guy also had a problem installing counsel, and he uses use-package all the time: https://www.youtube.com/watch?v=LReZI7VAy8w&t=82s
(use-package counsel ; better kill-ring 2nd yanking
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

;; * IDO Mode
;; Ido mode (a replacement for iswitchb and much else).  Much is in customizations
;; advice from: http://www.masteringemacs.org/article/introduction-to-ido-mode
;; See also sdo/get-recentf() in keybinding section, which (currently) uses ido
;; Ivy is fancier but I'm keeping Ido around because it has a nice grid mode that isn't available for Ivy.
;;
;; Should be placed after ivy to avoid partial ivy overwrites of ido functions

;; as recommended: https://github.com/DarwinAwardWinner/ido-completing-read-plus
(ido-mode 1)
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
  :ensure t
  :init
  (progn  ;; copied from https://github.com/bdd/.emacs.d/blob/master/packages.el
    (setq gc-cons-threshold (* 20 (expt 2 20)) ; megabytes
	  ido-use-faces nil))
  :config
  (progn (flx-ido-mode 1)
	 ;; disable ido faces to see flx highlights.
	 (setq ido-enable-flex-matching t)
	 (setq ido-use-faces nil)))

;; I also have a hydra set up to do counsel bindings but ido-describe-bindings is here because it also shows unicode chars (that I don't know how to activate with my keyboard, but at least they're there...)
(use-package ido-describe-bindings
  :config (global-set-key (kbd "C-h b") 'ido-describe-bindings))

;; ido- matching for emacs commands (could use ido-ubiquitous instead):
;; https://www.reddit.com/r/emacs/comments/1xnhws/speaking_of_emacs_modes_flx_flxido_ido_smex_helm/?st=iu1g56lu&sh=554484fb
(use-package smex
  :config (progn (smex-initialize)
		 (global-set-key (kbd "M-x") 'smex)
		 (global-set-key (kbd "M-X") 'smex-major-mode-commands)
		 ;; This is your old M-x.
		 (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))

;; * Scrolling, Cursor Movement and Selection

(setq scroll-step 1)
(global-set-key (kbd "M-[") 'scroll-down) ; page up
(global-set-key (kbd "M-]") 'scroll-up)   ; page down

;;from: https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org
(bind-key "C-x p" 'pop-to-mark-command) 
(setq set-mark-command-repeat-pop t)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line
         number input"
  (interactive)
  (unwind-protect
      (progn
	(linum-mode 1)                            ; only on current buffer
	(goto-line (read-number "Goto line: ")))
    (linum-mode -1)))                             ; only on current buffer
(global-set-key (kbd "C-=") 'goto-line-with-feedback)

(global-set-key (kbd "C-M-=") 'global-linum-mode) ; toggles on all buffers

;; Bind S-arrow keys to moving cursor to buffer
(windmove-default-keybindings); maps cursor moving to S-arrow keys
;; when cursor is on edge, move to the other side, as in a torus space
(setq windmove-wrap-around t )
;; Overwrites org keys I don't use (TODO, and timestamp arrow keys?), or, when org-support-shift-select is set to true, would be mapped to MS-word-like shift-arrow selection (see also bindings for buffer-move package)
;; switch 'buffer-move-behavior' somehow changes this
(global-set-key (kbd "<C-up>")     'windmove-up)
(global-set-key (kbd "<C-down>")   'windmove-down)
(global-set-key (kbd "<C-left>")   'windmove-left)
(global-set-key (kbd "<C-right>")  'windmove-right)

;; C-x C-x toggles from start to end
(use-package smart-region
  :init (global-set-key (kbd "C--") 'smart-region))

;; * Buffer Handling
;; names buffers containing same file names, different dirs
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p 1)

;;(global-set-key "m" 'org-mac-message-insert-link) ; only works on Mac
(global-set-key "n" 'rename-buffer)

;; list of buffers w/ ctl-mouse1
(defun cw-build-buffers ()
  "Popup buffer menu."
  (interactive "@")
  (run-hooks 'activate-menubar-hook)
  (popup-menu (car (find-menu-item current-menubar '("Buffers")))))
(global-set-key [(control button1)] 'cw-build-buffers)

;; Fancier ibuffers: http://cestlaz.github.io/posts/using-emacs-34-ibuffer-emmet/
;; Is this really better than the default?
;; 
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

;; Bind shift-arrow keys to buffer moving commands
;; (org-mode keys should have already been unbound in the org section)
(use-package buffer-move ; switch 'buffer-move-behavior' somehow changes this
  :config (progn (global-set-key (kbd "<C-S-up>")     'buf-move-up)
		 (global-set-key (kbd "<C-S-down>")   'buf-move-down)
		 (global-set-key (kbd "<C-S-left>")   'buf-move-left)
		 (global-set-key (kbd "<C-S-right>")  'buf-move-right)))

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

(add-hook  'dired-mode-hook
	   (lambda ()
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
			;; FIX so only run if CYGWIN so windows/cygwin
			;; links properly.  Display is sensible but dired
			;; can't follow either ordinary cygwin link or the
			;; windows shortcut link that cygwin makes with
			;; "winsymlinks" in the CYGWIN environment
			;; variable
			(setq ls-lisp-use-insert-directory-program t) ; ext. ls
			(setq insert-directory-program (concat cygwin-bin-dir "ls"))
			)
	       )
	     ))

;; so that dired automatically updates stale directory list when buffer revisted
(setq dired-no-confirm `(revert-subdirs))

(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)

;; ** Find-file and URL
;; Avoid extra "file or url" text in minibuf; use ffap only if @ valid URL or path
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
;;(global-set-key (kbd "C-x f") 'find-file-literally); overwrites set-fill-column

;; ** Name of file in current buffer (kind of the opposite of ffap)

;; http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/ https://github.com/bbatsov/prelude
(defun copy-current-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

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

;; *** uniquified recentf utils, from: https://gist.github.com/vedang/8645234
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

;; *** my recentf functions
(require 'recentf)

(defun sdo/uniquify-like-buffer (vm-unique-filename)
  "Reformats filenames with smallest unique paths to buffer name style"
  (string-join (reverse (split-string vm-unique-filename "/")) "|"))

;; a modified ido-recentf-open(), from: https://gist.github.com/vedang/8645234
(defun sdo/find-recentf-func (find-file-func)
  "Select a recently visited file with Ido and then find it with FIND-FILE-FUNC.
\n(fn FIND-FILE-FUNC)"
  
  (let* ((unique-filenames (mapcar (lambda (fnm) (sdo/uniquify-like-buffer fnm))
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

;; overwrites ido-list-directory, which was less useful than this
(global-set-key (kbd "C-x C-d") 'bjm/ivy-dired-recent-dirs)

;;* Function key bindings
;; ** functions in function keys
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
(use-package igrep
  :config
  (setq igrep-options "-i") ; -n is default for igrep
  (global-set-key [f5] 'igrep)
  (global-set-key [f6] 'igrep-find))
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
	 ("\\.c$"    . c++-mode)  ; can't hurt?
	 ("\\.cpp$"    . c++-mode)
	 ("\\.h$"    . c++-mode)  ; since CTS has C++ includes w/ .h
	 ("\\.java$" . java-mode)
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
;; From https://github.com/itsjeyd/emacs-config/blob/emacs24/init.el
(use-package smartscan
  :defer t
  :config (global-smartscan-mode t))

;; *** Ediff
;; Do not pop up a separate window "frame" for ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; Avoid folding headlines when ediffing org-mode
;; from: https://emacs.stackexchange.com/questions/21335/prevent-folding-org-files-opened-by-ediff
(add-hook 'ediff-prepare-buffer-hook #'outline-show-all)

;; *** Outshine: org-mode like headlines in programming and other modes
;; Setup from: http://orgmode.org/worg/org-tutorials/org-outside-org.html
;;        and: http://www.modernemacs.com/post/outline-ivy/
(use-package outshine
  :diminish outline-mode
  :diminish outline-minor-mode
  :config
  (add-hook 'outline-minor-mode-hook 'outshine-hook-function) ; for outshine
  (add-hook 'prog-mode-hook 'outline-minor-mode))             ; all prog modes

;; *** Vertical indent lines in programming modes
;; https://github.com/DarthFennec/highlight-indent-guides
;; M-x highlight-indent-guides-mode to activate
;; is supposed to activate for prog. modes but for me, only works for elisp
;; see howto.org for debugging trail
(use-package highlight-indent-guides
  :config (progn (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
		 ;; nicest looking, thinnest lines.
		 (setq highlight-indent-guides-method 'character)))

;; ** Matlab mode

;; When I put this in packages, stuff stopped working. Also, abo-abo says that this package is no longer maintained.  But he has a new one, that maybe I could try.

(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(defun my-matlab-mode-hook ()
  (setq fill-column 80)		; where auto-fill should wrap
  (define-key matlab-mode-map [f1] 'matlab-fill-paragraph) ; override global
  (define-key matlab-mode-map "\e;" 'comment-dwim) ; override matlab's commenter
  )
(setq matlab-mode-hook 'my-matlab-mode-hook)
(setq matlab-indent-end-before-return t)
;;so matlab R12 runs in emacs and don't get a splash over remote connections prevents error messages from starting GUI but then plots don't work
(setq matlab-shell-command-switches '("-nodesktop -nosplash"))

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
  ;; could override c-default-style in here e.g. (c-set-style "Ellemtel")
  ;; so newline also indents (needed for cc-mode but not BOMC)
  ;;  (define-key c-mode-map "\C-m" 'newline-and-indent)
  ;;  (c-toggle-auto-state 1) ; get newlines after braces and some other things
  (c-toggle-auto-hungry-state 1) ; not sure what this does
  ;; make c-mode tabs, after first token, work as tabs
  (setq c-tab-always-indent nil)
  (setq c-basic-offset 2)  ; indents are multiples of this
  (define-key c++-msode-map "\C-c\C-L" 'ifdef-line)
  (define-key c++-mode-map "\C-c\C-R" 'ifdef-region)
  )

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

;;Source code brower like etags but better.  The latest is included w/ the
;; cscope dist:
;; http://sourceforge.net/project/showfiles.php?group_id=4664&release_id=42014
(use-package xcscope ; put it in ~/lib/emacs
  :config (define-key cscope-list-entry-keymap "q" 'quit-window)) ; make it quit like dired

;; ** Python
;; Use Elpy instead of python-mode. Also requires some PYTHON LIBS, see: 
;; https://github.com/jorgenschaefer/elpy
;; docs: https://elpy.readthedocs.io/en/latest/index.html
;; run python in buffer with C-c C-c, once elpy-mode is enabled
(use-package elpy
  :defer t
  :init
  (progn
    (elpy-enable)
    ;;(elpy-use-ipython); in conda.el custom hook so set after python path known

    ;; use flycheck, not elpy's flymake (https://realpython.com/blog/python/emacs-the-best-python-editor/)
    (when (require 'flycheck nil t)
      (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
      (add-hook 'elpy-mode-hook 'flycheck-mode))))

;; working with python anaconda environments (is also customized)
(setq conda-home-dir (getenv "ANACONDA_HOME"))
(message "conda-home-dir = %s" conda-home-dir)
(use-package conda
  :defer t
  :init
  (progn
    ;; if you want interactive shell support, include:
    (conda-env-initialize-interactive-shells)
    ;; if you want eshell support, include:
    (conda-env-initialize-eshell)
    ;; if you want auto-activation (see below for details), include:
    ;; (conda-env-autoactivate-mode t) ;; avoid annoying messages, do by hand
    ;; I have ~/.anaconda but conda.el looks for ~/.anaconda3 so I must set it
    ;;(setq conda-anaconda-home conda-home-dir) ;; use env var instead
    ))

;; ** Perl
;; use CPerl mode instead of perl-mode (both come with emacs)
(require 'cperl-mode) ; so keymap stuff below works
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

;; cperl-mode is preferred to perl-mode
;; "Brevity is the soul of wit" <foo at acm.org>
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
;; so C-x v = inside of vc-dir will use ediff
;; https://stackoverflow.com/questions/3712834/getting-vc-diff-to-use-ediff-in-emacs-23-2
;; works for C-x v = but not '=' inside of vc-dir
(eval-after-load "vc-hooks"
  '(define-key vc-prefix-map "=" 'vc-ediff))

;; ** R language
(use-package ess
  :defer t ; avoid long init during emacs startup
  :config (progn
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
                         (local-set-key [(shift return)] 'my-ess-eval)
                         ;; but flycheck does nothing if I vist an R file.  Need to do some extra config?
                         (flycheck-mode t)))

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
            (setq ess-use-auto-complete 'script-only)
            ))

(use-package ess-R-data-view :after ess)
(use-package ess-smart-equals :after ess)
(use-package ess-smart-underscore :after ess)
(use-package ess-view :after ess)

;; ** Ruby
(add-hook 'ruby-mode-hook
	  (lambda ()
            ;;(filladapt-mode -1)  ; breaks comment fill in cvs emacs
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

;; * Narrowing
;; Narrowing has too many keys: wipe them out and make it a toggle
;; from http://endlessparentheses.com/emacs-narrow-or-widen-dwim.html
;; (has a bunch of other toggles, maybe handy but I'll stick w/ this for now)
;; Could also try recursive-narrow: https://marmalade-repo.org/packages/recursive-narrow
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

;; Ensure load and package update of modules and exporters: org-man, ox-*, etc.
;; from "wolfer1ne":
;;https://www.reddit.com/r/emacs/comments/5sx7j0/how_do_i_get_usepackage_to_ignore_the_bundled/
;; NOTE: However, on a clean start, I had to start emacs 3X in order for everything to resolve itself.
(use-package org :ensure org-plus-contrib :pin org) 

;; Quick org-mode bolding, etc.  With wrap-region, you'd bold with C-- * http://emacs.stackexchange.com/questions/10029/org-mode-how-to-create-an-org-mode-markup-keybinding
;; (works well with smart-region/expand-region)
(use-package wrap-region
  :diminish wrap-region-mode
  :diminish wrap-region-minor-mode
  :config (progn
	    (add-hook 'org-mode-hook #'wrap-region-mode)
	    (wrap-region-add-wrapper "*" "*" nil 'org-mode) ; bold
	    (wrap-region-add-wrapper "/" "/" nil 'org-mode) ; italics
	    (wrap-region-add-wrapper "_" "_" nil 'org-mode) ; underline
	    (wrap-region-add-wrapper "=" "=" nil 'org-mode) ; literal
	    (wrap-region-add-wrapper "~" "~" nil 'org-mode) ; code
	    (wrap-region-add-wrapper "+" "+" nil 'org-mode))) ; strikeout

;; makes energytop.org super slow
;;(require 'org-ac) ; orgmode autocomplete for org #+ directives
;;(org-ac/config-default)

(use-package org-cliplink ;; make hyper link from URL in clipboard
  :config (define-key org-mode-map (kbd "C-c y") 'org-cliplink))

(define-key global-map "\C-cl" 'org-store-link) ;overwrites what-line
;;(global-set-key "\C-cc" 'org-capture) ; ovewrites org-ref-bibtex bindings
(define-key global-map "\C-ca" 'org-agenda)

;; could play with stripe buffer for tables (must install stripe-buffer package)
;; org-table-stripes-enable      M-x ... RET
;; and a bunch of other things for non-org buffers

;; bullets and default fonts:  I tried several alternatives to the default courier new:
;; big review here: http://www.codeproject.com/Articles/30040/Font-Survey-42-of-the-Best-Monospaced-Programming
;;  anonymous pro: a dense serif font; bad @'s, blobby top lev bullet, rest OK
;;  bitstream vera sans roman: nice looking, bullets a bit big but are clean
;;  consolas: quite nce, bullets are good, readable; the best?
;;  courier new: readable, serifed, a bit thin, bullets good; still the best?
;;  incosolata: nice serif font, top level bullet too big, rest OK; 3rd place?
;;  bitstream vera sans roman: nice looking, bullets a bit big but are clean
;;  lucida console: readable, but too much space, blobby bold; top bullet too big
;;  anonymous pro: a dense serif font; bad @'s, blobby top lev bullet, rest OK
;;  incosolata-g: don't like it; 'f' looks terrible
;;  lucida console: readable, but too much space, blobby bold; top bullet too big

;; https://github.com/cocreature/dotfiles/blob/master/emacs/.emacs.d/emacs.org

;; https://github.com/AssailantLF/emacsconfig/blob/master/config.org
(use-package org-bullets
  :ensure t
  :commands (org-bullets-mode)
  :init
  (setq org-bullets-bullet-list
        '("●" "●" "￭" "￭" "￮" "￮" "▪" "▪" "▸" "▸" "•" "•"))
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;;  (add-hook 'org-mode-hook #'org-bullets-mode))

;; it works if I do this again, below.  WHY?
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; I ALSO deleted the org-bullets-bullet-list customization

;; could give nonheadline lists a nicer bullet than a hyphen
;; from: http://www.howardism.org/Technical/Emacs/orgmode-wordprocessor.html
;;(font-lock-add-keywords 'org-mode
;;                      '(("^ +\\([-*]\\) "
;;                         (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; so can insert and follow links that have Org-mode syntax in any Emacs buffer.
(global-set-key (kbd "C-c L") 'org-insert-link-global)
(global-set-key (kbd "C-c o") 'org-open-at-point-global)

;;Refile w/ headline hierarchy.  Includes leaf nodes, which isn't perfect since you get a ton of matches at the bottom.  Try it out for a while and see...
;;From here: http://stackoverflow.com/questions/26651382/emacs-org-mode-refile-using-the-goto-interface
(setq org-refile-use-outline-path 'file) ; lets you give the refile targets as paths
(setq org-outline-path-complete-in-steps t); will pause after completing each stage of the path

;; hook w/o outline stuff (but is fill adapt NOW working?  I remember seeing
;; something about this on the org list somewhere in Feb. 2010)
(add-hook
 'org-mode-hook
 (function
  (lambda ()
    ;; (filladapt-mode -1))))  ; breaks plain lists
    ;; undo org mode overwrites (C-a, C-e already work OK)
    (define-key org-mode-map (kbd "\C-cb") 'org-iswitchb)
    ;; wasnt' this set by (setq org-replace-disputed-keys t)
    (define-key org-mode-map "\M-p" 'org-insert-drawer)
    )))

;; Unbind org keys I don't use, or which could have been mapped to MS-word-like shift-arrow selection (when org-support-shift-select is set to true)
(define-key org-mode-map (kbd "<C-S-up>")    nil) ; was timestamp clock up sync
(define-key org-mode-map (kbd "<C-S-down>")  nil) ; was timestamp clock dwn sync
(define-key org-mode-map (kbd "<C-S-left>")  nil) ; was switch TODO set
(define-key org-mode-map (kbd "<C-S-right>") nil) ; was switch TODO set

;; ** Org-ref
;;
;; my old org-ref setup. broke cite: key visiting (not creating) for some reason
;; but maybe I want those "require" packages?
;; ;; Setup org-ref: http://www.screencast.com/t/bxfafVydE
;; (use-package org-ref
;;   :defer t
;;   :init
;;   (progn
;;     ;; really want these to be in a cross-platform location
;;     (let ((default-directory docDir))
;;       (setq org-ref-bibliography-notes (expand-file-name "notes.org"))
;;       (setq org-ref-default-bibliography (expand-file-name "energy.bib"))
;;       (setq org-ref-pdf-directory (expand-file-name "papers")))
;;     (setq reftex-default-bibliography org-ref-default-bibliography)
;;     ;; showing broken links vastly slowed down energytop.org so disable
;;     ;; https://github.com/jkitchin/org-ref/issues/468
;;     (setq org-ref-show-broken-links nil)
;;     ;; Utils mentioned here: https://github.com/jkitchin/org-ref
;;     (require 'org-ref-pdf)
;;     (require 'org-ref-bibtex)
;;     (require 'org-ref-latex)
;;     (require 'org-ref-url-utils)
;;     (require 'doi-utils)
;;     ;;    (setq org-ref-completion-library 'org-ref-ivy-cite) ; original helm OK too
;;     ;; Make the org-ref bibtex link folded.  This will make them not export as good latex (bummer) unless do file or dir specific thing.  See org_mode/test.org. See: https://github.com/jkitchin/org-ref/issues/345#issuecomment-262646855
;;     (org-link-set-parameters "cite" :display nil)
;;     ))

;; Inspiration: https://github.com/bixuanzju/emacs.d/blob/master/emacs-init.org
(use-package org-ref
  :after org
  :init
  (let ((default-directory docDir))
    (setq org-ref-bibliography-notes (expand-file-name "notes.org")
          org-ref-default-bibliography (expand-file-name "energy.bib")
          org-ref-pdf-directory (expand-file-name "papers")
          reftex-default-bibliography org-ref-default-bibliography
          bibtex-completion-bibliography org-ref-default-bibliography
          bibtex-completion-library-path org-ref-pdf-directory
          bibtex-completion-notes-path org-ref-bibliography-notes))
  ;; showing broken links slowed down energytop.org (but much less in Oct. 2017)
  ;; https://github.com/jkitchin/org-ref/issues/468
  (setq org-ref-show-broken-links nil) ;still need to prohibit broken link show?
  :config
  (define-key bibtex-mode-map "\C-cj" 'org-ref-bibtex-hydra/body)
  ;; bibtex-key generator: firstauthor-year-title-words (from bixuanzju)
  (setq bibtex-autokey-year-length 4
        bibtex-autokey-name-year-separator "-"
        bibtex-autokey-year-title-separator "-"
        bibtex-autokey-titleword-separator "-"
        bibtex-autokey-titlewords 2
        bibtex-autokey-titlewords-stretch 1
        bibtex-autokey-titleword-length 5)
      ;; Make the org-ref bibtex link folded.  This will make them not export as good latex (bummer) unless do file or dir specific thing.  See org_mode/test.org. See: https://github.com/jkitchin/org-ref/issues/345#issuecomment-262646855
  (org-link-set-parameters "cite" :display nil)
)

(use-package org-autolist
  :after org
  :diminish org-autolist-mode
  :config
  (add-hook 'org-mode-hook (lambda ()
			     (org-autolist-mode)))) ; new - or -[ ] w/ return

;; ** Org Mode Dedicated Targets

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

;; ** Org Export

(use-package ox-minutes :defer 5) ; nice(er) ascii export, but slow start

;; I couldn't get this to work after converter .emacs to use-package.  I had two problems
;;
;; 1.) On my SP4 with a clean install, I got the error "ox-pandoc was not provided"
;; 2.) on my work laptop, I somehow didn't see this, but no pandoc functions showed up on the org-export-dispatch list either.
;;
;; ;; Pandoc
;; ;; default options for all output formats. Intially from: https://github.com/kawabata/ox-pandoc
;; (use-package ox-pandoc
;;   :init
;;   (setq org-pandoc-options '((standalone . t)))
;;   ;; cancel above settings only for 'docx' format
;;   (setq org-pandoc-options-for-docx '((standalone . nil)))
;;   ;; special settings for beamer-pdf and latex-pdf exporters
;;   (setq org-pandoc-options-for-beamer-pdf '((latex-engine . "pdflatex")))
;;   (setq org-pandoc-options-for-latex-pdf '((latex-engine . "pdflatex")))
;;   ;; (setq org-pandoc-options-for-beamer-pdf '((latex-engine . "xelatex")))
;;   ;; (setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")))
;;   :config
;;   ;; the below did not help after org-mode use of use-package, and may have messed up startup on a clean install
;;   ;;
;;   ;; Delay loading but let org-export-dispatch menu still see it.  Actually, unless I do this, I don't see pandoc in the menu at all.  From: https://github.com/kawabata/ox-pandoc/issues/7
;;   ;;  (with-eval-after-load 'ox (require 'ox-pandoc)))
;;   )

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
  :config (progn (require 'flyspell-correct-ido)
		 (define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-previous-word-generic)))

;; finds repeated words
(defun find-find-word-word ()
  (interactive)
  (re-search-forward "\\b\\(\\w+\\)\\W+\\1\\b"))
(global-set-key "\e=" 'find-find-word-word)

(use-package writegood-mode
  :config (progn
            (global-set-key "\C-cg" 'writegood-mode)
            (global-set-key "\C-c\C-gg" 'writegood-grade-level)
            (global-set-key "\C-c\C-ge" 'writegood-reading-ease)))


;; https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org
;; do I like this?
(use-package artbollocks-mode
  :defer t
;;  :load-path  "~/elisp/artbollocks-mode"
  :config
  (progn
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
    (setq artbollocks-jargon nil)))

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

;; faster latex entry: http://orgmode.org/manual/CDLaTeX-mode.html#CDLaTeX-mode
;;
;; When scimax/org-return, maybe use it instead.  May go back to this if the two are merged.
(use-package cdlatex
  :diminish org-cdlatex-mode
  :config (add-hook 'org-mode-hook 'turn-on-org-cdlatex))

;; * Emacs Command Execution

;; (use-package undo-tree ; so far, I only use the redo C-? that it adds
;;   :config (undo-tree-mode t))

;; do I like this ?
;; I was only using the redo C-? that it addsthat it adds
; 'q' gets out of the tree mode, but is the tree mode helpful?
(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

(fset 'yes-or-no-p 'y-or-n-p) ; type just "y" instead of "yes"

(use-package which-key ; complex key hints, better than guide-key
  :diminish which-key-mode
  :config (progn (which-key-mode)
		 (which-key-setup-side-window-right-bottom))) ; do bottom if no room on side

(defhydra hydra-utils (:color blue :hint nil)
  "
Utils:
^Info1^         ^Info/cust^       ^Org^                    ^Nav/Edit^
--------------------------------------------------------------------------------
_b_: bindings   _m_: mode        _h_: X headline in buffer  _w_: ace-window
_s_: symbol     _i_: info        _a_: X heading in agenda   _p_: counsel-yank-pop
_k_: key        _c_: cust-appr   _q_: swoop org buffers   _e_: ediff-buffers
_f_: face       _C_: cust-mode   _H_: X helm-mini         _E_: ediff-files
--------------------------------------------------------------------------------
           _._: mark position _/_: jump to mark
"
  ("b" counsel-descbinds)
  ("s" describe-symbol)
  ("k" describe-key)
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

  ("h" helm-org-headlines)
  ("a" helm-org-agenda-files-headings)
  ("q" helm-multi-swoop-org)
  ("H" helm-mini) ; buffers & recent files: like ivy with "virtual buffers"

  ("w" ace-window)
  ("p" counsel-yank-pop)
  ("e" ediff-buffers)
  ("E" ediff-files)

  ("." org-mark-ring-push :color red)
  ("/" org-mark-ring-goto :color blue)
  ;; ("B" helm-buffers-list)
  )
;; ("R" helm-recentf)
(global-set-key (kbd "<M-apps>") 'hydra-utils/body)

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

(show-paren-mode 1) ; turn on blinking parens, any computer?

;;default major setq
;; visual line mode messes up org-tables but is GREAT for everything else
(global-visual-line-mode +1)
(global-set-key (kbd "C-c w") 'toggle-truncate-lines) ; e.g. to view org-mode tables

; too crowded?, force on RHS, like Anzu search counter was on LHS?
(display-time-mode 1) ; time on the modeline (is customized)

(mouse-avoidance-mode 'animate)  ; get mouse out of way of cursor, is customized

;; this TERRIBLY SLOWS DOWN energytop.org and others
;;(global-hl-line-mode t) ; horizontal bar where cursor is, is customized
;; Alternatives
;;  * turn off in org-mode using hl-line-inhibit-highlighting-for-modes
;;  * find that flashing cursor thing I saw in C'est la Emacs Youtube videos
;;  * use toggle-hl-line-when-idlefrom  package hl-line+ (not sure if that helped)


(auto-fill-mode -1)  ; don't do autofill: do visual wrap instead
(remove-hook 'text-mode-hook #'turn-on-auto-fill) ; in case some other mode sets this hook in text mode

;; Sets the wrap-prefix property on the fly so that single-long-line
;; paragraphs get word-wrapped in a way similar to what you'd get with
;; M-q using adaptive-fill-mode,
;; However, it doesn't indent 2nd line numbered or lettered lists
(use-package adaptive-wrap ; required for visual line mode hook below?
  :diminish adaptive-wrap-prefix-mode
  :config (add-hook 'visual-line-mode-hook
		    (lambda ()
		      (adaptive-wrap-prefix-mode +1)
		      (diminish 'visual-line-mode)))) ; hide mode string in mode line
;; Other adaptive-wrap settings I could use but
;; don't want extra indent after bullet
;; (with-eval-after-load 'adaptive-wrap
;;   (setq-default adaptive-wrap-extra-indent 0))
;;  (setq-default adaptive-wrap-extra-indent 2))

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
 '(aw-background t)
 '(blink-cursor-mode nil)
 '(conda-postactivate-hook (quote (elpy-use-ipython)))
 '(counsel-grep-base-command "grep -nEi '%s' %s")
 '(delete-selection-mode nil)
 '(dired-dwim-target t)
 '(display-time-24hr-format t)
 '(display-time-default-load-average nil)
 '(emacsw32-style-frame-title t)
 '(ess-default-style (quote OWN))
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
 '(ido-use-virtual-buffers t)
 '(indent-tabs-mode nil)
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
    (smartscan artbollocks-mode highlight-thing try conda use-package counsel swiper-helm esup auctex auctex-latexmk ess ess-R-data-view ess-smart-equals ess-smart-underscore ess-view psvn igrep helm-cscope xcscope ido-completing-read+ helm-swoop ag ein company elpy anaconda-mode dumb-jump outshine highlight-indent-guides lispy org-download w32-browser replace-from-region xah-math-input ivy-hydra flyspell-correct flyspell-correct-ivy ivy-bibtex google-translate gscholar-bibtex helm-google ox-minutes transpose-frame which-key smart-region beacon ox-clip hl-line+ ox-pandoc copyit-pandoc pandoc pandoc-mode org-ac flycheck-color-mode-line flycheck-perl6 undo-tree iedit wrap-region avy cdlatex latex-math-preview latex-pretty-symbols latex-preview-pane latex-unicode-math-mode f org-ref writegood-mode auto-complete rainbow-delimiters smex matlab-mode popup parsebib org-plus-contrib org-cliplink org-bullets org-autolist org key-chord ido-grid-mode ido-hacks ido-describe-bindings hydra google-this google-maps flx-ido expand-region diminish bind-key biblio async adaptive-wrap buffer-move cygwin-mount)))
 '(paren-message-show-linenumber (quote absolute))
 '(paren-message-truncate-lines nil)
 '(recentf-max-menu-items 60)
 '(recentf-max-saved-items 200)
 '(recentf-mode t)
 '(replace-char-fold t)
 '(require-final-newline t)
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
 '(show-paren-mode t)
 '(swiper-action-recenter nil)
 '(tool-bar-mode nil)
 '(visual-line-fringe-indicators (quote (nil top-right-angle)))
 '(w32-use-w32-font-dialog nil)
 '(w32shell-cygwin-bin "C:\\cygwin64\\bin"))

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
 '(fringe ((t (:background "grey95" :foreground "firebrick" :weight bold))))
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
 '(table-cell-face ((t (:background "honeydew1" :foreground "black" :inverse-video nil))))
 '(writegood-duplicates-face ((t (:underline (:color "orange" :style wave)))))
 '(writegood-passive-voice-face ((t (:underline (:color "MediumOrchid1" :style wave)))))
 '(writegood-weasels-face ((t (:underline (:color "olive drab" :style wave))))))

