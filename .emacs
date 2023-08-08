;; * Emacs Startup Behavior

;; Profile emacs startup
;; From: https://github.com/daviwil/dotfiles/blob/master/Emacs.org#startup-performance
;; https://www.youtube.com/watch?v=bF84mQMmfa8 (and comments)

;; commentor says emacs -Q loads with 113 features
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs Loaded in %s: %d garbage collections and %d features loaded."
                     (format "%.2f secs"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done (length features))))

(require 'server) ; so file association works on windows and
(server-start)  ; for emacsclient (emacsclientw on Windows)

(add-to-list 'default-frame-alist '(fullscreen . fullheight)) ; startup at full height
(save-place-mode 1) ; remember cursor position when returning to a file

(setq inhibit-startup-message t
      inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode) ; so scratch is an org buffer

(defun sdo/find-exec(cmd_name &optional notFoundMsg)
  "Finds path to executable 'cmd_name' and returns it, or nil if not found."
  (let (cmd_path retpathstr)
    (setq cmd_path (executable-find cmd_name))
    (if (not cmd_path)
        (progn (if notFoundMsg
		   (warn "%s not found. %s" cmd_name notFoundMsg)
		 (warn  "%s not found." cmd_name))
	       (setq retpathstr nil))
      (progn (message "found %s at: %s" cmd_name cmd_path)
             (setq retpathstr cmd_path))))) ; there must be a better way...

;; Greatly reduce garbage collection on startup
;; (https://youtu.be/9i_9hse_Y08?t=2973)
;; For me, it went from 59 startup GC events to 5 of them
;; BE SURE TO DECREASE it again at END OF STARTUP
(setq gc-cons-threshold (* 50 1000 1000))

;; * Package Configuration
;; ** straight.el
;; https://github.com/raxod502/straight.el#features
;;
;; On replacing package.el w/ straight:
;; https://www.youtube.com/watch?v=UmbVeqphGlc&t=237s

(sdo/find-exec "git" "Need git for straight.el")

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; to use straight within use-package, do like:
(straight-use-package 'use-package)

;; make straight the default for use-package (so don't need :straight)
(setq straight-use-package-by-default t)
;; good explanation of how to debug emacs init speed:
;; https://www.youtube.com/watch?v=bF84mQMmfa8  (system crafters)
(setq use-package-verbose t) ; messages when load pkg., good for init debug
;; to see if problems are tdue :defer, :after,... problems
;; https://emacs.stackexchange.com/a/33798/14273
;; (setq use-package-always-demand t)

;; https://www.manueluberti.eu/emacs/2019/11/02/thirty-straight-days/
(defun mu-straight-pull-or-prune (&optional prune)
  "Update all available packages via `straight'.
With PRUNE, prune the build cache and the build directory."
  (interactive "P")
  (if prune
      (when (y-or-n-p "Prune build cache and build directory?")
        (straight-prune-build-cache)
        (straight-prune-build-directory))
    (when (y-or-n-p "Update all available packages?")
      (straight-pull-all))))

;; ** package.el
;; Avoid complaints, put before (require 'package)
;; https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; use package.el at least for getting a list of archives
;;(require 'package)
;;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t) 
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; TODO: Do I need separate org archive?  Boots faster if I remove it?
;;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;;(unless (package-installed-p 'use-package) ; so can do a totally clean start
;;  (message "Installing use-package, diminish and refreshing")
;;  (package-refresh-contents)
;;  (package-install 'use-package)
;;  (package-install 'diminish)) ; wouldn't install w/ use-package for some reason

;; from: http://cachestocaches.com/2015/8/getting-started-use-package/
;;(eval-when-compile
;;  (require 'use-package))

;;(use-package bind-key) ; use inside use-package, invoke with :bind-key

(setq use-package-always-ensure t) ; so use-package always installs missing pkgs
(use-package diminish) ; can prevent display of package mode string
(use-package try :defer t) ; M-x try to test a pkg w/o installing it

;; ** elpa gpg key error workaround
;; Just these things skip elpa 27.1 gpg key error:
;;
;; Install gnupg package w/ choco.  Seems that was using gpg program
;; in windows git, and this was mixing up windows/linux paths
;;
;; This updates some keyring thing
;; https://www.reddit.com/r/emacs/comments/d9rchm/emacs_archivecontentssig_not_verifying/
(use-package gnu-elpa-keyring-update)

;; * Emacs Debugging

;; M-x restart-emacs kills emacs, restarts another one.  A simple convenience.
;; already included in emacs 29, so can remove this: https://youtu.be/RYGwG62VMGw?t=656
(use-package restart-emacs)

;; Find out what's slowing down emacs start by running M-x esup
;; (use-package esup :defer t) ; this might have worked but I don't remember
;;
;;  get a trace dump on error
;;  M-x toggle-debug-on-error

;; * Computer-specific setup
;; ** OS-dependent settings

(defvar running-ms-windows
  (eq system-type 'windows-nt))

(defvar running-MacOS
  (eq system-type 'darwin))

(defvar running-gnu-linux
  (string-match "linux" (prin1-to-string system-type)))

(if running-gnu-linux
    (progn (setq os-which-cmd "which")
           (global-set-key [C-f11] 'shell) ; native shell
           ;; force chrome on Linux
           (setq browse-url-browser-function (quote browse-url-generic))
           (setq browse-url-generic-program "google-chrome")))

(defun sdo/popdir (dir)
  "Like unix popd.  Return parent directory of dir."
  (unless (equal "/" dir)
    (file-name-directory (directory-file-name dir))))

(if running-ms-windows  ; more windows setup is also later in .emacs
    (progn 
      ;;Try to match winxp minimize command (also matches works in Gnome?)
      ;; Alt-space minimizes frame in winxp. Ideally, it'd be [Alt-space n]
      ;; Code gotten by: M-x global-set-key <RET> KEY CMD <RET>, <ESC> <ESC>
      (global-set-key "\240" (quote iconify-frame))
      ;; menu key is M-x, like it is on Linux
      (global-set-key (kbd "<apps>") 'execute-extended-command)
      (global-set-key [C-f11] 'powershell) ; native shell
      (setq w32-use-w32-font-dialog nil)
      (setq os-which-cmd "where")
      (if (setq pacbin-windows (sdo/find-exec
                                "pacman" "Windows needs MSYS2 for pdf-tools & more"))
          (progn 
            ;; Ensure mingw64 libraries on front of PATH, not other tools' libs
            ;; https://github.com/politza/pdf-tools#compilation-and-installation-on-windows
            (setq msys2dir (sdo/popdir
                            (sdo/popdir (sdo/popdir pacbin-windows))))
            (setq msys2libdir (expand-file-name "mingw64\\bin" msys2dir))
            (setenv "PATH" (concat msys2libdir ";" (getenv "PATH"))))
        (message "Can't find msys2 on Windows so skipping pdf-tools init"))))

;; ** Individual Computer-dependent settings
(setq computerNm (downcase system-name)) ; downcase: was getting
                                        ; random case
(defun get-shareDir (s)
  (cond ((string-equal s "desktop-vpfvctb") "C:/Users/scott/OneDrive/share")
        ((string-prefix-p "macbook-pro" s) "/Users/scott/OneDrive/share")
        (t (progn (warn "Can't assign shareDir for unknown computer: %s" s)
                  (concat "unknown_shareDir_for_unknown_computer_" s)))))

(setq shareDir (get-shareDir computerNm))

(unless (file-readable-p shareDir)
  (warn "shareDir %s doesn't exist or not readable" shareDir))
(setq docDir (expand-file-name "ref" shareDir))
(unless (file-readable-p docDir)
  (warn "docDir %s doesn't exist or not readable" docDir))
(message "computerNm %s\nshareDir %s\ndocDir %s" computerNm shareDir docDir)

;; ** Screen/terminal dependent settings

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Multiple-Terminals.html
;; 
;; (display-monitor-attributes-list)
;; returns list of the physical monitor attributes. This includes the display name (e.g., ".DISPLAY1"):
;; 
;; (((geometry 0 0 1792 1120) (workarea 0 25 1792 1095) (mm-size 345 215) (frames #<frame Emacs@MacBook-Pro.local 0x7fb55fa42c80>) (name . "Color LCD") (backing-scale-factor . 2)))
;;
;; (frame-monitor-attributes)
;; returns info for current frame (the one the active cursor is in?)
;;
;;((geometry 0 0 1792 1120) (workarea 0 25 1792 1095) (mm-size 345 215) (frames #<frame Emacs@MacBook-Pro.local 0x7fb55fa42c80>) (name . "Color LCD") (backing-scale-factor . 2))
;;
;; Tips on auto-changing fonts vs. monitor: https://emacs.stackexchange.com/questions/22513/is-there-a-way-to-detect-change-of-monitor-in-emacs-elisp

;; Adjust pixel-based values depending upon screen DPI
;; Modified (use workarea not geometry) unhammer's code at:
;; https://emacs.stackexchange.com/questions/28390/quickly-adjusting-text-to-dpi-changes
;; Compare with http://dpi.lv/
(require 'cl-lib) ; the updated package for 'cl' functions
(defun dpi-hv (&optional display)
  "Returns the horizontal and vertical DPI of DISPLAY. 
DISPLAY is a display name, frame or terminal, as in
`display-monitor-attributes-list'.  Seems like they are almost identical on my CPR work monitor, though."
  (cl-flet ((mm2in (lambda (mm) (/ mm 25.4))))
    (let* ((atts (frame-monitor-attributes))
           (pix-w (cl-fourth (assoc 'workarea atts)))
           (pix-h (cl-fifth (assoc 'workarea atts)))
           (in-w (mm2in (cl-second (assoc 'mm-size atts))))
           (in-h (mm2in (cl-third (assoc 'mm-size atts)))))
      (progn
        (message "height: %s in %s pix; width %s in %s pix"
                 pix-h in-h pix-w in-w)
        (cons (/ pix-w in-w) (/ pix-h in-h))))))

(defun dpi-avg (&optional display)
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
      (message "pixdims=(%s %s)  mmdims=(%s %s) mm-d=%s, in-d=%d"
               pix-w pix-h mm-w mm-h mm-d (mm2in mm-d))
      (/ pix-d (mm2in mm-d)))))

;; DPI vs. monitor
;;
;; | screen         | dpi |
;; |----------------+-----|
;; | Surface Pro    | 267 |
;; | Surface Book 2 | 260 |
;; | Dell 27" 4K    | 128 |
;; | Dell 24" 4K    |     |
;; | MacBook Pro    | 131 |
;; | HP 27" 1080p   |     |
;; | LG Dualup 28   | 130 |
;;
;; This sets all frames to a specific given font
;; https://gist.github.com/mecab/1bc847e51034ae1e11b813b79f7da553
;; TODO easy to work from this.
;; TODO but set different fonts on sceens w/ different resolutions?

(defun change-font-size (size)
  "Change font size (clearly `:height` in `face-attribute`) to given SIZE."

  (interactive
   (list
    (read-number
     (format "Input font size (current_size=%d): " (face-attribute 'default :height))
     nil)))
  
  (set-face-attribute 'default nil :height size)
  )

(defun set-default-font-per-screen ()
  "Change font size (`:height` in `face-attribute`) approriately."

  ;;  (setq nPixDiv (calcDivNpix))
  ;;  (message "nPixDiv: %s" nPixDiv)

  (let ((fontHeightBase 100))
    (if running-MacOS
        ;; Windows font scalings were OK as is; MacOS needs a touchup
        (setq fontHeightBase 140))

    ;; https://protesilaos.com/codelog/2020-09-05-emacs-note-mixed-font-heights/
    (set-face-attribute 'default nil :font "Consolas" :height fontHeightBase)
    (set-face-attribute 'fixed-pitch nil :family "Consolas" :height 1.0)
    (set-face-attribute 'variable-pitch nil :family "Georgia" :height 1.0)))

(defun my-display-changed-hook (disp)
  (set-default-font-per-screen)
  (message "Changed to display of size %s" disp)) ;; not that useful w/o DPI change

(use-package dispwatch
  :config (and
           (add-hook 'dispwatch-display-change-hooks #'my-display-changed-hook)
           (dispwatch-mode 1)))

(add-hook 'after-init-hook #'set-default-font-per-screen)
(add-hook 'after-make-frame-functions #'set-default-font-per-screen)

(defun calcDivNpix ()
  "Computes # pix for window divider based on screen DPI.
TODO: make this a general function."

  (let* ((nPixHigh 6.0)    ; Surface Pro / SB2: dpi = 267 / 260
         (DPIhigh   267)
         (nPixLow   3.0)    ; CPR monitor
         (DPIlow    94.0)
         DPIthis nPixThis)

    (setq DPIthis (dpi-avg))
    (message "DPIthis %s" DPIthis)
    (setq nPixThis (max 1 (round (+ (* (/ (- nPixHigh nPixLow) (- DPIhigh DPIlow)) (- DPIthis DPIlow)) nPixLow))))))


(if window-system
    (progn
      ;; middle mouse click on url starts browser in every file
      (when (fboundp 'goto-address) (add-hook 'find-file-hooks 'goto-address))
      (define-key global-map [S-down-mouse-3] 'imenu)

      ;; TODO: put this inside of set-default-font-per-screen()
      
      ;; Set window dividers (mouse grab lines for moving window boundaries)
      (setq nPixDiv (calcDivNpix))
      (message "nPixDiv: %s" nPixDiv)
      ;; setq said to best best way, even though this is customizable
      (setq window-divider-default-right-width nPixDiv)
      ;; bottom hard to mouse on SP; hack is to add a pixel (TODO: improve)
      (setq window-divider-default-bottom-width (+ nPixDiv 1))
      )
  (progn
    ;; on a term or cmdshell:
    (menu-bar-mode -1) ;menubar off when on an xterm (xemacs does automatically)
    (set-face-background 'region "pale turquoise"))) ;works on xterm

;; to install it with the ps-print package, which I hadn't for 21.8, at least.
(require 'ps-print)
(setq
 ps-print-color-p t
 ps-paper-type 'a4
 ps-bottom-margin (/ (* 72 2.0) 2.54))

;; * Operating System Interaction

;; ** exec from Shell (MacOS)

;; Enable environment variables for all package installations.  Recommened by the homebrew emacs-plus emacs@28 package. Causes warnings on Windows, though.
(if running-MacOS
    ;; https://github.com/dtan4/dot.emacs.d/blob/master/init.el
    (use-package exec-path-from-shell
      :config
      (if (display-graphic-p)
          (let ((envs '("PATH" "GOPATH" "GOROOT")))
            (exec-path-from-shell-initialize)
            (setq exec-path-from-shell-check-startup-files nil)
            (exec-path-from-shell-copy-envs envs)))))

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
    (use-package powershell :defer t))

;; * Backups, autosaves, autoloads, etc.
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

;; * Org Mode

;;   Put org mode use-package near top of .emacs.  emacs 28.2 warning
;;   messages suggest that when org is installed with straight.el,
;;   there will be an org-mode version conflict somwhere (I didn't
;;   quite understand this, though)

;; ** Org-* dirs and files

;; set up org and bib for old way of doing things and experimental org-roam, or a true org-roam, org-ref setup
(setq bibfile_energy_fnm (expand-file-name "energy.bib" docDir)
      bibfile_energy_pdf_dir (expand-file-name "papers" docDir)
      bibfile_energytop_fnm (expand-file-name "energytop.org" docDir)
      zotero_filedir (expand-file-name "zotero" docDir)
      bibfiles_zotero_fnm (directory-files zotero_filedir t "\\.bib$")
      bibfile_DOE_dir (expand-file-name "DOE_brainstorm" docDir)
      bibfile_DOE_fnm (expand-file-name "deepSolarDOE.bib" bibfile_DOE_dir)
      bibfile_DOE_pdf_dir (expand-file-name "papers" bibfile_DOE_dir))

(setq bibfile_list (append (list bibfile_energy_fnm bibfile_DOE_fnm)
                           bibfiles_zotero_fnm)
      bibpdf_dir_list (list bibfile_energy_pdf_dir  bibfile_DOE_pdf_dir
                        zotero_filedir))

(setq org-roam-dir (expand-file-name "org-roam" docDir))

;; Find pdf w/ JabRef/Zotero fields
(setq bibtex-completion-pdf-field "file")

;; ** Org package, basic config

;; TODO: experiment with C-c C-x C-b or M-x sdo/org-tree-to-indirect-buffer
;;
(use-package org
  ;;  :defer 0
  ;; avoid org bug that breaks org-roam
  ;; https://github.com/org-roam/org-roam/issues/2361#issuecomment-1650957932
  ;; doesn't work anymore, so remove.  Hopefully new org has fixed tis bug
  ;; :straight (:branch "ca873f7")
  :diminish org-mode  ; doesn't hide the "Org" in modeline, for some reason
  :diminish org-table-header-line-mode  ; customization: org-table-header-line-p
  :config
  ;; TODO: try new link bindings: https://youtu.be/ks-3LphODws?t=346
  (define-key global-map "\C-cl" 'org-store-link)
  ;; TODO: get rid of (kbd *): not needed in emacs 29: https://youtu.be/RYGwG62VMGw?t=798
  ;; NOTE: emacs 29 will then be stricter about syntax keyboard setting: https://youtu.be/RYGwG62VMGw?t=949
  (global-set-key (kbd "C-c L") 'org-insert-link-global) ; insert in any buffer
  (global-set-key (kbd "C-c o") 'org-open-at-point-global) ; open in any buffer
  ;;(global-set-key "\C-cb" 'org-iswitchb) ; switch between org buffers
  ;;(global-set-key "\C-cc" 'org-capture) ; ovewrites org-ref-bibtex bindings
  ;;(define-key global-map "\C-ca" 'org-agenda) ; I don't use agenda

  ;; Unbind standard org keys so can always use for buffer-move
  (define-key org-mode-map (kbd "<C-S-up>") nil) ; was timestamp clock up sync
  (define-key org-mode-map (kbd "<C-S-down>") nil) ; was timestamp clck dwn sync
  (define-key org-mode-map (kbd "<C-S-left>")  nil) ; was switch TODO set
  (define-key org-mode-map (kbd "<C-S-right>") nil) ; was switch TODO set
  ;; (define-key org-mode-map (kbd "C-x n <return>") 'org-toggle-narrow-to-subtree) ; was switch TODO set
  ;;(define-key org-mode-map (kbd "C-x n")
  ;;'org-toggle-narrow-to-subtree) ; was switch TODO set

  ;; NOTE: I've also mapped: (org-speed-commands-user '(("s" . narrow-or-widen-dwim)))
  ;; Match narrow/widen binding in other modes (below)
  (define-key org-mode-map (kbd "C-x n n") 'recursive-narrow-or-widen-dwim)

  ;; open docx files in default application (ie msword)
  ;; https://emacs.stackexchange.com/questions/22485/org-mode-pandoc-export-to-docx-and-open
  (setq org-file-apps
        '(("\\.docx\\'" . default)
          ("\\.mm\\'" . default)
          ("\\.x?html?\\'" . default)
          ("\\.pdf\\'" . default)
          (auto-mode . emacs)))
  ;; nice checkbox chars: https://jft.home.blog/2019/07/17/use-unicode-symbol-to-display-org-mode-checkboxes/comment-page-1/?unapproved=39&moderation-hash=c27ca582f6ef7a0e2364a0c81b730dc2#comment-39
  :hook (org-mode . (lambda ()
                  "Beautify Org Checkbox Symbol"
                  (push '("[ ]" .  "☐") prettify-symbols-alist)
                  (push '("[X]" . "☑" ) prettify-symbols-alist)
                  (push '("[-]" . "❍" ) prettify-symbols-alist)
                  (prettify-symbols-mode))))

(use-package org-superstar
  ;;  :after org
  :custom
  (org-superstar-cycle-headline-bullets nil)
  (org-superstar-headline-bullets-list '("●" "￭" "￮" "►" "•" "□" "▸" "▫" "▹"))
  (org-superstar-item-bullet-alist '((42 . 10043) (43 . 10011) (45 . 9644)))
  (org-superstar-special-todo-items t)
  (org-superstar-todo-bullet-alist '(("TODO" . 9646) ("DONE" . 9647)))
  :init
  ;; org-superstar github: loads faster
  (setq inhibit-compacting-font-caches t)
  ;; only works w/ "org-superstar-mode: but see like it s/b just "org-superstar"
  :hook (org-mode . org-superstar-mode))

(with-eval-after-load 'org
  ;; ;; From: https://emacs.stackexchange.com/a/41705/14273
  (defun org-fold-outer ()
    ;; Fold org-headline that the cursor is inside of
    (interactive)
    (beginning-of-line)
    (if (string-match "^*+" (thing-at-point 'line t))
        (outline-up-heading 1))
    (outline-hide-subtree))
  (define-key org-mode-map (kbd "C-c u") 'org-fold-outer)
  ;; painful
  ;;(define-key org-mode-map (kbd "C-c <C-tab>") 'org-fold-outer)
  )

; ** Org Basic Config

(use-package org-autolist ; new - or -[ ] w/ return
  :diminish org-autolist-mode
  :hook (org-mode . org-autolist-mode))

;; Quick org emphasis:  Select text & hit key below. expand-region pkg helps.
;; Handy using er/expand, mapped to C-=
(use-package wrap-region
  :after org
  :diminish wrap-region-mode
  :diminish wrap-region-minor-mode
  :hook (org-mode . wrap-region-mode)
  :config
  (wrap-region-add-wrapper "*" "*" nil 'org-mode)  ; bold
  (wrap-region-add-wrapper "/" "/" nil 'org-mode)  ; italics
  (wrap-region-add-wrapper "_" "_" nil 'org-mode)  ; underline
  (wrap-region-add-wrapper "=" "=" nil 'org-mode)  ; literal
  (wrap-region-add-wrapper "~" "~" nil 'org-mode)  ; code
  (wrap-region-add-wrapper "+" "+" nil 'org-mode)) ; strikeout

(use-package org-cliplink ; make hyper link from URL in clipboard
  :after org
  :config (define-key org-mode-map (kbd "C-c y") 'org-cliplink))

;; ** org Mode Dedicated Targets

;; --- SEEMS OK does org-mode dedicated targets cause cache probs? ----------
;;
;; TODO: Fix M-m link saving. It picks sometimes picks up a headline star and then puts it into the stored link (I think).  I'm noticing this in bad links to dedicated links sprinked around energytop.org.  I don't know if these wer made when I initially created the dedicated target; if it was when I typed M-m when on an already existing dedicated target, or if I somehow just pasted this in erroneously myself, which seems unlikely, since I've seen many.  Additionally, examples of this error that I can remember made the mistake on dedicated links that in top level headlines e.g. "* Headine" and not "*** Headline"
;;
;; Hides the <<>> around dedicated targets; the face of the remaining visible text is set by customizing the face: org-target
;; Inspiration: https://emacs.stackexchange.com/questions/19230/how-to-hide-targets
;; but regexp there worked only for all :alnum: targets.  I tried to
;; invert org-target-regexp but couldn't get that to work, so here,
;; I'm just matching printable chars in the middle.

;; TODO: modify internal org-links code here:
;; http://pragmaticemacs.com/emacs/insert-internal-org-mode-links-the-ivy-way/
;; to get dedicated links plus the list of headlines which aren't dedicated?
;; TODO: maybe this approach to dedicated targets is more robust?
;;       https://emacs.stackexchange.com/questions/19230/how-to-hide-targets
;;       or maybe the github library that resulted from that discussion?
;;       https://github.com/talwrii/org-hide-targets

(with-eval-after-load 'org

  ;; From: Nicolas Goaziou: https://mail.google.com/mail/u/0/#inbox/QgrcJHsNmtZZNZFRdHZBqCqcmZVLJkSdzJq
  ;; He also suggested this bit of code as another alternative:
  ;;         (org-element-lineage (org-element-context) '(target radio-target) t)
  (defun org-at-target-p ()
    "Return true if cursor is on a dedicated target.  
This is a replacement for org-mode's buggy, and now-deleted, function"
    (memq (org-element-type (org-element-context)) '(target radio-target)))

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
  ;; IMPROVEMENT: Make this work for across files, like jkitchin's better-link thing
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
  )

;; ** Hide/show/toggle :PROPERTIES: drawer

(with-eval-after-load 'org

  (defun org-hide-properties ()
    "Hide all org-mode headline property drawers in buffer. Could be slow if it has a lot of overlays.
TODO: instead of regexp, try to parse org.  Maybe use the two suggestions above for org-at-target-p, or somehow get and walk the buffer's AST.  Parsing seems like it'd be faster.
TODO: does this work if you've hidden props and then create a new prop door?  Can you still hide and unhide everything, or does this cause a wierd bug?
TODO: hide a new prop drawer as soon as leave it, if in hide mode?
TODO: add a cycle that opens or collapses all prop drawers?"
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward
              "^ *:properties:\n\\( *:.+?:.*\n\\)+ *:end:\n" nil t)
        (let ((ov_this (make-overlay (match-beginning 0) (match-end 0))))
          (overlay-put ov_this 'display "")
          (overlay-put ov_this 'hidden-prop-drawer t))))
    (put 'org-toggle-properties-hide-state 'state 'hidden))

  (defun org-show-properties ()
    "Show all org-mode property drawers hidden by org-hide-properties."
    (interactive)
    (remove-overlays (point-min) (point-max) 'hidden-prop-drawer t)
    (put 'org-toggle-properties-hide-state 'state 'shown))

  (defun org-toggle-properties ()
    "Toggle visibility of property drawers."
    (interactive)
    (if (eq (get 'org-toggle-properties-hide-state 'state) 'hidden)
        (org-show-properties)
      (org-hide-properties)))

  (define-key org-mode-map (kbd "C-c p h") 'org-hide-properties)
  (define-key org-mode-map (kbd "C-c p s") 'org-show-properties)
  (define-key org-mode-map (kbd "C-c p t") 'org-toggle-properties)

  ;; ** Text -> checkbox -> TODO
  ;; Converts non-heading text lines at cursor or in region to checkboxes lists;
  ;; convert checkbox lists to TODO's with: C-c C-_  Note: C-c -
  ;; converts to list and C-c * converts to headline
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
  )
  (define-key org-mode-map (kbd "C-c C-_") 'org-set-line-checkbox)

;; ** Ebib

;; I'm not using this
;; (use-package ebib
;;   :custom
;;   (ebib-preload-bib-files bibfile_list)
;;   (ebib-index-columns
;;    (quote
;;     (("timestamp" 12 t)
;;      ("Entry Key" 20 t)
;;      ("Author/Editor" 40 nil)
;;      ("Year" 6 t)
;;      ("Title" 50 t))))
;;   (ebib-index-default-sort (quote ("timestamp" . descend)))
;;   (ebib-timestamp-format "%Y.%m.%d")
;;   (ebib-use-timestamp t))

;; ** Org-ref

;; org-ref was causing error: "Cannot open load file: No such file or directory, helm-config:
;; This is probably because helm-config was removed and org-ref is old
;; https://emacs.stackexchange.com/questions/75337/getting-error-cannot-open-load-file-no-such-file-or-directory-helm-config-su
;;
;; required by org-ref
;; (use-package helm-bibtex)

;; (use-package org-ref
;; ;;  :after org helm-bibtex ;; blocks bibtex hydra binding if no org file visit
;;   :straight (:branch "org-ref-2" :host github :repo "jkitchin/org-ref")
;;   ;; doesn't work
;;   ;;:bind ("C-c j" . 'org-ref-bibtex-hydra/body)
;;   :init
;;   (let ((default-directory docDir))

;;     (setq org-ref-bibliography-notes org_ref_notes_fnm
;;           org-ref-default-bibliography bibfile_list 
;;           org-ref-pdf-directory bibpdf_dir_list
;;           reftex-default-bibliography org-ref-default-bibliography))
;;   ;;  https://github.com/jkitchin/org-ref/issues/468
;;   ;;(setq org-ref-show-broken-links nil) ;still need to prohibit broken link show?
;;   :config ;; do it all in :init?
;;   ;; doesn't work: doesn't show up bindings when edit .bib file
;;   ;;(define-key bibtex-mode-map (kbd "C-c j") 'org-ref-bibtex-hydra/body)
;;   ;; bibtex-key generator: firstauthor-year-title-words (from bixuanzju)
;;   (setq bibtex-autokey-year-length 4
;;         bibtex-autokey-name-year-separator "-"
;;         bibtex-autokey-year-title-separator "-"
;;         bibtex-autokey-titleword-separator "-"
;;         bibtex-autokey-titlewords 2
;;         bibtex-autokey-titlewords-stretch 1
;;         bibtex-autokey-titleword-length 5)
;;   ;; Make org-ref cite: link folded in emacs.
;;   ;; https://org-roam.discourse.group/t/customize-display-of-cite-links/129/19
;;   (org-link-set-parameters "cite" :display 'org-link)
;;   ;; Make the 'cite:' link type available when C-c l on a bibtex entry
;;   ;; https://github.com/jkitchin/org-ref/issues/345
;;   (let ((lnk (assoc "bibtex" org-link-parameters)))
;;     (setq org-link-parameters (delq lnk org-link-parameters))
;;     (push lnk org-link-parameters)))

;; ;; wasn't called if inside of org-ref, for some reason
;; (define-key bibtex-mode-map (kbd "C-c j") 'org-ref-bibtex-hydra/body)


;; ** Org-download

;; Can't get it to work

;; ** Org Export

(sdo/find-exec "zip" "Needed for org-mode export to .odt")

;; Pandoc helper for org export
(when (sdo/find-exec "pandoc" "Needed for org-mode export to .docx, etc.")
  ;; from: https://github.com/rubensts/.emacs.d/blob/master/emacs-init.org
  (use-package ox-pandoc
    :after org ; so pandoc shows up in org-export-dispatch screen
    :config
    (setq org-pandoc-options '((standalone . t))            ; default options for all output formats
          org-pandoc-options-for-docx '((standalone . nil)) ; cancel above settings only for 'docx' format
          )))

;; ** Org Parsing

;; (use-package pyorg
;;   :straight (:host github :repo "jlumpe/pyorg" :files ("pyorg.el")))


;; ** Org and Zotero

;; In org mode, open a :zotero link in the Zotero program.  C-o or click works.
;; See: howto.org: <<Clickable :zotero link in org file>>
(defun org-zotero-open (path)
  (browse-url (format "zotero:%s" path)))

(with-eval-after-load 'org
  (org-link-set-parameters "zotero" :follow #'org-zotero-open))


;; DOES THIS BREAK ZOTERO LINKS TO PDF? e.g. for Che21PredictiveBatteryHealth:
;;
;; zotero://select/library/items/TNVYHX34
;;
;; Right now, only links to top-level zotero entry work???
;;
;; Pastes :zotero item key of Zotero entries into org-mode, if org-zotxt-mode is turned on, else the bibtey.  Also connects to org-noter. Works with Zotero add-in "zotxt": https://github.com/egh/zotxt-emacs
;;
;; Type of link is controlled by org-zotxt-link-description-style customization:
;;  citation: zotero: link w/ full title/author/publisher... cite string
;;  citekey:  zotero: link w/ bibtex cite
;;  title:    CRASHES: bug report: https://github.com/egh/zotxt-emacs/issues/75
;; Can also use setq
;; https://github.com/egh/zotxt-emacs/issues/59#issuecomment-1034549542
;; (setq org-zotxt-link-description-style :citation)
;;
;; TODO: fork to make descriptive text like the old bibtex links
(use-package zotxt
  :after org
  :bind ("C-c z" . org-zotxt-insert-reference-link)
  :hook (org-mode . org-zotxt-mode)
  :config
  ;; So can M-x org-zotxt-noter, then sel item in Zotero, mk. notes on
  ;; its attachment. This does bring up the pdf and highlight but not
  ;; sure if it's doing what it's supposed to inside the
  ;; org-document. Should be making clickable links to the annotations
  ;; or something.  It's adding some text under :PROPERTIES: but I
  ;; don't know how to use it.
  (require 'org-zotxt-noter))

;; ** Org-cite (native in org 9.5+)

;; *** oc-csl-activate
;; DOESN'T WORK
;; I thought this might be the cause of the messed up org-ref links but they are messed up whether or not oc-csl-activate is commented out.
;; prettier in-buffer org cites
;; https://github.com/anghyflawn/dot-emacs/blob/master/emacs.org
;; (use-package oc-csl-activate
;;   :straight (:host github :repo "andras-simonyi/org-cite-csl-activate")
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (cursor-sensor-mode 1)))
;;   (setq org-cite-activate-processor 'csl-activate
;;         org-cite-csl-activate-use-document-style t))

; *** citar and packages it needs
(use-package embark
  :bind ("M-o" . embark-act)
  :after vertico)

(use-package marginalia
  :after vertico
  :ensure t
  :config
  (marginalia-mode))

(use-package citeproc
  :ensure t)

;; < ----------- START ~ashton314/emacs-bedrock/researcher.el
(setq citar-bibliography '("~/share/ref/zotero/Battery_Review_zotero.bib")
      org-roam-directory org-roam-dir)

(use-package citar
  :ensure t
  :bind (("C-c b" . citar-insert-citation)
         :map minibuffer-local-map
         ("M-b" . citar-insert-preset))
  :custom
  ;; Allows you to customize what citar-open does
  (citar-file-open-functions '(("html" . citar-file-open-external)
                               ;; ("pdf" . citar-file-open-external)
                               (t . find-file)))
  (citar-notes-paths (list (expand-file-name "lit" org-roam-dir))))

;; Optional: if you have the embark package installed, enable the
;; ability to act on citations with citar by invoking `embark-act'.
;(use-package citar-embark
;  :after citar embark
;  :diminish ""
;  :no-require
;  :config (citar-embark-mode))

(use-package citar-org-roam
  :diminish ""
  ;; To get this to work both citar *and* org-roam have to have been used
  :after citar org-roam
  :no-require
  :config
  (citar-org-roam-mode)
  (setq citar-org-roam-note-title-template "${author} - ${title}\n#+filetags: ${tags}"))

;; from: https://github.com/emacs-citar/citar-org-roam#templates
(setq org-roam-capture-templates
      '(("d" "default" plain
         "%?"
         :target
         (file+head
          "%<%Y%m%d%H%M%S>-${slug}.org"
          "#+title: ${note-title}\n")
         :unnarrowed t)
        ("n" "literature note" plain
         "%?"
         :target
         (file+head
          "%(expand-file-name (or citar-org-roam-subdir \"\") org-roam-directory)/${citar-citekey}.org"
          "#+title: ${citar-citekey} (${citar-date}). ${note-title}.\n#+created: %U\n#+last_modified: %U\n\n")
         :unnarrowed t)))

(setq citar-org-roam-capture-template-key "n")


(use-package org-roam
  :ensure t
  :config
  ;; Make sure the backlinks buffer always shows up in a side window
  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                 (display-buffer-in-side-window)
                 (side . right)
                 (window-width . 0.4)
                 (window-height . fit-window-to-buffer)))

  (org-roam-db-autosync-mode))
;; > ----------- END ~ashton314/emacs-bedrock/researcher.el



;; ----------- START MINE OLD
;; It's possible to open entries directly in zotero
;; https://github.com/emacs-citar/citar#opening-reference-entries
;; you need to somehow set sometime to 'citar-open-entry-in-zotero'
;; So citar opens pdfs with an external reading, I customized citar-file-open-functions to 'citar-file-open-external for the pdf extension
;; TODO: how to make it open Drawboard if available?
;; (use-package citar
;;   :init
;;   (setq org-cite-insert-processor 'citar
;;         org-cite-follow-processor 'citar
;;         org-cite-activate-processor 'citar
;;         org-cite-global-bibliography bibfile_list
;;         citar-bibliography org-cite-global-bibliography
;;         citar-library-paths bibpdf_dir_list
;;         citar-notes-paths (list org-roam-dir))
;;   :bind (("C-c b" . citar-insert-citation)
;;          ;; also  C-c C-x C-@
;;          (:map org-mode-map :package org ("C-c b" . #'org-cite-insert))
;;          ("C-c C-1" . citar-open-library-files)
;;          :map minibuffer-local-map
;;          ("M-b" . citar-insert-preset))) ; ??  from 
;; ----------- END MINE OLD

;; < ---- START hieuphay ----------------------------------------------
;; ;;(use-package pdf-occur) ;; hieuphay's citar wants this but not needed?
;; (use-package citar
;;   :after (embark pdf-occur)
;;   :hook
;;   (LaTeX-mode . citar-capf-setup)
;;   (org-mode . citar-capf-setup)
;;   :custom
;;   (org-cite-global-bibliography bibfile_list)
;;   (citar-bibliography org-cite-global-bibliography)
;;   (citar-notes-paths (list org-roam-dir))
;;   (citar-library-paths bibpdf_dir_list)
;;   (citar-file-variable "file")
  
;;    ;; :config
;;    ;; (setq
;;    ;; citar-bibliography (list (concat org-directory "/references/zotero.bib"))
;;    ;; citar-notes-paths (list(concat org-directory "/org-roam/literature/"))
;;    ;; citar-library-paths (list (concat org-directory "/org-roam/"))
;;    ;; citar-file-variable "file"
;;    ;; org-cite-global-bibliography citar-bibliography)
;;    ;; Search contents of PDFs
;;    ;; (after! (embark pdf-occur)
;;    ;; SDO: broken:  citar-file--files-for-multiple-entries doesn't exist
;;    ;; (defun citar/search-pdf-contents (keys-entries &optional str)
;;    ;;   "Search pdfs."
;;    ;;   (interactive (list (citar-select-refs)))
;;    ;;   (let ((files (citar-file--files-for-multiple-entries
;;    ;;                 (citar--ensure-entries keys-entries)
;;    ;;                 citar-library-paths
;;    ;;                 '("pdf")))
;;    ;;         (search-str (or str (read-string "Search string: "))))
;;    ;;     (pdf-occur-search files search-str t)))
;;    ;; ;; with this, you can exploit embark's multitarget actions, so that you can run `embark-act-all`
;;    ;; (add-to-list 'embark-multitarget-actions #'citar/search-pdf-contents)
;;    )
;; > ---- END hieuphay ----------------------------------------------

;; ----------- START MINE OLD
;; https://github.com/emacs-citar/citar-org-roam
;; With this, M-x citar-open-notes can create a new bib note under citar-notes-paths
;; (use-package citar-org-roam
;;   :after (citar org-roam)
;;   ;; :init
;;   ;;   (setq citar-org-roam-note-title-template "${author} - ${title} FRED")
;;   :config
;;    (setq citar-org-roam-note-directory "lit")
;;   (citar-org-roam-mode))

;; ;; DOESN'T WORK
;; ;; make your own note title
;; ;; https://github.com/emacs-citar/citar-org-roam#templates
;; (setq citar-org-roam-note-title-template "${author} - ${title} FRED")
;; (setq org-roam-capture-templates
;;       '(("d" "default" plain
;;          "%?"
;;          :target
;;          (file+head
;;           "%<%Y%m%d%H%M%S>-${slug}.org"
;;           "#+title: ${note-title}\n")
;;          :unnarrowed t)
;;         ("n" "literature note" plain
;;          "%?"
;;          :target
;;          (file+head
;;           "%(expand-file-name (or citar-org-roam-subdir \"\") org-roam-dir)/${citar-citekey}.org"
;;           "#+title: ${citar-citekey} (${citar-date}). ${note-title}.\n#+created: %U\n#+last_modified: %U\n\n")
;;          :unnarrowed t)))
;; (setq citar-org-roam-capture-template-key "n")
;; ----------- END MINE OLD

;; < ---- START hieuphay ----------------------------------------------
;; ;; Citar integrates with Org-roam via citar-org-roam.el. This makes the comand citar-open-notes (bind to SPC n b) use Org-roam’s template system. The bibliography notes created this way will be set up with proper ID and ROAM_REFS properties. The integration also comes with a nice inteface when following an org citation

;; ;; I'm not using the hugo stuff so I'll just leave it and hope everything works if I don't
;; (use-package citar-org-roam
;;   :after (citar org-roam)
;;   :no-require
;;   :custom
;;   (citar-org-roam-mode t)
;;   :config
;;   (setq citar-org-roam-subdir "literature"
;;         citar-org-roam-note-title-template
;;         (string-join
;;          '("${author editor} (${year issued date}) ${title}"
;;            "#+filetags: literature"
;;            "#+startup: overview"
;;            "#+options: toc:2 num:t"
;;            "#+hugo_base_dir: ~/Dropbox/Blogs/hieutkt/"
;;            "#+hugo_section: ./notes"
;;            "#+hugo_custom_front_matter: :exclude true :math true"
;;            "#+hugo_custom_front_matter: :bibinfo '((doi .\"${doi}\") (isbn . \"${isbn}\") (url . \"${url}\") (year . \"${year}\") (month . \"${month}\") (date . \"${date}\") (author . \"${author}\") (journal . \"${journal}\"))"
;;            "#+hugo_series: \"Reading notes\""
;;            "#+hugo_tags:"
;;            ""
;;            "* What?"
;;            "* Why?"
;;            "* How?"
;;            "* And?"
;;            ) "\n")))

;; > ---- END hieuphay ----------------------------------------------

;; ----------- START MINE OLD 
;; (use-package citar-embark
;;   :after (citar embark)
;;   :ensure t
;;   :init
;;   (setq citar-at-point-function 'embark-act)
;;   :config
;;   (citar-embark-mode))
;; ----------- END MINE OLD

;; Hieuphay didn't use this citar-embark package.  I'll leave it out to start)
;; (use-package citar-embark


;; DIDN'T WORK
;; From: https://github.com/emacs-citar/citar-org-roam
;;
;; SDO: probably too much breakable stuff
;; ;; From: https://honnef.co/articles/my-org-roam-workflows-for-taking-notes-and-writing-articles/
;;
;; DIDN'T WORK
;; From: https://jethrokuan.github.io/org-roam-guide/

;; ** Org-Roam

;; ----------- START MINE OLD

;; TODO: :custom (org-id-method 'ts) doesn't work
;;       https://org-roam.discourse.group/t/org-roam-major-redesign/1198/28
;; TIPS
;; add org-id to headline: org-id-copy

;; TODO: org-roam-find-node shows hierarchy: https://github.com/org-roam/org-roam/wiki/User-contributed-Tricks#showing-node-hierarchy
;;
;; ;; https://systemcrafters.net/build-a-second-brain-in-emacs/keep-a-journal/
;; ;; several startup org-roams, also initializing org-roam-bibtex 
;; (use-package org-roam
;;   :after helm-bibtex ; necessary?
;;   ;; calling one of these commands will initialize Org-roam and ORB
;;   :commands (org-roam-node-find org-roam-graph org-roam-capture
;;                                 org-roam-dailies-capture-today org-roam-buffer-toggle)
;;   :custom
;;   (org-roam-completion-everywhere t) ;; org-roam links completion-at-point
;;   (org-id-method 'ts)
;;   ;; from emacsconf
;;   (org-roam-node-display-template "${title:80} ${tags:80}")
;;   ;; from: https://systemcrafters.net/build-a-second-brain-in-emacs/keep-a-journal/
;;    ;; adds a timestamp to dailies. DO I WANT THAT?
;;   (ORG-roam-dailies-capture-templates
;;    '(("d" "default" entry "* %<%I:%M %p>: %?"
;;       :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))

;;   ;; comment out unless specifically want to use ivy
;;   ;;  (org-roam-completion-system 'ivy)

;;   ;; Use winner-undo/redo as forward/backward keys for org-roam ?
;;   ;; https://youtu.be/OzKZJSCLo90?t=38
;;   :bind (("C-c n l" . org-roam-buffer-toggle)
;;          ("C-c n f" . org-roam-node-find)
;;          ("C-c n i" . org-roam-node-insert)
;;          ("C-c n g" . org-roam-graph)
;;          ("C-c n h" . org-roam-capture)
;;          ([mouse-1] . org-roam-visit-thing)

;;          ("C-c n d" . org-roam-dailies-capture-today)) ; only 2 keys for today
;;   :bind-keymap  
;;   ("C-c n D" . org-roam-dailies-map) ;; get options for all dailies key bindings
  
;;   :init
;;   ;; (setq org-roam-v2-ack t)
;;   ;; set this here instead of in :custom so it can be used during init
;;   ;; truename used for performance: https://org-roam.discourse.group/t/org-roam-buffer-does-not-update-on-click-link-buffer-switch/2364/8?u=scotto
;;   ;; from: https://www.orgroam.com/manual.html=
;;   (setq org-roam-dailies-directory (expand-file-name "daily"
;;                                                      org-roam-dir))
;;   :config
;;   (require 'org-roam-dailies) ;; Ensure the keymap is available
;;   (org-roam-db-autosync-mode))
;; ----------- END MINE OLD

;; < ---- START hieuphay ----------------------------------------------

;; ;; a supposed fix for the "Selecting deleted buffer" problem, where I get this message every other time I run org-roam-db-sync.
;; ;; https://www.reddit.com/r/emacs/comments/10er0gl/error_selecting_deleted_buffer_sqlite_orgroam/
;; ;;
;; ;; This problem might also explain why (org-roam-db-autosync-enable) doesn't autosync.
;; ;;
;; ;; Thread with nobiot and jethrok here: https://github.com/org-roam/org-roam/issues/1221

;; (use-package org-roam
;;   :after (org all-the-icons)
;;   :custom
;;   (org-roam-completion-everywhere nil)
;;   :init
;;   (setq org-roam-directory org-roam-dir
;;         org-roam-dailies-directory (expand-file-name "daily" org-roam-dir)
;;         org-id-method 'ts
;;         ;; org-roam-directory (concat org-directory "/Org-roam/")
;;         ;; org-roam-completion-everywhere nil ;; this is a custom
;;         ;;Functions tags are special types of tags which tells what the node are for
;;         ;;In the future, this should probably be replaced by categories
;;         hp/org-roam-function-tags '("compilation" "argument" "journal" "concept" "tool" "data" "bio" "literature" "event" "website"))

;;   :config
;;   (org-roam-db-autosync-mode)
;;   (org-roam-db-autosync-mode +1)
;;   (org-roam-db-autosync-enable)
;;   ;; Do I care? From: https://github.com/org-roam/org-roam/issues/2235
;;   (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

;;   ;; Org-roam interface
;;   (cl-defmethod org-roam-node-hierarchy ((node org-roam-node))
;;     "Return the node's TITLE, as well as it's HIERACHY."
;;     (let* ((title (org-roam-node-title node))
;;            (olp (mapcar (lambda (s) (if (> (length s) 10) (concat (substring s 0 10)  "...") s)) (org-roam-node-olp node)))
;;            (level (org-roam-node-level node))
;;            (filetitle (org-roam-get-keyword "TITLE" (org-roam-node-file node)))
;;            (filetitle-or-name (if filetitle filetitle (file-name-nondirectory (org-roam-node-file node))))
;;            (shortentitle (if (> (length filetitle-or-name) 20) (concat (substring filetitle-or-name 0 20)  "...") filetitle-or-name))
;;            (separator (concat " " (all-the-icons-material "chevron_right") " ")))
;;       (cond
;;        ((= level 1) (concat (propertize (format "=level:%d=" level) 'display (all-the-icons-material "insert_drive_file" :face 'all-the-icons-dyellow))
;;                             (propertize shortentitle 'face 'org-roam-olp) separator title))
;;        ((= level 2) (concat (propertize (format "=level:%d=" level) 'display (all-the-icons-material "insert_drive_file" :face 'all-the-icons-dsilver))
;;                             (propertize (concat shortentitle separator (string-join olp separator)) 'face 'org-roam-olp) separator title))
;;        ((> level 2) (concat (propertize (format "=level:%d=" level) 'display (all-the-icons-material "insert_drive_file" :face 'org-roam-olp))
;;                             (propertize (concat shortentitle separator (string-join olp separator)) 'face 'org-roam-olp) separator title))
;;        (t (concat (propertize (format "=level:%d=" level) 'display (all-the-icons-material "insert_drive_file" :face 'all-the-icons-yellow))
;;                   (if filetitle title (propertize filetitle-or-name 'face 'all-the-icons-dyellow)))))))

;;   (cl-defmethod org-roam-node-functiontag ((node org-roam-node))
;;     "Return the FUNCTION TAG for each node. These tags are intended to be unique to each file, and represent the note's function.
;;         journal data literature"
;;     (let* ((tags (seq-filter (lambda (tag) (not (string= tag "ATTACH"))) (org-roam-node-tags node))))
;;       (concat
;;        ;; Argument or compilation
;;        (cond
;;         ((member "argument" tags)
;;          (propertize "=f:argument=" 'display (all-the-icons-material "forum" :face 'all-the-icons-dred)))
;;         ((member "compilation" tags)
;;          (propertize "=f:compilation=" 'display (all-the-icons-material "collections" :face 'all-the-icons-dyellow)))
;;         (t (propertize "=f:empty=" 'display (all-the-icons-material "remove" :face 'org-hide))))
;;        ;; concept, bio, data or event
;;        (cond
;;         ((member "concept" tags)
;;          (propertize "=f:concept=" 'display (all-the-icons-material "blur_on" :face 'all-the-icons-dblue)))
;;         ((member "tool" tags)
;;          (propertize "=f:tool=" 'display (all-the-icons-material "build" :face 'all-the-icons-dblue)))
;;         ((member "bio" tags)
;;          (propertize "=f:bio=" 'display (all-the-icons-material "people" :face 'all-the-icons-dblue)))
;;         ((member "event" tags)
;;          (propertize "=f:event=" 'display (all-the-icons-material "event" :face 'all-the-icons-dblue)))
;;         ((member "data" tags)
;;          (propertize "=f:data=" 'display (all-the-icons-material "data_usage" :face 'all-the-icons-dblue)))
;;         (t (propertize "=f:nothing=" 'display (all-the-icons-material "format_shapes" :face 'org-hide))))
;;        ;; literature
;;        (cond
;;         ((member "literature" tags)
;;          (propertize "=f:literature=" 'display (all-the-icons-material "book" :face 'all-the-icons-dcyan)))
;;         ((member "website" tags)
;;          (propertize "=f:website=" 'display (all-the-icons-material "move_to_inbox" :face 'all-the-icons-dsilver)))
;;         (t (propertize "=f:nothing=" 'display (all-the-icons-material "book" :face 'org-hide))))
;;        ;; journal
;;        )))

;;   (cl-defmethod org-roam-node-othertags ((node org-roam-node))
;;     "Return the OTHER TAGS of each notes."
;;     (let* ((tags (seq-filter (lambda (tag) (not (string= tag "ATTACH"))) (org-roam-node-tags node)))
;;            (specialtags hp/org-roam-function-tags)
;;            (othertags (seq-difference tags specialtags 'string=)))
;;        (propertize
;;         (string-join
;;          (append '(" ") othertags)
;;          (propertize "#" 'display (all-the-icons-material "label" :face 'all-the-icons-dgreen)))
;;         'face 'all-the-icons-dgreen)))

;;   (cl-defmethod org-roam-node-backlinkscount ((node org-roam-node))
;;     (let* ((count (caar (org-roam-db-query
;;                          [:select (funcall count source)
;;                           :from links
;;                           :where (= dest $s1)
;;                           :and (= type "id")]
;;                          (org-roam-node-id node)))))
;;       (if (> count 0)
;;           (concat (propertize "=has:backlinks=" 'display (all-the-icons-material "link" :face 'all-the-icons-blue)) (format "%d" count))
;;         (concat (propertize "=not-backlinks=" 'display (all-the-icons-material "link" :face 'org-hide))  " "))))

;;   (cl-defmethod org-roam-node-directories ((node org-roam-node))
;;     (if-let ((dirs (file-name-directory (file-relative-name (org-roam-node-file node) org-roam-directory))))
;;         (concat
;;          (if (string= "journal/" dirs)
;;              (all-the-icons-material "edit" :face 'all-the-icons-dsilver)
;;            (all-the-icons-material "folder" :face 'all-the-icons-dsilver))
;;          (propertize (string-join (f-split dirs) "/") 'face 'all-the-icons-dsilver) " ")
;;       ""))

;;   ;; (defun +marginalia--time-colorful (time)
;;   ;;   (let* ((seconds (float-time (time-subtract (current-time) time)))
;;   ;;          (color (doom-blend
;;   ;;                  (face-attribute 'marginalia-on :foreground nil t)
;;   ;;                  (face-attribute 'marginalia-off :foreground nil t)
;;   ;;                  (/ 1.0 (log (+ 3 (/ (+ 1 seconds) 345600.0)))))))
;;   ;;     ;; 1 - log(3 + 1/(days + 1)) % grey
;;   ;;     (propertize (marginalia--time time) 'face (list :foreground color :slant 'italic))))


;;   (setq org-roam-node-display-template
;;         (concat  "${backlinkscount:16} ${functiontag} ${directories}${hierarchy}${othertags} ")
;;         )
;;         ;; org-roam-node-annotation-function
;;         ;; (lambda (node) (+marginalia--time-colorful (org-roam-node-file-mtime node))))
;;   ) ;; end of use-package org-roam

;; ;; FOR SOME REASON THIS ISN'T SET INSIDE OF use-package org-roam
;; (setq org-roam-directory org-roam-dir)



;; ;; these packages don't exist.  Is this a doom thing?
;; ;;
;; ;; (use-package org-roam-capture
;; ;;   :config
;; ;;   (setq org-roam-capture-templates
;; ;;         `(("d" "default" plain "%?"
;; ;;            :target
;; ;;            (file+head "${slug}_%<%Y-%m-%d--%H-%M-%S>.org"
;; ;;                       "#+title: ${title}\n#+created: %U\n#+filetags: %(completing-read \"Function tags: \" hp/org-roam-function-tags)\n#+startup: overview")
;; ;;            :unnarrowed t))))

;; ;; (use-package org-roam-dailies
;; ;;   :config
;; ;;   (setq org-roam-dailies-directory "journal/"
;; ;;         org-roam-dailies-capture-templates
;; ;;         '(("d" "daily" entry "* %?"
;; ;;            :target
;; ;;            (file+head "%<%Y-%m-%d>.org"
;; ;;                       "#+title: %<%Y-%m-%d %a>\n#+filetags: journal\n#+startup: overview\n#+created: %U\n\n")
;; ;;            :immediate-finish t)))
;; ;;   (map! :leader
;; ;;         :prefix "n"
;; ;;         (:prefix ("j" . "journal")
;; ;;          :desc "Arbitrary date" "d" #'org-roam-dailies-goto-date
;; ;;          :desc "Today"          "j" #'org-roam-dailies-goto-today
;; ;;          :desc "Tomorrow"       "m" #'org-roam-dailies-goto-tomorrow
;; ;;          :desc "Yesterday"      "y" #'org-roam-dailies-goto-yesterday)))

;; ;; I don't know what this does, as a doomly defadvice!
;; ''
;; ;; (with-eval-after-load 'org-roam
;; ;;   (defadvice! yeet/org-roam-in-own-workspace-a (&rest _)
;; ;;   "Open all roam buffers in there own workspace."
;; ;;   :before #'org-roam-node-find
;; ;;   :before #'org-roam-node-random
;; ;;   :before #'org-roam-buffer-display-dedicated
;; ;;   :before #'org-roam-buffer-toggle
;; ;;   :before #'org-roam-dailies-goto-today
;; ;;   (when (modulep! :ui workspaces)
;; ;;     (+workspace-switch "Org-roam" t))))

;; ;; Can't find org-roam-protocol
;; ;;
;; ;; (use-package org-roam-protocol
;; ;;   :after (org-roam org-roam-dailies org-protocol)
;; ;;   :config
;; ;;   (add-to-list
;; ;;    'org-roam-capture-ref-templates
;; ;;    `(;; Browser bookletmark template:
;; ;;      ;; javascript:location.href =
;; ;;      ;; 'org-protocol://roam-ref?template=w&ref='
;; ;;      ;; + encodeURIComponent(location.href)
;; ;;      ;; + '&title='
;; ;;      ;; + encodeURIComponent(document.getElementsByTagName("h1")[0].innerText)
;; ;;      ;; + '&hostname='
;; ;;      ;; + encodeURIComponent(location.hostname)
;; ;;      ("w" "webref" entry "* ${title} ([[${ref}][${hostname}]])\n%?"
;; ;;       :target
;; ;;       (file+head
;; ;;        ,(concat org-roam-dailies-directory "%<%Y-%m>.org")
;; ;;        ,(string-join
;; ;;          '(":properties:"
;; ;;            ":roam_refs: %^{Key}"
;; ;;            "🔚"
;; ;;            "#+title: %<%Y-%m>"
;; ;;            "#+filetags: journal"
;; ;;            "#+startup: overview"
;; ;;            "#+created: %U"
;; ;;            "") "\n"))
;; ;;       :unnarrowed t))))

;; ;; WHAT DOES THIS STUFF DO?
;; ;;
;; ;; backlink counts

;; (defface hp/org-roam-count-overlay-face
;;   '((t :inherit org-list-dt :height 0.8))
;;   "Face for Org Roam count overlay.")

;; (defun hp/org-roam--count-overlay-make (pos count)
;;   (let* ((overlay-value (propertize
;;                          (concat "·" (format "%d" count) " ")
;;                          'face 'hp/org-roam-count-overlay-face 'display '(raise 0.2)))
;;          (ov (make-overlay pos pos (current-buffer) nil t)))
;;     (overlay-put ov 'roam-backlinks-count count)
;;     (overlay-put ov 'priority 1)
;;     (overlay-put ov 'after-string overlay-value)))

;; (defun hp/org-roam--count-overlay-remove-all ()
;;   (dolist (ov (overlays-in (point-min) (point-max)))
;;     (when (overlay-get ov 'roam-backlinks-count)
;;       (delete-overlay ov))))

;; (defun hp/org-roam--count-overlay-make-all ()
;;   (hp/org-roam--count-overlay-remove-all)
;;   (org-element-map (org-element-parse-buffer) 'link
;;     (lambda (elem)
;;       (when (string-equal (org-element-property :type elem) "id")
;;         (let* ((id (org-element-property :path elem))
;;                (count (caar
;;                        (org-roam-db-query
;;                         [:select (funcall count source)
;;                          :from links
;;                          :where (= dest $s1)
;;                          :and (= type "id")]
;;                         id))))
;;           (when (< 0 count)
;;             (hp/org-roam--count-overlay-make
;;              (org-element-property :end elem)
;;              count)))))))

;; (define-minor-mode hp/org-roam-count-overlay-mode
;;   "Display backlink count for org-roam links."
;;   :after-hook
;;   (if hp/org-roam-count-overlay-mode
;;       (progn
;;         (hp/org-roam--count-overlay-make-all)
;;         (add-hook 'after-save-hook #'hp/org-roam--count-overlay-make-all nil t))
;;     (hp/org-roam--count-overlay-remove-all)
;;     (remove-hook 'after-save-hook #'hp/org-roam--count-overlay-remove-all t)))

;; (add-hook 'org-mode-hook #'hp/org-roam-count-overlay-mode)

;; > ---- END hieuphay ----------------------------------------------



;; ** org-roam-ui (graph viewing)

;; ----------- START MINE OLD

;; To see big graph in browser:
;;   Use M-x org-roam-ui-mode RET to enable the global mode. It will start a web server on http://127.0.0.1:35901/ and connect to it via a WebSocket for real-time updates.
;; config from: https://github.com/org-roam/org-roam-ui
;; (use-package org-roam-ui
;;   ;; :straight (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
;;   :custom
;;   (org-roam-ui-follow-mode t)
;;   :after org-roam
;;   ;; normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;   ;; a hookable mode anymore, you're advised to pick something yourself
;;   ;; if you don't care about startup time, use
;;   ;;:hook (after-init . org-roam-ui-mode)
;;   :config
;;   (setq org-roam-ui-sync-theme t
;;         org-roam-ui-follow t
;;         org-roam-ui-update-on-save t
;;         org-roam-ui-open-on-start t))

;; ----------- END MINE OLD

(use-package websocket
  :after org-roam)

(use-package org-roam-ui
  :after org-roam
  :commands (org-roam-ui-mode))


;; ** org-roam-bibtex

;; (use-package org-roam-bibtex
;;   :config
;;   (setq org-roam-capture-templates
;;         '(("d" "default" plain "%?"
;;            :if-new (file+head "${slug}.org"
;;                               "#+title: ${title}\n#+SETUPFILE: ~/ref/tmp_papers_notes/setup_file.org\n* References :ignore:\n#+print_bibliography:")
;;            :unnarrowed t)
;;           ;; capture to inbox
;;           ("i" "inbox" entry "* TODO %?\n"
;;            :target (node "45acaadd-02fb-4b93-a741-45d37ff9fd5e")
;;            :unnarrowed t
;;            :empty-lines-before 1
;;            :empty-lines-after 1
;;            :prepend t)
;;           ;; bibliography note template

;;           ("r" "bibliography reference" plain "%?"
;;            ~/ref/tmp_papers_notes
;;            ;;           :if-new (file+head "references/notes_${citekey}.org"
;;            :if-new (file+head "~/ref/tmp_papers_notes/refs/notes_${citekey}.org"
;;                               "#+title: Notes on ${title}\n#+SETUPFILE: ~/ref/tmp_papers_notes/refs/ref/setup_file_ref.org\n* References :ignore:\n#+print_bibliography:")
;;            :unnarrowed t)
;;           ;; for my annotated bibliography needs
;;           ("s" "short bibliography reference (no id)" entry "* ${title} [cite:@%^{citekey}]\n%?"
;;            :target (node "01af7246-1b2e-42a5-b8e7-68be9157241d")
;;            :unnarrowed t
;;            :empty-lines-before 1
;;            :prepend t)))
;;   (defun robo/capture-to-inbox ()
;;     "Capture a TODO straight to the inbox."
;;     (interactive)
;;     (org-roam-capture- :goto nil
;;                        :keys "i"
;;                        :node (org-roam-node-from-id "45acaadd-02fb-4b93-a741-45d37ff9fd5e")))
;;   (require 'org-roam-bibtex)

;;   ;; TODO: figure out note files dirs in tis
;;   ;; (expand-file-name "notes_${citekey}.org" bibnotes_dir)

;;   (setq citar-open-note-function 'orb-citar-edit-note
;;         citar-notes-paths '("~/ref/tmp_papers_notes/refs")
;;         orb-preformat-keywords '("citekey" "title" "url" "author-or-editor" "keywords" "file")
;;         orb-process-file-keyword t
;;         orb-file-field-extensions '("pdf")))

;; *** Org-roam API
;;
;; From:
;; https://org-roam.discourse.group/t/creating-an-org-roam-note-from-an-existing-headline/978
;; Latest version:
;;https://github.com/telotortium/doom.d/blob/f0295cc510d31c813e2a61ab2fc4aad3ae531e49/org-config.el#L1250-L1271

;; ;; This works!
;; (defun org-roam-create-note-from-headline ()
;;   "Create an Org-roam note from the current headline and jump to it.

;; Normally, insert the headline’s title using the ’#title:’ file-level property
;; and delete the Org-mode headline. However, if the current headline has a
;; Org-mode properties drawer already, keep the headline and don’t insert
;; ‘#+title:'. Org-roam can extract the title from both kinds of notes, but using
;; ‘#+title:’ is a bit cleaner for a short note, which Org-roam encourages."
;;   (interactive)
;;   (let ((title (nth 4 (org-heading-components)))
;;         (has-properties (org-get-property-block)))
;;     (org-cut-subtree)
;;     (org-roam-find-file title nil nil 'no-confirm)
;;     (org-paste-subtree)
;;     (unless has-properties
;;       (kill-line)
;;       (while (outline-next-heading)
;;         (org-promote)))
;;     (goto-char (point-min))
;;     (when has-properties
;;       (kill-line)
;;       (kill-line))))
;;
;; For annotating videos
;; ** org-media note
;; https://github.com/yuchen-lea/org-media-note
;;  somehow different that org-noter-media, doesn't have a straight.el
;; install example,un like org-noter-media
;; ** pdf-tools
;;
;; Open and annotate pdfs.  
;; See demo: http://tuhdo.github.io/static/emacs-read-pdf.gif
;; Also used by org-roam (I think) and some latex stuff (I think)
;;
;; Installation:
;; https://github.com/politza/pdf-tools#compilation-and-installation-on-windows
;; pdf-tools requires libraries (msys2 on Windows) so it can build itself.
;;
;; FIRST INSTALL on fresh machine: On Windows, msys2 will download the libraries itself if you answer it's "where is mysys2?" question with: c:/tools/msys64
;; You can check the install with M-x pdf-info-check-epdinfo
;;
;; pdf-tools use-package call inspired by:
;; http://pragmaticemacs.com/emacs/more-pdf-tools-tweaks/
;;
(if (or running-MacOS running-gnu-linux pacbin-windows)
    (progn
      (message "Initializing pdf-tools")
      (use-package pdf-tools
        :defer t
        :config
        ;; initialise (on Windows will download and build msys2 libs too)
        (pdf-tools-install)
        ;; open pdfs scaled to fit page
        (setq-default pdf-view-display-size 'fit-page)
        ;; (setq pdf-annot-activate-created-annotations t) ; for annotation text
        (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
        (setq pdf-view-resize-factor 1.1)   ; default is 25%
        ;; Shorter shortcuts than e.g. C-c C-a h. These Work on =mouse= sel.
        (define-key pdf-view-mode-map (kbd "h")
          'pdf-annot-add-highlight-markup-annotation)
        (define-key pdf-view-mode-map (kbd "t")
          'pdf-annot-add-text-annotation)
        (define-key pdf-view-mode-map (kbd "u")
          'pdf-annot-add-underline-markup-annotation)
        (define-key pdf-view-mode-map (kbd "D")
          'pdf-annot-delete)
        ;; Navigation: can also use M-< and M-> like normal
        (define-key pdf-view-mode-map (kbd "C-<home>") 'pdf-view-first-page)
        (define-key pdf-view-mode-map (kbd "C-<end>") 'pdf-view-last-page)

        ;; Custom annotation colors: https://github.com/politza/pdf-tools/issues/581#issuecomment-646370370
        ;; Emacs color pickers: https://emacs.stackexchange.com/questions/5582/are-there-color-pickers-for-emacs
        ;; Strike out
        (defun pdftools-strikeout-gray (oldfun loe)
          (apply oldfun loe '("gray")))
        (advice-add 'pdf-annot-add-strikeout-markup-annotation :around 
                    #'pdftools-strikeout-gray)
        ;; Underline
        (defun pdftools-underline-purple (oldfun loe)
          (apply oldfun loe '("#8a1e8a")))
        (advice-add 'pdf-annot-add-underline-markup-annotation :around 
                    #'pdftools-underline-purple)
        ;; Squiggly underline
        (defun pdftools-squiggly-red (oldfun loe)
          (apply oldfun loe '("#fe2500")))
        (advice-add 'pdf-annot-add-squiggly-markup-annotation :around 
                    #'pdftools-squiggly-red)
        
        ;; Default color for text highlight. 
        ;; This will change the color of the Note.
        (setq pdf-annot-default-markup-annotation-properties
              '((color . "green")))

        ;; Default color for text.
        ;; This will change the color of the Note.
        (setq pdf-annot-default-text-annotation-properties
              '((color . "#90ee90")))
        )

      ;; **  org-pdftools, org-noter-pdftools
      (use-package org-pdftools
        :hook (org-mode . org-pdftools-setup-link))

      (use-package org-noter-pdftools
        :after org-noter
        :config
        ;; Add a function to ensure precise note is inserted
        (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
          (interactive "P")
          (org-noter--with-valid-session
           (let ((org-noter-insert-note-no-questions (if toggle-no-questions
                                                         (not org-noter-insert-note-no-questions)
                                                       org-noter-insert-note-no-questions))
                 (org-pdftools-use-isearch-link t)
                 (org-pdftools-use-freepointer-annot t))
             (org-noter-insert-note (org-noter--get-precise-info)))))

        ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
        (defun org-noter-set-start-location (&optional arg)
          "When opening a session with this document, go to the current location.
           With a prefix ARG, remove start location."
          (interactive "P")
          (org-noter--with-valid-session
           (let ((inhibit-read-only t)
                 (ast (org-noter--parse-root))
                 (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
             (with-current-buffer (org-noter--session-notes-buffer session)
               (org-with-wide-buffer
                (goto-char (org-element-property :begin ast))
                (if arg
                    (org-entry-delete nil org-noter-property-note-location)
                  (org-entry-put nil org-noter-property-note-location
                                 (org-noter--pretty-print-location location))))))))
        (with-eval-after-load 'pdf-annot
          (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

      ;; **  org-noter
      ;; keybindings, basic explanation: https://github.com/weirdnox/org-noter#keys
      ;; simple, just so it compiles.  started from: https://rgoswami.me/posts/org-note-workflow
      ;; update: adjust based on setup here: https://github.com/fuxialexander/org-pdftools
      ;; partly from: https://github.com/fuxialexander/org-pdftools
      ;; On windows, first install, will ask for your msys dir.  Say c:/tools/msys64/
      (use-package org-noter
        :after (:all org pdf-view)
        :config
        (require 'org-noter-pdftools)
        (setq
         ;; the wm can handle splits
         org-noter-notes-window-location 'other-frame
         ;; please stop opening frames
         org-noter-always-create-frame nil
         ;; i want to see the whole file
         org-noter-hide-other nil
         ;; everything is relative to the main notes file
         org-noter-notes-search-path (list org-roam-dir)))
      ))

;; ** org-media-note
;; For annotating youtube, etc, like in logseq.  Try this sometime.
;;
;; https://github.com/yuchen-lea/org-media-note
;;

;; * ekg

(use-package ekg)
;;  :bind (([f11] . ekg-capture)))

;; * logseq
;; ** logseq-open-in-emacs


;; DOESN"T WORK:
;; error: Could not find package org-protocol. Updating recipe repositories: (org-elpa melpa gnu-elpa-mirror nongnu-elpa el-get emacsmirror-mirror) with ‘straight-pull-recipe-repositories’ may fix this
;; 
;; Because org-protocol is internal to emacs and I'm using straight?
;;
;; so logseq can open a note file in emacs
;; https://github.com/ksqsf/logseq-open-in-emacs
;; (use-package org-protocol
;;   :ensure org
;;   :config
;;   (add-to-list 'org-protocol-protocol-alist
;;                '("org-find-file" :protocol "find-file" :function org-protocol-find-file :kill-client nil))

;;   (defun org-protocol-find-file-fix-wsl-path (path)
;;     "If inside WSL, change Windows-style paths to WSL-style paths."
;;     (if (not (string-match-p "-[Mm]icrosoft" operating-system-release))
;;         path
;;       (save-match-data
;;         (if (/= 0 (string-match "^\\([a-zA-Z]\\):\\(/.*\\)" path))
;;             path
;;           (let ((volume (match-string-no-properties 1 path))
;;                 (abspath (match-string-no-properties 2 path)))
;;             (format "/mnt/%s%s" (downcase volume) abspath))))))

;;   (defun org-protocol-find-file (fname)
;;     "Process org-protocol://find-file?path= style URL."
;;     (let ((f (plist-get (org-protocol-parse-parameters fname nil '(:path)) :path)))
;;       (find-file (org-protocol-find-file-fix-wsl-path f))
;;       (raise-frame)
;;       (select-frame-set-input-focus (selected-frame)))))
;; * chatGPT

;; DOESN'T WORK: chatgpt interface written by chatgpt itself
;; my chatGPT secret key (following chatgpt instructions):
;; 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

;; (defvar chatgpt-api-url "https://api.openai.com/v1/engines/davinci-codex/completions")
;;
;; (defun chatgpt-api-request (prompt)
;;   "Send PROMPT to the ChatGPT API and return the response."
;;   (let* ((auth-token "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")
;;          (body `((prompt . ,prompt)
;;                  (max_tokens . 50)
;;                  (n . 1)))
;;          (headers `(("Content-Type" . "application/json")
;;                     ("Authorization" . ,(concat "Bearer " auth-token)))))
;;     (with-current-buffer
;;         (url-retrieve-synchronously chatgpt-api-url nil nil nil t)
;;       (goto-char (point-min))
;;       (re-search-forward "^$")
;;       (delete-region (point-min) (point))
;;       (url-insert-file-contents chatgpt-api-url nil nil t)
;;       (url-encode-url)
;;       (setq buffer-string))))

;; https://github.com/joshcho/ChatGPT.el
;; https://www.youtube.com/watch?v=4oUrm4CnIjo
;;
;; "chatgpt install" command fails.  Seems to be hardcoded to firefox?
;; or is it b/c I used condo for first command.?
;;
;; conda install epc
;; pip install git+https://github.com/mmabrouk/chatgpt-wrapper
;; chatgpt install
;;
;; (use-package chatgpt
;;   :straight (:host github :repo "joshcho/ChatGPT.el" :files ("dist" "*.el"))
;;   :init
;;   (require 'python)
;;   (setq chatgpt-repo-path "~/.emacs.d/straight/repos/ChatGPT.el/")
;;   :bind ("C-c q" . chatgpt-query))
;;

;; * Window/Frame Config, Desktop Save and Restore
;; ** Window resizing

;; https://github.com/dpsutton/resize-window
(use-package resize-window :defer 0) ; put in hydra below

;; ** Adjusting Window Orientation
(use-package transpose-frame ; tons of functions; this one is most
  :bind (("C-|" . rotate-frame-clockwise)))

(winner-mode 1) ; Undo window config: C-c left; Redo window config: C-c right

;; ** Attempts at saving desktop
;; Tried but failed: Burly, desktop+, bookmark+, winsav
;; persp seemed most promising, but never quite did the job either:
;; Much later (2021), system crafters guy liked it.

;; *** burly

;; Works, but must run M-x toggle-tab-bar-mode-from-frame in order to retrieve burly bookmarks.  This will put some tabs in eamcs, which you can remove with M-x toggle-tab-bar-mode-from-frame again.
;; https://github.com/alphapapa/burly.el
;; https://github.com/hawnzug/dot-emacs
(use-package burly
  :init
  (burly-tabs-mode +1)
  :commands
  (burly-bookmark-frames
   burly-bookmark-windows
   burly-open-bookmark
   burly-open-last-bookmark))

;; Was this supposed to persist burly across sessions?  It breaks stuff.
;;
;; ;; from: https://github.com/alphapapa/burly.el/issues/48#issuecomment-1019454101
;; (savehist-mode)
;; (bookmark-maybe-load-default-file) ;; doesn't exist?
;; (bookmark-load)
;; (defun my/burly-savehist-integration ()
;;   (when (bound-and-true-p burly-opened-bookmark-name)
;;     (setq burly-opened-bookmark-name
;;           (substring-no-properties burly-opened-bookmark-name))))
;; (add-hook 'savehist-save-hook #'my/burly-savehist-integration)
;; (add-to-list 'savehist-additional-variables 'burly-opened-bookmark-name)


;; *** Perspectives for emacs
;; ;; From: https://github.com/andresilva/emacs.d/blob/master/init.el

;; ;; Use one folder for all save/history/cache files (more than persp-mode uses it)
;; (defconst !/savefile-dir (expand-file-name "savefile" user-emacs-directory))
;; (unless (file-exists-p !/savefile-dir)
;;   (make-directory !/savefile-dir))


;; ;; https://github.com/Bad-ptr/persp-mode.el  
;; (use-package persp-mode
;;   :straight t
;;   :diminish persp-mode

;;   :init
;;   (setq wg-morph-on nil ;; switch off animation
;;         persp-add-buffer-on-after-change-major-mode t
;;         persp-auto-resume-time -1
;;         persp-autokill-buffer-on-remove 'kill-weak
;;         persp-save-dir (expand-file-name "persp-confs/" !/savefile-dir))

;;   (add-hook 'after-init-hook (lambda () (persp-mode 1)))

;;   :config
;;   (defvar !//persp-last-selected-perspective persp-nil-name
;;     "Previously selected perspective.")
;;   (defun !//persp-save-last-selected-perspective (_ _ &optional _)
;;     (setq !//persp-last-selected-perspective persp-last-persp-name))
;;   (advice-add 'persp-activate :before #'!//persp-save-last-selected-perspective))

;; ;; from: https://github.com/Bad-ptr/persp-mode.el/issues/93#issuecomment-392282950
;; (with-eval-after-load "persp-mode"
;;   (defvar persp-indirrect-buffers-to-restore nil)

;;   (persp-def-buffer-save/load
;;    :tag-symbol 'def-indirect-buffer
;;    :predicate #'buffer-base-buffer
;;    :save-function
;;    #'(lambda (buf tag vars)
;;        (list tag (buffer-name buf) vars
;;              (buffer-name (buffer-base-buffer))))
;;    :load-function
;;    #'(lambda (savelist)
;;        (destructuring-bind
;;            (buf-name vars base-buf-name &rest _rest) (cdr savelist)
;;          (push (cons buf-name base-buf-name)
;;                persp-indirrect-buffers-to-restore)
;;          nil)))

;;   (add-hook 'persp-after-load-state-functions
;;             #'(lambda (&rest _args)
;;                 (dolist (ibc persp-indirrect-buffers-to-restore)
;;                   (let* ((nbn (car ibc))
;;                          (bbn (cdr ibc))
;;                          (bb (get-buffer bbn)))
;;                     (when bb
;;                       (when (get-buffer nbn)
;;                         (setq nbn (generate-new-buffer-name nbn)))
;;                       (make-indirect-buffer bb nbn t))))
;;                 (setq persp-indirrect-buffers-to-restore nil))))

;; ** Make a new *scratch* buffer right after killing it

;; TODO: remove this:  emacs 29 can be configured to do similar, I think: https://youtu.be/RYGwG62VMGw?t=883
;; From: https://www.emacswiki.org/emacs/RecreateScratchBuffer
;; If the *scratch* buffer is killed, recreate it automatically
;; From: Morten Welind
;;http://www.geocrawler.com/archives/3/338/1994/6/0/1877802/
(save-excursion
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer))

(defun kill-scratch-buffer ()
  ;; The next line is just in case someone calls this manually
  (set-buffer (get-buffer-create "*scratch*"))
  ;; Kill the current (*scratch*) buffer
  (remove-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  (kill-buffer (current-buffer))
  ;; Make a brand new *scratch* buffer
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  ;; Since we killed it, don't let caller do that.
  nil)

;; ** Frame resizing

;; *** My hacked Frame Resize

(defun sdo/toggle-frame-fullheight (&optional frame)
  "Toggle height part of fullscreen state of FRAME.
Make selected frame full height or restore its previous size
if it is already fullscreen.

This is a hacked version of built-in toggle-frame-fullscreen

Before making the frame fullscreen remember the current value of
the frame's `fullscreen' parameter in the `fullscreen-restore'
parameter of the frame.  That value is used to restore the
frame's fullscreen state when toggling fullscreen the next time.

Note that with some window managers you may have to set
`frame-resize-pixelwise' to non-nil in order to make a frame
appear truly fullscreen.  In addition, you may have to set
`x-frame-normalize-before-maximize' in order to enable
transitions from one fullscreen state to another.

See also `toggle-frame-maximized'."
  (interactive)
  (let ((fullscreen (frame-parameter frame 'fullscreen)))
    (if (memq fullscreen '(fullscreen fullheight))
	(let ((fullscreen-restore (frame-parameter frame 'fullscreen-restore)))
	  (if (memq fullscreen-restore '(maximized fullheight fullwidth))
	      (set-frame-parameter frame 'fullscreen fullscreen-restore)
	    (set-frame-parameter frame 'fullscreen nil)))
      (modify-frame-parameters
       frame `((fullscreen . fullheight) (fullscreen-restore . ,fullscreen))))
    ;; Manipulating a frame without waiting for the fullscreen
    ;; animation to complete can cause a crash, or other unexpected
    ;; behavior, on macOS (bug#28496).
    (when (featurep 'cocoa) (sleep-for 0.5))))

(defun sdo/toggle-frame-fullwidth (&optional frame)
  "Toggle width part of fullscreen state of FRAME.
Make selected frame full width or restore its previous size
if it is already fullscreen.

This is a hacked version of built-in toggle-frame-fullscreen

Before making the frame fullscreen remember the current value of
the frame's `fullscreen' parameter in the `fullscreen-restore'
parameter of the frame.  That value is used to restore the
frame's fullscreen state when toggling fullscreen the next time.

Note that with some window managers you may have to set
`frame-resize-pixelwise' to non-nil in order to make a frame
appear truly fullscreen.  In addition, you may have to set
`x-frame-normalize-before-maximize' in order to enable
transitions from one fullscreen state to another.

See also `toggle-frame-maximized'."
  (interactive)
  (let ((fullscreen (frame-parameter frame 'fullscreen)))
    (if (memq fullscreen '(fullscreen fullwidth))
	(let ((fullscreen-restore (frame-parameter frame 'fullscreen-restore)))
	  (if (memq fullscreen-restore '(maximized fullwidth fullwidth))
	      (set-frame-parameter frame 'fullscreen fullscreen-restore)
	    (set-frame-parameter frame 'fullscreen nil)))
      (modify-frame-parameters
       frame `((fullscreen . fullwidth) (fullscreen-restore . ,fullscreen))))
    ;; Manipulating a frame without waiting for the fullscreen
    ;; animation to complete can cause a crash, or other unexpected
    ;; behavior, on macOS (bug#28496).
    (when (featurep 'cocoa) (sleep-for 0.5))))

;; * Appearance
;; ** Font Size and Text Scaling

;; Change text scale in current bufferr, keeping constant frame size constant
(global-set-key (kbd "C->") 'text-scale-increase)
(global-set-key (kbd "C-<") 'text-scale-decrease)


;; Change text scale of all buffers, sometimes changing frame size
(use-package default-text-scale
  :bind (("C-M-=" . default-text-scale-increase)
         ("C-M--" . default-text-scale-decrease)))


;; ;; Change all buffers' text scales & frame sizes, keeping const #chars width
;; ;; https://github.com/danielmai/.emacs.d/blob/master/config.org#zoom-frm
;; ;; Note: default-text-scale seems to do the same thing, with fewer package deps
;; (use-package frame-fns)
;; (use-package frame-cmds)
;; (use-package zoom-frm
;;   ;; TODO: figure out what to bind this to
;;   ;; :bind (("C-x-=" . zoom-in/out)
;;   ;;        ("H-z"   . toggle-zoom-frame)
;;   ;;        ("s-<f1>" . toggle-zoom-frame))
;;   :config
;;   (setq frame-zoom-font-difference 10))

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

;; ** Cursor

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
  :defer 0
  :diminish beacon-mode
  :config
  (beacon-mode 1))

;; ** Modeline
(display-time-mode 1) ; time on the modeline (is customized)

(use-package smart-mode-line
  :config
  (setq sml/theme nil) ; don't change existing modeline faces
  (sml/setup))

;; ** Paren matching

;; Doesn't do anything with my current setup.  Maybe I need to
;; configure it for a white background, and remove some other
;; hard-coded paren match I've creates somewhere in .emacs?
;;
;; Does it conflict with show-paren-mode, which I have turned on?
;;
;; (use-package rainbow-delimiters)

;; ** Other

(show-paren-mode 1) ; turn on blinking parens

;; visual line mode messes up org-tables but is GREAT for everything else.
(global-visual-line-mode +1) ; soft line wrapping

;; in emacs 28.1, this is now C-x x t
;; (global-set-key (kbd "C-c t") 'toggle-truncate-lines) ; e.g. to view org-mode tables

(column-number-mode 1) ; in mode-line
(mouse-avoidance-mode 'animate)  ; get mouse out of way of cursor, is customized

(auto-fill-mode -1)  ; don't do autofill: do visual wrap instead
;; in case some other mode sets this hook in text mode
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

;; Sets the wrap-prefix property on the fly so that single-long-line
;; paragraphs get word-wrapped in a way similar to what you'd get with
;; M-q using adaptive-fill-mode, but withouth changing text so doesn't
;; mess up visual line mode. However, it doesn't indent 2nd line
;; numbered or lettered lists
;;
;; TODO: how does this work, or not work, with unfill package?
;; 
(use-package adaptive-wrap ; required for visual line mode hook below?
  :diminish adaptive-wrap-prefix-mode
  ;;  :config (add-hook 'visual-line-mode-hook
  ;;  (adaptive-wrap-prefix-mode +1)))
  :config (add-hook 'visual-line-mode-hook
  		    (lambda ()
  		      (adaptive-wrap-prefix-mode +1)
  		      (diminish 'visual-line-mode))))

;; turn fill-paragraph into a fill/unfill toggle, runs when type M-q
(use-package unfill
  :bind ([remap fill-paragraph] . unfill-toggle))

;; turn off the bell
(setq bell-volume 0)
(setq sound-alist nil)
(setq visible-bell t)
;; turn off the annoying alarm bell (is this redundant?)
(setq ring-bell-function 'ignore)

;; * Images
(setq org-image-actual-width nil)
;; * Scrolling, Cursor Movement and Selection

;; *** Cursor and scroll 
(setq scroll-step 1)
(global-set-key (kbd "M-[") 'scroll-down) ; page up
(global-set-key (kbd "M-]") 'scroll-up)   ; page down

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
(global-set-key (kbd "M-+") 'global-display-line-numbers-mode) ; toggles all

;; After scrolling (scroll-up/down-command), highlights the previous current line, if it's still in screen.  Does something different for pageup/down.  Not sure I care.
;; https://hoeltgman.gitlab.io/dotemacs/
;; (use-package golden-ratio-scroll-screen
;;   :ensure t
;;   :config
;;   (global-set-key [remap scroll-down-command] 'golden-ratio-scroll-screen-down)
;;   (global-set-key [remap scroll-up-command]   'golden-ratio-scroll-screen-up))

;; *** golden-ratio
;; MESSES UP VC-DIFF
;; Expands size of window you switch to.
;; https://www.youtube.com/watch?v=k5Nwwo4QTmI
;; Alternative: https://github.com/cyrus-and/zoom
;; (use-package golden-ratio
;;   :diminish golden-ratio-mode  ; doesn't hide the "Org" in modeline, for some reason
;;   :init
;;   (setq golden-ratio-auto-scale t)
;;   (golden-ratio-mode 1))

;; ;; Prevent golden-ratio from messing up ediff (could also do for helm)
;; ;; from: https://github.com/roman/golden-ratio.el/wiki

;; (defun pl/ediff-comparison-buffer-p ()
;;   (and (boundp 'ediff-this-buffer-ediff-sessions)
;;        ediff-this-buffer-ediff-sessions))

;; (eval-after-load "golden-ratio"
;;   '(progn
;;      (add-to-list 'golden-ratio-exclude-modes "ediff-mode")
;;      (add-to-list 'golden-ratio-inhibit-functions 'pl/ediff-comparison-buffer-p)))

;; ;; Do w/ use-package :hook ? Can that specifically go to 'ediff-startup-hook ?
;; (defun my-ediff-golden-ratio-startup-hook ()
;;   "Workaround to balance the ediff windows when golden-ratio is enabled."
;;   ;; There's probably a better way to do it.
;;   (ediff-toggle-split)
;;   (ediff-toggle-split))

;; (add-hook 'ediff-startup-hook 'my-ediff-golden-ratio-startup-hook)

;; recommended: https://stackoverflow.com/questions/39696806/visual-line-mode-except-in-tables?noredirect=1#comment126873272_39696806
;; https://github.com/misohena/phscroll
;; (use-package phscroll
;;   :straight (:host github :repo "misohena/org-phscroll"
;;                    :files ("org-phscroll.el" "phscroll.el")))

;; *** Window Movement
;; A better C-x o
;; https://www.reddit.com/r/emacs/comments/7evidd/windmove_shortcuts/
(defun other-window-and-beyond (count &optional all-frames)
  (interactive "p")
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "o") 'other-window) map)
   t)
  (other-window count all-frames))

(define-key (current-global-map) (kbd "C-x o") 'other-window-and-beyond)

;; So C-arrow keys move cursor to different buffer (C-S-arrow moves buffers)
(use-package windmove
  :bind (("<C-up>"    . windmove-up)
         ("<C-down>"  . windmove-down)
         ("<C-left>"  . windmove-left)
         ("<C-right>" . windmove-right))
  :custom
  (windmove-wrap-around t)) ; wrap windows around edge, like torus space

;; TODO: remove these bindings in favor of hyra?
;; Overwrites org keys I don't use (are inhibited in org setup)
;; (global-set-key (kbd "<C-up>")     'windmove-up)
;; (global-set-key (kbd "<C-down>")   'windmove-down)
;; (global-set-key (kbd "<C-left>")   'windmove-left)
;; (global-set-key (kbd "<C-right>")  'windmove-right)

;; Window movement, since windmove mappings above are overwritten in elpy
;; https://www.reddit.com/r/emacs/comments/7evidd/windmove_shortcuts/
;; TODO: is which-key good enough for this?  Only thing is how to keep
;; it going until done, as hydra does it with _SPC_
;; TODO: shrink some more and put a bunch of other window functions on
;; this hydra?  Maybe frames, buffers, ...
;; TODO compare w/ ace-window and hydr: https://www.youtube.com/watch?v=_qZliI1BKzI

;; I never use this
;;
;; (use-package hydra
;;   :defer t); s/ probably put some hydra defs inside of it, or this inside of ivy
;; (defhydra hydra-window (:color pink :hint nil :timeout 20)
;;   "
;;      Move          Swap          Resize        Split
;; ╭─────────────────────────────────────────────────────────┐
;;       U            C-U             M-U         [v]ertical
;;       ▲             ▲               ▲          [h]orizontal
;;  L ◀   ▶ R   C-L ◀   ▶ C-R   M-L ◀   ▶ M-R    [s]ensibly
;;       ▼             ▼               ▼          ╭──────────┐
;;       D            C-D             M-D          quit : [q]
;; "
;;   ("<left>" windmove-left)
;;   ("<down>" windmove-down)
;;   ("<up>" windmove-up)
;;   ("<right>" windmove-right)
;;   ("h" split-window-below)
;;   ("v" split-window-right)
;;   ("s" (split-window-sensibly))
;;   ("M-<up>" hydra-move-splitter-up) 
;;   ("M-<down>" hydra-move-splitter-down)
;;   ("M-<left>" hydra-move-splitter-left)
;;   ("M-<right>" hydra-move-splitter-right)
;;   ("C-<up>" buf-move-up)
;;   ("C-<down>" buf-move-down)
;;   ("C-<left>" buf-move-left)
;;   ("C-<right>" buf-move-right)
;;   ("q" nil))

;; (global-set-key (kbd "C-x w") 'hydra-window/body)

;; ;; splitter funcs from: https://github.com/abo-abo/hydra/blob/master/hydra-examples.el
;; (defun hydra-move-splitter-left (arg)
;;   "Move window splitter left."
;;   (interactive "p")
;;   (if (let ((windmove-wrap-around))
;;         (windmove-find-other-window 'right))
;;       (shrink-window-horizontally arg)
;;     (enlarge-window-horizontally arg)))

;; (defun hydra-move-splitter-right (arg)
;;   "Move window splitter right."
;;   (interactive "p")
;;   (if (let ((windmove-wrap-around))
;;         (windmove-find-other-window 'right))
;;       (enlarge-window-horizontally arg)
;;     (shrink-window-horizontally arg)))

;; (defun hydra-move-splitter-up (arg)
;;   "Move window splitter up."
;;   (interactive "p")
;;   (if (let ((windmove-wrap-around))
;;         (windmove-find-other-window 'up))
;;       (enlarge-window arg)
;;     (shrink-window arg)))

;; (defun hydra-move-splitter-down (arg)
;;   "Move window splitter down."
;;   (interactive "p")
;;   (if (let ((windmove-wrap-around))
;;         (windmove-find-other-window 'up))
;;       (shrink-window arg)
;;     (enlarge-window arg)))

;; *** Window move forward/back with mouse
;; Do an emacs Back buttion, traversing cursor movement history across
;; windows and frames using mouse buttons usually bound to browser
;; forward/back.  On MS sculpt mouse, swipe down is 'back'; up is 'forward'
(define-key global-map [mouse-4] 'next-multiframe-window)
(define-key global-map [mouse-5] 'previous-multiframe-window)

;; *** Selection

;; ** Expand-Region
;; handy with, at least, wrap-region for italics, bold,... emphasis
(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; *** Selection-sensitive case commands
(defun sdo/upcase-word-or-region ()
  (interactive)
  (if (use-region-p)
      (call-interactively 'upcase-region)
    (call-interactively 'upcase-word)))

(defun sdo/downcase-word-or-region ()
  (interactive)
  (if (use-region-p)
      (call-interactively 'downcase-region)
    (call-interactively 'downcase-word)))

(defun sdo/capitalize-word-or-region ()
  (interactive)
  (if (use-region-p)
      (call-interactively 'capitalize-region)
    (call-interactively 'capitalize-word)))

(global-set-key (kbd "M-u") 'sdo/upcase-word-or-region)
(global-set-key (kbd "M-l") 'sdo/downcase-word-or-region)
(global-set-key (kbd "M-c") 'sdo/capitalize-word-or-region)

;; * Narrowing

;; Default emacs narrowing has too many keys: Could wipe them out and
;; make it a toggle as in
;; Commenters act like recursive-narrow is an improvement over endlessparens'
;; narrow-or-widen-dwim but I'm not sure why.  Maybe narrowed result
;; maintains top headline indent?  Maybe that's because it handles
;; org-mode too?
(use-package recursive-narrow :after org)

;; TODO put binding below inside recursive-narrow use-package
;;
;; Global narrowing binding is same as in org-mode
(global-set-key (kbd "C-x n n") 'recursive-narrow-or-widen-dwim)
;; Could have wiped out all Ctl-x n funcs (below) but this would have
;; wiped out some org-roam funcs that I haven't tried yet.
;;(define-key ctl-x-map "n" #'recursive-narrow-or-widen-dwim)

;; * Buffer Handling
;; ** Buffer naming

;; Renames buffers containing same file names, different dirs
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p 1)

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
  :bind (
         ("<C-S-up>"    . 'buf-move-up)
         ("<C-S-down>"  . 'buf-move-down)
         ("<C-S-left>"  . 'buf-move-left)
         ("<C-S-right>" .  'buf-move-right)))

;; tab keys work across buffers like browsers across tabs
(global-set-key (kbd "<C-tab>")  'other-window) ; forwards

;; *** Full Buffer Cloning

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

;; I don't understand the difference between clone-indirect-buffer and clone-indirect-buffer-other-window
(global-set-key (kbd "C-x 4 c") 'clone-indirect-buffer-other-window)

;; WARNING: below overwrites the new emacs 28.1 'clone-frame' command
;; C-x t n is similar to clone-frame, but puts it in an emacs tab
(global-set-key (kbd "C-x 5 c") 'sdo/clone-indirect-buffer-other-frame)

;; *** Org subtree Cloning

;; Compute a common name for indirect org-tree buffers.
;; Snipped from: https://github.com/alphapapa/bufler.el/issues/13
(defun sdo/org-tree-to-indirect-buffer-name ()
  (let* ((heading (org-get-heading t t))
         (level (org-outline-level))
         (face (intern (concat "outline-" (number-to-string level))))
         (heading-string (propertize (org-link-display-format heading)
                                     'face face)))
    (concat heading-string "::" (buffer-name))))

;; Modifed version of: 
;; https://github.com/alphapapa/bufler.el/issues/13
(defun sdo/org-tree-to-indirect-buffer (&optional arg)
  "Create indirect buffer and narrow it to current subtree.
The buffer is named after the subtree heading, with the filename
appended.  If a buffer by that name already exists, it is
selected instead of creating a new buffer."
  (interactive "P")
  (let* ((new-buffer-p)
         (pos (point))
         (buffer-name (sdo/org-tree-to-indirect-buffer-name))
         (new-buffer (or (get-buffer buffer-name)
                         (prog1 (condition-case nil
                                    (make-indirect-buffer
                                     (current-buffer) buffer-name 'clone)
                                  (error (make-indirect-buffer
                                          (current-buffer) buffer-name)))
                           (setq new-buffer-p t)))))
    (switch-to-buffer new-buffer)
    (when new-buffer-p
      ;; I don't understand why setting the point again is necessary, but it is.
      (goto-char pos)
      (rename-buffer buffer-name)
      (org-narrow-to-subtree))))

(defun sdo/org-tree-to-indirect-buffer-new-frame (&optional arg)
  "Create indirect buffer and narrow it to current subtree, put it in new frame.
The buffer is named after the subtree heading, with the filename
appended.  If a buffer by that name already exists, just print name (unless cursor is already on a cloned headline (TODO: fix this slight bug))."
  (interactive "P")
  
  (let ((buffer-name (sdo/org-tree-to-indirect-buffer-name)))
    (if (get-buffer buffer-name)
        ;;(funcall-interactively 'switch-to-buffer buffer-name)
        (message "Tree already cloned to buffer named: '%s'" buffer-name)
      (progn                        
        (call-interactively 'split-window-below)
        (call-interactively 'sdo/org-tree-to-indirect-buffer)
        (call-interactively 'tear-off-window)))))

;; Emacs default is C-c C-x b; this extra binding mirrors buffer clones above
(global-set-key (kbd "C-x 4 t") 'sdo/org-tree-to-indirect-buffer)
(global-set-key (kbd "C-x 5 t") 'sdo/org-tree-to-indirect-buffer-new-frame)

;; *** Kill buffer along with frame when frame is (probably!) indirect

;; modifed from: https://emacs.stackexchange.com/a/2915/14273
;; binding to C-x 5 C-0 ensures that you really mean to delete the
;; buffer (important?)
(defun delete-frame-maybe-buffer ()
  "When a dedicated FRAME is deleted, also kill its buffer.
A dedicated frame contains a single window whose buffer is not
displayed anywhere else."
  (interactive)
  (let ((windows (window-list (selected-frame))))
    (when (eq 1 (length windows))
      (let ((buffer (window-buffer (car windows))))
        (when (eq 1 (length (get-buffer-window-list buffer nil t)))
          (kill-buffer buffer)))))
  (call-interactively 'delete-frame))

(global-set-key (kbd "C-x 5 C-0") 'delete-frame-maybe-buffer)

;; * Emacs Command Execution

;; in emacs 28.1 is the option use-short-answers
;;(fset 'yes-or-no-p 'y-or-n-p) ; type just "y" instead of "yes"

(use-package which-key ; complex key hints, better than guide-key
  :diminish which-key-mode
  :defer 0
  :config
  (which-key-mode)
  (which-key-setup-side-window-right-bottom)) ; do bottom if no room on side

(use-package helm-descbinds
  :after helm-bibtex
  :commands helm-descbinds)

(use-package hydra
  :commands defhydra
  :straight t)

(defhydra hydra-utils (:color blue :hint nil)
  "
Utils:
^Info1^         ^Info2/cust^     ^Org/misc^                 ^Misc^
--------------------------------------------------------------------------------
_b_: bindings   _m_: mode        _P_: parent headings      _a_: calc
_s_: symbol     _i_: info        _B_: add bibitem org      _p_: counsel-yank-pop
_k_: key        _c_: cust-appr   _o_: org-indent-mode      _e_: ediff-buffers
_f_: face       _C_: cust-mode   _W_: window resize        _E_: ediff-files
                             _w_: toggle frame width   _h_: toggle frame height
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
  ("B" add-bibitem-org)  
  ("o" org-indent-mode) ; toggles org text to headline level & other stuff
  ;;("H" helm-mini) ; buffers & recent files: like ivy with "virtual buffers"
  ("W" resize-window)
  ;;("w" sdo/wttrin)
  ("w" sdo/toggle-frame-fullwidth)

  ("a" calc)
  ("p" counsel-yank-pop)
  ("e" ediff-buffers)
  ("E" ediff-files)
  ("h" sdo/toggle-frame-fullheight)

  ("." org-mark-ring-push :color red)
  ("/" org-mark-ring-goto :color blue)
  ;; ("B" helm-buffers-list)
  )
;; ("R" helm-recentf)
(global-set-key (kbd "<M-apps>") 'hydra-utils/body) ; for fullsize keyboard
(global-set-key (kbd "<C-lwindow>") 'hydra-utils/body) ; no apps on Surface Go
(global-set-key (kbd "M-<linefeed>") 'hydra-utils/body) ; alt+conext: WinKbd on MacOS
;; TODO: an org link to helpful pages like you can get for C-l in info or man page
(use-package helpful ; better emacs info: https://github.com/Wilfred/helpful
  :defer t
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
   ("C-h C" . #'helpful-command))
  :init
  ;; helpful helper: click on a link and the helpful window is reused.
  ;; From: https://d12frosted.io/posts/2019-06-26-emacs-helpful.html
  (setq helpful-switch-buffer-function #'+helpful-switch-to-buffer)

  (defun +helpful-switch-to-buffer (buffer-or-name)
    "Switch to helpful BUFFER-OR-NAME.

The logic is simple, if we are currently in the helpful buffer,
reuse it's window, otherwise create new one."
    (if (eq major-mode 'helpful-mode)
        (switch-to-buffer buffer-or-name)
      (pop-to-buffer buffer-or-name)))
  )

;; * File Finding / Opening
;; ** Dired Mode
;; *** Generic Dired and Win32 integration

(with-eval-after-load 'dired
  (add-hook  'dired-mode-hook
	     (lambda ()
               (dired-hide-details-mode) ; less junk.  ')' restores orig format
               ;; make dired search case insensitive (default is case sensitive)
	       (setq case-fold-search t)
               ;; override for dired, in which this is annoying, for some reason
	       (define-key dired-mode-map (kbd "C-x C-f") 'find-file))))

;; so that dired automatically updates stale directory list when buffer revisted
(setq dired-no-confirm `(revert-subdirs))
;; I want to do these w/o interrupting emacs prompts
(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)

;; *** Dired subtree and project explorer

;; It turns out that don't actually use the expansion capabilities of this
;;
;; (defun mhj/dwim-toggle-or-open ()
;;   "Toggle subtree or open the file."
;;   (interactive)
;;   (if (file-directory-p (dired-get-file-for-visit))
;;       (progn
;;         (dired-subtree-toggle)
;;         (revert-buffer))
;;     (dired-find-file)))
;;
;; ;; TODO: Click both toggles directory and opens in a new dired window.  Get rid of the open.
;; (defun mhj/mouse-dwim-to-toggle-or-open (event)
;;   "Toggle subtree or the open file on mouse-click in dired."
;;   (interactive "e")
;;   (let* ((window (posn-window (event-end event)))
;;          (buffer (window-buffer window))
;;          (pos (posn-point (event-end event))))
;;     (progn
;;       (with-current-buffer buffer
;;         (goto-char pos)
;;         (mhj/dwim-toggle-or-open)))))
;;
;; (use-package dired-subtree
;;   :demand
;;   :bind
;;   (:map dired-mode-map
;;         ("<enter>" . dired-find-file)
;;         ("<return>" . dired-find-file)
;;         ("<tab>" . mhj/dwim-toggle-or-open)
;;         ("<down-mouse-1>" . mhj/mouse-dwim-to-toggle-or-open))
;;   :config
;;   (progn
;;     ;; Function to customize the line prefixes (I simply indent the lines a bit)
;;     (setq dired-subtree-line-prefix (lambda (depth) (make-string (* 2 depth) ?\s)))
;;     (setq dired-subtree-use-backgrounds nil)))

;; ;; My "Bugfixed" version of the function in dired-subtree.el
;; ;; Mabye it's not fixing anything: See my bug report:
;; ;;   https://github.com/Fuco1/dired-hacks/issues/164
;; (defun dired-subtree-insert ()
;;   "Insert subtree under this directory."
;;   (interactive)
;;   (when (and (dired-subtree--dired-line-is-directory-or-link-p)
;;              (not (dired-subtree--is-expanded-p)))
;;     (let* ((dir-name (dired-get-filename nil t))
;;            (listing (dired-subtree--readin (file-name-as-directory dir-name)))
;;            beg end)
;;       (read-only-mode -1)
;;       (move-end-of-line 1)
;;       ;; this is pretty ugly, I'm sure it can be done better
;;       (save-excursion
;;         (insert listing)
;;         (setq end (+ (point) 2)))
;;       (newline)
;;       (setq beg (point))
;;       (let ((inhibit-read-only t))
;;         (remove-text-properties (1- beg) beg '(dired-filename)))
;;       (let* ((ov (make-overlay beg end))
;;              (parent (dired-subtree--get-ov (1- beg)))
;;              (depth (or (and parent (1+ (overlay-get parent 'dired-subtree-depth)))
;;                         1))
;;              (face (intern (format "dired-subtree-depth-%d-face" depth))))
;;         (when dired-subtree-use-backgrounds
;;           (overlay-put ov 'face face))
;;         ;; refactor this to some function
;;         (overlay-put ov 'line-prefix
;;                      (if (stringp dired-subtree-line-prefix)
;;                          (if (not dired-subtree-use-backgrounds)
;;                              (apply 'concat (-repeat depth dired-subtree-line-prefix))
;;                            (cond
;;                             ((eq nil dired-subtree-line-prefix-face)
;;                              (apply 'concat
;;                                     (-repeat depth dired-subtree-line-prefix)))
;;                             ((eq 'subtree dired-subtree-line-prefix-face)
;;                              (concat
;;                               dired-subtree-line-prefix
;;                               (propertize
;;                                (apply 'concat
;;                                       (-repeat (1- depth) dired-subtree-line-prefix))
;;                                'face face)))
;;                             ((eq 'parents dired-subtree-line-prefix-face)
;;                              (concat
;;                               dired-subtree-line-prefix
;;                               (apply 'concat
;;                                      (--map
;;                                       (propertize dired-subtree-line-prefix
;;                                                   'face
;;                                                   (intern (format "dired-subtree-depth-%d-face" it)))
;;                                       (number-sequence 1 (1- depth))))))))
;;                        (funcall dired-subtree-line-prefix depth)))
;;         (overlay-put ov 'dired-subtree-name dir-name)
;;         (overlay-put ov 'dired-subtree-parent parent)
;;         (overlay-put ov 'dired-subtree-depth depth)
;;         (overlay-put ov 'evaporate t)
;;         (push ov dired-subtree-overlays))
;;       (goto-char beg)
;;       (dired-move-to-filename)
;;       (read-only-mode 1)
;;       (run-hooks 'dired-subtree-after-insert-hook))))

;; *** Dired narrow: show only string matches, then edit only narrowed part

;; '/', type a narrowing string  starts it, 'g' ends the narrowing
;; Is somewhat redundant w/ just doing swiper search of dired buffer
;; Is also somewhat redudant w/ consult, although that reverts to
;; dired when you pick a dir.
;; also see: narrow-or-widen-dwim
(use-package dired-narrow
  :bind (:map dired-mode-map ("/" . dired-narrow)))

;; *** Better org-links from dired

(with-eval-after-load 'org
  ;; From: https://emacs.stackexchange.com/a/40528/14273
  (defun my//dired-store-link (orig-fun &rest args)
    "Insert dired link description automatically."
    (if (derived-mode-p 'dired-mode)
        (let ((file (dired-get-filename nil t)))
          (setf file (if file
                         (abbreviate-file-name (expand-file-name file))
                       default-directory))
          (let ((link (concat "file:" file))
                (desc (file-name-nondirectory file)))
            (push (list link desc) org-stored-links)
            (car org-stored-links)))
      (apply orig-fun args)))

  (advice-add 'org-store-link :around #'my//dired-store-link))

;; *** Open current file from dired using default OS program

;; could replace this w/ (I think) equivalent consult function
(defun xah-open-in-external-app (&optional @fname)
  "Open the current file or dired marked files in external app.
When called in emacs lisp, if @fname is given, open that.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2019-11-04 2021-02-16"
  (interactive)
  (let* (
         ($file-list
          (if @fname
              (progn (list @fname))
            (if (string-equal major-mode "dired-mode")
                (dired-get-marked-files)
              (list (buffer-file-name)))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (shell-command (concat "PowerShell -Command \"Invoke-Item -LiteralPath\" " "'" (shell-quote-argument (expand-file-name $fpath )) "'")))
         $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))

(with-eval-after-load 'dired
  (define-key dired-mode-map [(shift return)] 'xah-open-in-external-app))

;; ** Find-file and URL

;;https://emacs.stackexchange.com/questions/18128/quickly-open-file-by-full-path-in-clipboard
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

;; ** Copy filename of current buffer (kind of the opposite of ffap)

;; From:
;; http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
;; and https://github.com/bbatsov/prelude and https://blog.sumtypeofway.com/posts/emacs-config.html
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

;;(global-set-key "\C-x \C-r" 'sdo/find-recentf)
;;(global-set-key (kbd "C-x C-r") 'sdo/find-recentf)
(global-set-key (kbd "\C-x \C-r") 'sdo/find-recentf)
(global-set-key (kbd "C-x 4 r") 'sdo/find-recentf-other-window) ; like find-file
(global-set-key (kbd "C-x 5 r") 'sdo/find-recentf-other-frame)

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

;; Emacs binding conventions: https://www.emacswiki.org/emacs/ChoosingKeysToBind
;; M-x describe-personal-keybindings to see what keys you have bound, although this is only keys you've bound in use-package.
;;
;; See what keys are unbound. To see what's left on e.g. C-c type 'p'
;; and then the chars "C-c". Don't type the keycombo "C-c"
;;(use-package free-keys)

(global-set-key [f1] 'revert-buffer)
(global-set-key [f2] 'vc-dir)
(global-set-key [f3] 'ediff-files)
(global-set-key [f4] 'indent-buffer)
(global-set-key [f6] 'rgrep)
(global-set-key [f7] 'clear-buffer)
(global-set-key [f8] 'compile)
(global-set-key [f9] 'align-equals)
;; f10 reserved for remote desktop (vnc, thinlink, etc.)
(global-set-key [f11] 'eshell) ; almost Unix, consistent across OS's
;; (global-set-key [C-f11] 'shell) ; native shell, (make OS-dependent, above)
;;
;; is there a consult function for this?
(global-set-key [f12] 'repeat-complex-command)

;; ** prevent find-file-literally from wiping out saved place

;; So find-file-literally doesn't wipe out place when visiting
;; org-files.  This was a problem for consult preview.  It will be
;; fixed in emacs 29.1
;; https://github.com/minad/consult/issues/465
(with-eval-after-load 'saveplace
  (defun my/dont-save-place-when-find-file-literally (orig-fun &rest args)
    (unless find-file-literally
      (apply orig-fun args)))

  (advice-add #'save-place-to-alist
              :around #'my/dont-save-place-when-find-file-literally))


;; * Search and Replace (see also Swiper/Ivy)
;; ** File System Search

;; *** deadgrep

;; comment out so can instead use consult-ripgrep
;;
;; ;; File search w/ nice interface, better than standard emacs lgrep, I think
;; (if (setq rg_exe (sdo/find-exec "rg" "ripgrep needed org-roam and others"))
;;     (progn (use-package deadgrep)
;;            (global-set-key [f5] 'deadgrep)
;;            ;; use current working dir as starting point of search
;;            ;; https://github.com/Wilfred/deadgrep/issues/14#issuecomment-464363207
;;            (defun wh/return-default-dir ()
;;              default-directory)

;;            (setq deadgrep-project-root-function #'wh/return-default-dir))
;;   (global-set-key [f5] 'lgrep))

;; ** Search/Replace within Buffer

;; Commented out so as not to conflict with consult binding
;;
;; Bindings for searching with currently highlighted string
;; See also "C-c s") 'swiper-isearch-thing-at-point)
;; (define-key isearch-mode-map "\M-s" 'isearch-repeat-forward)  ; word forward
;; (define-key isearch-mode-map "\M-r" 'isearch-repeat-backward) ; word backward

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
  ;;  :defer 0
  :config
  ;; Doesn't seem to work, but now none of iedit does, for some reason
  ;; ;; https://www.masteringemacs.org/article/iedit-interactive-multi-occurrence-editing-in-your-buffer
  ;; (defun iedit-dwim (arg)
  ;;   "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
  ;;   (interactive "P")
  ;;   (if arg
  ;;       (iedit-mode)
  ;;     (save-excursion
  ;;       (save-restriction
  ;;         (widen)
  ;;         ;; this function determines the scope of `iedit-start'.
  ;;         (if iedit-mode
  ;;             (iedit-done)
  ;;           ;; `current-word' can of course be replaced by other
  ;;           ;; functions.
  ;;           (narrow-to-defun)
  ;;           (iedit-start (current-word) (point-min) (point-max)))))))
  
  (defun sdo/iedit-within-defun ()
    "Do iedit search and replace within current defun (equivalent to C-0 C-;)"
    (interactive)
    (let ((current-prefix-arg '(0))) (call-interactively 'iedit-mode)))
  :bind
  (("C-'" . sdo/iedit-within-defun)))

;; https://www.youtube.com/watch?v=jNa3axo40qM
;; Mouse from:
;; http://pragmaticemacs.com/emacs/add-multiple-cursors-with-mouse-clicks/
;; TODO: does mouse thing conflict /w org-roam binding?
(use-package multiple-cursors
  :ensure t
  :bind (("M-." . mc/mark-next-like-this)
         ("M-," . mc/unmark-next-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

;; Substitute: (rename within defun, directinal global replace, etc.)
;; ieditwithin-defun might be a little nicer (C-;)
;; https://protesilaos.com/codelog/2023-01-16-emacs-substitute-package-demo
;; TODO:
;; (add-hook 'substitute-post-replace-functions #'substitute-report-operation)
;; (let ((map global-map))
;;   (define-key map (kbd "M-# s") #'substitute-target-below-point)
;;   (define-key map (kbd "M-# r") #'substitute-target-above-point)
;;   (define-key map (kbd "M-# d") #'substitute-target-in-defun)
;;   (define-key map (kbd "M-# b") #'substitute-target-in-buffer))
;; (use-package substitute)

;; * Prescient

;; prescient sorts and filters candidate lists for
;; ivy/counsel/vertico, etc..
;; Does this sometimes stop ivy search from working?
(use-package prescient
  :config
  (prescient-persist-mode)) ; persist across emacs sessions

;; * Completion: Vertico/Corfu/Orderless/Marginalia/Embark

;; SUMMARY: Lot's of great functions but I prefer swiper search
;; highlighting.  Worth the trade?

;; ** Completions with Vertico

;; This came from systemcrafter guy: https://config.daviwil.com/emacs
(defun dw/minibuffer-backward-kill (arg)
  "When minibuffer is completing a file name delete up to parent
folder, otherwise delete a word"
  (interactive "p")
  (if minibuffer-completing-file-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
    (backward-kill-word arg)))

;; TODO: try vertico extensions:
;; https://github.com/minad/vertico#extensions
;; vertico- buffer, directory, grid, mouse, repeat, reverse
;; TODO: C-r does search backwards, like I did w/ swiper
;; TODO: show full match in main buffer, like ivy
;;
;; vertico extensions video: https://www.youtube.com/watch?v=hPwDbx--Waw
;; setting up embark collect from vertico: http://ix.io/47pP/elisp
;; via: vertico extensions video
;;
;; my config, as of 3/4/23
(use-package vertico
  :after swiper ; so inherited fonts are defined?
  :bind (:map vertico-map
              ("C-s" . vertico-next)
              ("C-r" . vertico-previous)
              ;; ("C-j" . vertico-next)
              ;; ("C-k" . vertico-previous)
              ;; ("C-f" . vertico-exit)
              :map minibuffer-local-map
              ("M-h" . dw/minibuffer-backward-kill))
  :custom
  (vertico-cycle t)
  :custom-face
  ;;  (vertico-current ((t (:background "#3a3f5a"))))
  :init
  (vertico-mode))

;; ;; my modified 3/4/23 setup
;; (use-package vertico
;;   :after swiper ; so inherited fonts are defined?
;;   :straight (vertico :files (:defaults "extensions/*")
;; 		     ;; from: https://github.com/abroekhof/dotemacs
;; 		     :includes (vertico-buffer
;; 				vertico-directory
;; 				vertico-grid
;; 				vertico-flat
;; 				vertico-indexed
;; 				vertico-mouse
;; 				vertico-quick
;; 				vertico-repeat
;; 				vertico-reverse))

;;   :bind (:map vertico-map
;;               ("C-s" . vertico-next)
;;               ("C-r" . vertico-previous)
;;               ;; ("C-j" . vertico-next)
;;               ;; ("C-k" . vertico-previous)
;;               ;; ("C-f" . vertico-exit)
;;               :map minibuffer-local-map
;;               ("M-h" . dw/minibuffer-backward-kill))
;;   :custom
;;   (vertico-cycle t)
;;   :custom-face
;;   ;;  (vertico-current ((t (:background "#3a3f5a"))))
;;   :init
;;   (vertico-mode))


;; started from:  https://github.com/minad/vertico
;; on vertico extensions: https://www.youtube.com/watch?v=hPwDbx--Waw
;; (use-package vertico ; VERTical Interactive COmpletion
;;   :straight (vertico :files (:defaults "extensions/*")
;; 		     ;; from: https://github.com/abroekhof/dotemacs
;; 		     :includes (vertico-buffer
;; 				vertico-directory
;; 				vertico-grid
;; 				vertico-flat
;; 				vertico-indexed
;; 				vertico-mouse
;; 				vertico-quick
;; 				vertico-repeat
;; 				vertico-reverse))
;;   :hook (after-init-hook . vertico-mode)
;;   :bind (:map vertico-map
;;               ("M-q" . vertico-multiform-grid)
;; 	      ("M-RET" . vertico-exit-input))
;;   :custom
;;   ((vertico-multiform-commands
;;     '((consult-grep buffer)
;;       (consult-imenu buffer)
;;       (consult-line buffer))))
;;   :config
;; ;;  (vertico-multiform-mode 1))
;;   )

;; If hit return on dir, open that dir in vertico, instead of going to dired
;; started from: https://github.com/abroekhof/dotemacs
;; (use-package vertico-directory
;;   :after vertico
;;   :ensure nil
;;   ;; More convenient directory navigation commands
;;   :bind (:map vertico-map
;;               ("RET" . vertico-directory-enter)
;;               ("DEL" . vertico-directory-delete-char)
;;               ("M-DEL" . vertico-directory-delete-word))
;;   ;; Tidy shadowed file names (whatever that means)
;;   :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

;; ** Completions in Regions with Corfu

;; it's code (etc.) completion mechanism, like company

;; so far, I haven't been able to get corfu to work with eglot, so
;; I'll just use company for now
;;
;; https://github.com/minad/corfu/issues/136
;; (use-package corfu
;;   :demand t
;;   :custom
;;   (corfu-auto t)
;;   :init
;;   (corfu-global-mode))

;; (use-package corfu
;;   :bind (:map corfu-map
;;               ("C-n" . corfu-next)
;;               ("C-p" . corfu-previous)
;;               ("C-i" . corfu-insert))
;;   :custom
;;   (corfu-cycle t)
;;   (corfu-global-mode t))

;; ** Improved Candidate Filtering with Orderless

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

;; Persist history over Emacs restarts. Vertico sorts by history
;; position.  Like prescient, I guess.
;; from: https://github.com/minad/vertico
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
;; from: https://github.com/minad/vertico

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; A few more useful configurations for vertico...
;; from: https://github.com/minad/vertico
;; (use-package emacs
;;   :init

;;   ;; does this mess up doing C-o on org-cite links?
;;   ;; Add prompt indicator to `completing-read-multiple'.
;;   ;; Alternatively try `consult-completing-read-multiple'.
;;   (defun crm-indicator (args)
;;     (cons (concat "[CRM] " (car args)) (cdr args)))
;;   (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

;;   ;; Do not allow the cursor in the minibuffer prompt
;;   (setq minibuffer-prompt-properties
;;         '(read-only t cursor-intangible t face minibuffer-prompt))
;;   (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;;   ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
;;   ;; Vertico commands are hidden in normal buffers.
;;   ;; (setq read-extended-command-predicate
;;   ;;       #'command-completion-default-include-p)

;;   ;; Enable recursive minibuffers
;;   (setq enable-recursive-minibuffers t))

;; ** Consult Commands

;; Consult provides a lot of useful completion commands similar to
;; Ivy's Counsel.

;; inspired by
;; https://www.reddit.com/r/emacs/comments/l725u0/a_small_wrapper_for_consultripgrep_to_override/
(defun my-consult-ripgrep (prefix)
  "if called w/ prefix (C-u), then search in current buffer's dir instead of default project dir."
  (interactive "P")
  (consult-ripgrep
   (if (not prefix)
       nil
     (if (eq prefix 1)
         t
       (if (buffer-file-name) default-directory t)))))


;; File search w/ nice interface, better than standard emacs lgrep, I think
;; (if (setq rga_exe (sdo/find-exec "rga" "ripgrep-all needed ro org-roam, etc."))
;;     (progn (use-package deadgrep)
;;            (global-set-key [f5] 'deadgrep)
;;            ;; use current working dir as starting point of search
;;            ;; https://github.com/Wilfred/deadgrep/issues/14#issuecomment-464363207
;;            (defun wh/return-default-dir (junk)
;;              default-directory)

;;            (setq deadgrep-project-root-function #'wh/return-default-dir))
;;  (global-set-key [f5] 'lgrep))

(defun pick-consult-root-dir (junk)
  "For now, just return the default-directory.  Could make this smarter."
  default-directory)

(if (setq rga_exe (sdo/find-exec "rga" "ripgrep-all needed for org-roam, etc."))
    ;; from: https://github.com/minad/consult/issues/6#issuecomment-1150436294
    (defun consult-rga ()
      (interactive)
      (let ((consult-ripgrep-args (->> consult-ripgrep-args
                                       (string-remove-prefix "rg")
				       (concat "rga"))))
        (consult-ripgrep))))

;; ;; Doesn't work.  I need to get the consult-rga args right
;; (defun my-consult-rga (prefix)
;;   "if called w/ prefix (C-u), then search in current buffer's dir instead of default project dir."
;;   (interactive "P")
;;   (consult-rga
;;    (if (not prefix)
;;        nil
;;      (if (eq prefix 1)
;;          t
;;        (if (buffer-file-name) default-directory t)))))

;; (use-package consult
;;   :bind (("C-s"   . consult-line)
;;          ("C-x C-r" . consult-recent-file) ;; overrides my recentf
;;          ("C-x b" . consult-buffer)))


;; TODO: consult dir has stuff for docker hosts, too

;;https://github.com/karthink/consult-dir#docker-hosts

;; I WAS using this one, as of 3/1/23
;; start over w/ something simple?  Like 
;; Started from systemcrafter guy: https://config.daviwil.com/emacs
(use-package consult
  ;;  :demand t  ; caused problems w/ org-mode-map binding below
  :bind (("C-M-l" . consult-imenu)
         ;; ("C-M-j" . persp-switch-to-buffer*) ;; use when if have perspective 
         ;; ("C-x C-r" . consult-recent-file) ;; overrides my recentf function
         ;;("C-x C-b" . consult-buffer) ;; override ibuffer binding, does more
         ;;("C-s" . consult-line) ;; also consult-line-multi for across bufs
         ;;("C-s" . consult-isearch) ; doesn't work
         ;; overrides deadgrep, also has grep, git-grep
         ;;         ("<f5>" . consult-ripgrep)
         ("<f5>" . my-consult-ripgrep)
         ;; search org & outshine headers (overrides default isearch bindings)
         ("M-s s" . consult-outline) ;; works but hangs in energytop.org
         :map minibuffer-local-map
         ("C-r" . consult-history)
         :map org-mode-map :package org 
         ;; consistent w/ consult example M-s search bindings (below)
         ("M-s s" . consult-org-heading) ; for org, better than consult-outline 
         )
  :custom
  (consult-project-function #'pick-consult-root-dir)
  (completion-in-region-function #'consult-completion-in-region)
  (consult-line-point-placement 'match-beginning)
  :config
  (consult-preview-at-point-mode)  ;; SDO: use new command name, I think
  ;;  Leave automatic immediate previews enabled in general and
  ;;  disable the automatic preview only for commands, where the
  ;;  preview may be expensive due to file loading.
  ;; https://github.com/minad/consult#live-previews
  (consult-customize
   ;;remove recent-file stuff, in case they conflict with mine
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-xref consult--source-bookmark
   ;; original
   ;; consult--source-project-recent-file
   ;; consult-bookmark consult-recent-file consult-xref
   ;; consult--source-bookmark consult--source-recent-file
   ;; consult--source-project-recent-file
   :preview-key (kbd "M-."))
  ;; Ripgrep-all (cannot jump to pdf page though)
  ;; From:
  ;; https://nest.pijul.org/alexdarcy/emacs.d:main/CBNDWUXF2JZSE.GQ6QA
  ;; DOESN'T WORK, THOUGH
  ;; NEEDS TO GO INTO CONSULT-CUSTOMIZE
  ;; https://github.com/minad/consult#multiple-sources
  (defcustom consult-ripgrep-all-command
    "rga --null --line-buffered --color=ansi --max-columns=1000\
   --no-heading --line-number . -e ARG OPTS"
    "Command line string for ripgrep-all, see `consult-ripgrep-all'.
The command string must have a specific format, including ARG and OPTS
substrings. ARG is replaced by the filter string and OPTS by the auxillary
command options."
    :type 'string)
  (defun consult-ripgrep-all (&optional dir initial)
    (interactive "P")
    (consult--grep "Ripgrep-all" consult-ripgrep-all-command dir initial))
  )

;;TODO: add "search selection" like I put in ivy (see below)
;;From: https://takeonrules.com/2021/05/15/a-year-or-so-of-emacs/
(advice-add #'consult-line
            :around
            #'jnf/consult-line
            '((name . "wrapper")))

(defun jnf/consult-line (consult-line-function &rest rest)
  "Advising function around `CONSULT-LINE-FUNCTION'.

  ;; When there's an active region, use that as the first parameter
  ;; for `CONSULT-LINE-FUNCTION'.  Otherwise, use the current word as
  ;; nthe first parameter.  This function handles the `REST' of the
  ;; parameters."
  (interactive)
  (if (use-region-p)
      (apply consult-line-function
        (buffer-substring (region-beginning) (region-end)) rest)
      (apply consult-line-function
        (thing-at-point 'word) rest)))

;; ** Completion Annotations with Marginalia

;; Marginalia provides helpful annotations for various types of minibuffer completions. You can think of it as a replacement of ivy-rich.

(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;; ** Completion Actions with Embark

;; subsubmed by 4/5/23 package above, but maybe this is OK?
;; (use-package embark
;;   :straight t
;;   :bind (("C-S-a" . embark-act)
;;          :map minibuffer-local-map
;;          ("C-." . embark-dwim)
;;          ("C-;" . embark-act))
;;   ;;         ("C-d" . embark-act))
;;   :config

;;   (setq embark-action-indicator '(
;;                                   ;; Show Embark actions via which-key (system crafter guy)
;;                                   (lambda (map)
;;                                     (which-key--show-keymap "Embark" map nil nil 'no-paging)
;;                                     #'which-key--hide-popup-ignore-command)
;;                                   embark-become-indicator embark-action-indicator
;;                                   ;; SO added below (but I don't get what this does)
;;                                   ;; See: https://github.com/oantolin/embark/wiki/Additional-Configuration#use-which-key-like-a-key-menu-prompt        
;;                                   embark-highlight-indicator
;;                                   embark-isearch-highlight-indicator)))

;; * Completion: Ivy/Swiper/Counsel/Company
;;   Ivy vs. Swiper vs. Company:
;;   https://www.reddit.com/r/emacs/comments/6x7ph2/comment/dmeyrcz/?utm_source=share&utm_medium=web2x&context=3

;; ** Ivy (A better M-x)
;;    https://writequit.org/denver-emacs/presentations/files/m-x-usage.gif
;; (use-package ivy
;;   :bind (("C-s" . swiper)
;;          ("C-x b" . ivy-switch-buffer))
;;   :config
;;   (ivy-mode 1)) ; so it starts @ emacs boot, no delay

;; ** Swiper (for searching in buffer, a better C-s)
;;    https://writequit.org/denver-emacs/presentations/files/swiper.gif
;; Help while in swiper search:
;;  swiper hydra: C-o;
;;  swiper full help: C-h m
(use-package swiper
  :demand t ; so its fonts are defined for vertico/consult/...?
  :diminish ivy-mode
  :custom
  (swiper-action-recenter nil) ;; does this work?
  (ivy-count-format "(%d/%d) ") ; show candidate index/count in swiper
  ;;  (ivy-mode t) ; not needed, at last not for just swiper
  (ivy-wrap t)
  :init
  ;;(setq ivy-use-virtual-buffers t) ; ivy-switch-buffer also shows recent files
  ;; swiper-isearch is much faster than plain swiper but slower than
  ;; grep swiper?:
  ;; https://oremacs.com/2019/04/07/swiper-isearch/
  (fset 'swiper-func-forward 'swiper-isearch) ; standard swiper, slow on large org files
  (fset 'swiper-func-backward 'swiper-isearch-backward) ; standard swiper, slow on large org files

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

  :bind (("C-s" . sdo/swiper-region-forward)
         ("C-r" . sdo/swiper-region-backward)
         ("C-c s" . swiper-isearch-thing-at-point))

  ;; comment out stuff not involving swiper (use consult, etc. for that)
  ;; ;; ;; ivy-views integrate with ivy-switch-buffer (See
  ;; ;; https://oremacs.com/2016/06/27/ivy-push-view/).  That's probably
  ;; ;; nice but I'm still using ido-switch-buffer b/c of its rectangular
  ;; ;; grid view.  So, I've bound ivy-switch view to something close to switch-buffer.
  ;; ;; NOTE: there is now an "ivy-grid" view: ivy-explorer, below.
  ;; (global-set-key (kbd "C-c v") 'ivy-push-view)
  ;; (global-set-key (kbd "C-c V") 'ivy-pop-view) ; works like delete
  ;; (global-set-key (kbd "C-x V") 'ivy-switch-view)
  ;; ;; actually, this seems to do the (nearly) same thing as C-s s
  ;; (global-set-key (kbd "C-c C-r") 'ivy-resume) ;Resume last ivy completion sess
  )

;; puts most recently use completion on top of list.  But I don't see
;; a change when I do this.  Maybe it's default in ivy now?  Or maybe
;; completions I'm looking at aren't done by ivy?
;;
;; (use-package ivy-prescient
;;   :after (counsel ivy prescient)
;;   :custom
;;   (ivy-prescient-mode t))

;; ** Counsel

;; (use-package counsel ; better kill-ring 2nd yanking
;;   :after ivy
;;   :init
;;   :diminish counsel-mode
;;   :bind
;;   (("M-y" . counsel-yank-pop)
;;    :map ivy-minibuffer-map
;;    ("M-y" . ivy-next-line)) ; needed?
;;   :config
;;   ;; Internet search, compare w/ google-this
;;   (global-set-key (kbd "C-S-s")  'counsel-search)) ; doesn't work in :bind

;; ;; ** Company Mode (code completion, etc.)
;; ;; Tab completion of variables, common words, ...  To activate (not
;; ;; a default): M-x company-mode or turn it on globally.
;; https://camo.githubusercontent.com/c088e25214451803a62c91f6b28bde13195da3ea/687474703a2f2f692e696d6775722e636f6d2f4c5236394d644e2e676966

;; from:
;; https://medium.com/helpshift-engineering/configuring-emacs-from-scratch-use-package-c30382297877
;; Set global-company-mode so that that eglot can run company
;; completion
;; TODO: make this work for all programming modes.  Right now, I just
;; have to manually run M-x company-complete to start
;; language file

;; I think company was used for some things, like eglot,  but it does too much completion in org-mode, and overwrites the handy org-ref-bibtex-hydra (?)
;; (use-package company
;; ;; doesn't do anything
;; ;;  :hook (prog-mode-hook . company-complete)
;;   :config
;;   (setq company-idle-delay 0.3)
;;   (global-company-mode t))
;; ;;
;; does nothing.  Must manually run M-x company-complete in some butter  
;;  (company-complete))


;; Used in other packages.  Here, make it prescient.  Maybe put this section in one of those places instead of here?
(use-package company-prescient
  :after company
  :init
  (company-prescient-mode))


;; ;; ** ivy-bibtex

;; (use-package ivy-bibtex
;;   :after ivy
;;   :defer t)

;; ** flyspell-correct-ivy

;; (use-package flyspell-correct-ivy
;;   :after (ivy flyspell-correct))


;; ** Ivy find recent directories
;; ;; From: http://pragmaticemacs.com/emacs/open-a-recent-directory-in-dired-revisited
;; ;; And:  http://stackoverflow.com/questions/23328037/in-emacs-how-to-maintain-a-list-of-recent-directories
;; ;; Alternative: M-x crux-recentf-find-directory
;; (defun bjm/ivy-dired-recent-dirs ()
;;   "Present a list of recently used directories and open the selected one in dired"
;;   (interactive)
;;   (let ((recent-dirs
;;          (delete-dups
;;           (mapcar (lambda (file)
;;                     (if (file-directory-p file)
;;                         file
;;                       (file-name-directory file)))
;;                   recentf-list))))

;;     (let ((dir (ivy-read "Directory: "
;;                          recent-dirs
;;                          :re-builder #'ivy--regex
;;                          :sort nil
;;                          :initial-input nil)))
;;       (dired dir))))

;; ;; Overwrites ido-list-directory, which was less useful than this
;; (global-set-key (kbd "C-x C-d") 'bjm/ivy-dired-recent-dirs)

;; * Versioning

;; Requires magit to do much
;; https://gitlab.com/pidu/git-timemachine
;; (use-package git-timemachine            ; Walk through git revisions of a file
;;   :bind ("C-x v t" . git-timemachine-toggle)
;;   :commands git-timemachine)

;; * Programming Modes
;; ** Matlab mode

;; Matlab on Windows barely works in emacs anymore, but keep around for Linux?
;;
;; ;; Got errors about obsolete code when I first installed this in packages. Note that abo-abo says that this package is no longer maintained (but did he mean THIS package or is THIS package actually his package? the 'matlab' package below is 'matlab-emacs' in sourceforge).  Anyway, abo-abo has a new matlab package, maybe worth trying.

;; ;; started from: https://github.com/thisirs/dotemacs/blob/master/lisp/init-matlab.el
;; (use-package matlab 
;;   :straight matlab-mode
;;   :defer t
;;   :mode ("\\.m$" . matlab-mode)
;;   :commands (matlab-shell)
;;   :config
;;   (setq matlab-shell-command "matlab")
;;   (setq matlab-shell-command-switches '("-nodesktop" "-nosplash"))

;;   ;; Don't switch to figure window
;;   (setenv "WINDOWID" (frame-parameter (selected-frame) 'outer-window-id))

;;   (setq-default matlab-change-current-directory t)
;;   (setq-default matlab-functions-have-end t)
;;   (setq-default matlab-indent-function-body 'guess)
;;   (setq matlab-indent-end-before-return t)

;;   ;;(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist)) ; in big list already
;;   (defun my-matlab-mode-hook ()
;;     (local-set-key "\M-j" #'join-to-next-line)
;;     (local-set-key "\M-;" 'comment-dwim)
;;     (auto-fill-mode -1)
;;     (setq fill-column 80)		; where auto-fill should wrap
;;     (define-key matlab-mode-map [f1] 'matlab-fill-paragraph) ; override global
;;     (define-key matlab-mode-map "\e;" 'comment-dwim) ; override matlab's commenter
;;     )
;;   (setq matlab-mode-hook 'my-matlab-mode-hook)

;;   ;;so matlab R12 runs in emacs and don't get a splash over remote connections prevents error messages from starting GUI but then plots don't work
;;   (setq matlab-shell-command-switches '("-nodesktop -nosplash"))

;;   (defun matlab-shell-fix-slowness ()
;;     (remove-hook 'comint-output-filter-functions 'matlab-shell-render-html-anchor t)
;;     (remove-hook 'comint-output-filter-functions 'matlab-shell-render-errors-as-anchor t))
;;   (add-hook 'matlab-shell-mode-hook #'matlab-shell-fix-slowness)
;;   :init
;;   (provide 'init-matlab))

;; ** elisp

;; Get rid of message "Package cl is deprecated".
;;(setq byte-compile-warnings '(cl-functions))

(add-hook 'emacs-lisp-mode-hook
	  #'(lambda ()
	      (set (make-local-variable 'dabbrev-case-fold-search) nil)
	      (set (make-local-variable 'dabbrev-case-replace) nil)))

;; ** C/C++
;; note: connect to common hook used by new cc-mode
(add-hook 'c-mode-common-hook
	  #'(lambda ()
	      (set (make-local-variable 'dabbrev-case-fold-search) nil)
	      (set (make-local-variable 'dabbrev-case-replace) nil)))

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
  :defer t
  :config
  (define-key cscope-list-entry-keymap "q" 'quit-window)) ; so quits like dired

;; ** Python

;; *** Python editing setup

;; TODO: some of my calls to sdo/find-exec may no longer be necessary,
;; as elpy now downloads its own python environement with some of
;; these already in it.  I should see which of these I can remove.

;; To activate a non-hardcoded env, run:
;; M-x conda-env-activate

;; (when (setq conda_exe (sdo/find-exec "thisIsNotThere" "Needed for most python packages"))

(when (setq conda_exe (sdo/find-exec "conda" "Needed for most python packages"))
  (setq conda-env-home-directory (expand-file-name
                                  (concat (file-name-directory conda_exe)
                                          "..")))
  (use-package conda
    :defer t
    :config
    (custom-set-variables
     '(conda-anaconda-home conda-env-home-directory))
    
    (conda-env-initialize-interactive-shells)
    (conda-env-initialize-eshell)
    (conda-env-activate "base"))

  (setq autopep8bin (sdo/find-exec "autopep8" "Needed by py-autopep8 autofix-on-save & elpy"))
  (when autopep8bin
    (use-package py-autopep8
      :config
      (setq py-autopep8-options '("--max-line-length=100" "--aggressive"))))
;; Don't autoformat: it was missing up my checkins to open-source GitHub repos
;;      :hook (python-mode . py-autopep8-mode)))

  ;; messes up eglot on windows?
  
  ;; ;; for Python mode comment filling
  ;; ;; https://stackoverflow.com/questions/2214199/how-to-use-emacs-to-write-comments-with-proper-indentation-line-length-and-wra
  ;; (require 'newcomment)
  ;; (add-hook 'python-mode-hook (progn
  ;;                               (setq comment-auto-fill-only-comments 1)
  ;;                               (setq-default auto-fill-function 'do-auto-fill)))

  ;; (diminish 'auto-fill-function) ; only works here, for some reason

  ;; Use Elpy instead of python-mode.
  ;;
  ;; I've remapped keys and functions so that it's easiest to run an
  ;; entire Python file (including any __main__).  Now, F8 runs a
  ;; script or region reusing an existing, if possible; S-F8 does the
  ;; run in a new *Python* console.
  ;;
  ;; elpy automatically downloads a lot of the Python libraries it requires.
  ;; You can see what's going on with: M-x elpy-config
  ;; You can force a reinstall with: M-x elpy-rpc-reinstall-virtualenv

  (sdo/find-exec "flake8" "Needed for elpy & Jupyterlab code checks")

  (defun sdo/kill-python-console ()
    "Kill python console if it exists -- immediately no questions asked."
    (interactive)
    (setq pyBuffNm "*Python*")
    (if (member pyBuffNm (mapcar (function buffer-name) (buffer-list)))
        (progn
          (switch-to-buffer pyBuffNm)
          (set-buffer-modified-p nil)
          (setq pproc (get-buffer-process pyBuffNm))
          (if pproc
              (set-process-query-on-exit-flag pproc nil))
          (kill-buffer))))

  ;;; <EGLOT> configuration, pick this or the LSP configuration but not both.
  ;; Using Eglot with Pyright, a language server for Python.
  ;; From: https://gist.github.com/Nathan-Furnal/b327f14e861f009c014af36c1790ec49
  ;; See: https://github.com/joaotavora/eglot.
  ;; must set up a python LSP server for python:
  ;; https://github.com/joaotavora/eglot#connecting-to-a-server
  ;; pyright (conda-forge) is vscode's pylance backend, so maybe that's best
  ;; https://discuss.python.org/t/lsp-for-python/22194/6
  ;; see https://langserver.org/ for language servers other than pyright
  ;;    JSON:  https://github.com/microsoft/vscode/tree/main/extensions/json-language-
  ;;    BibTex: https://github.com/oncomouse/citation-langserver
  ;;    Bash: https://github.com/bash-lsp/bash-language-server
  ;;    html:
  ;; https://github.com/Microsoft/vscode/tree/main/extensions/htmlfeatures/server
  ;;    latex: https://github.com/latex-lsp/texlab
  ;;    R: https://github.com/REditorSupport/languageserver
  ;;    XML: https://github.com/microclimate-devops/xml-language-server
  ;;
  ;; Crashed when not from forge. Do this: conda install -c
  ;; conda-forge pyright
  ;;
  ;; EGLOT NOT STARTING in python files, but does start for elisp.
  ;; MacOS only?  elot-ensure should do the job?  For now, manually
  ;; type M-x eglot when in a python file.
  ;;

  ;; Worked on MacOS but kept reconnecting Windows, hanging emacs 29.
  ;; (when (sdo/find-exec "pyright" "Server needed for python eglot")
  ;;   (use-package eglot
  ;;     :defer t
  ;;     ;; :bind (:map eglot-mode-map
  ;;     ;;             ("C-c <tab>" . #'company-complete)
  ;;     ;;             ("C-c e f n" . #'flymake-goto-next-error)
  ;;     ;;             ("C-c e f p" . #'flymake-goto-prev-error)
  ;;     ;;             ("C-c e r  " . #'eglot-rename))
      
  ;;     :hook (python-mode . eglot-ensure)))
  

  ;; (defun sdo/run-python-clean-as-possible ()
  ;;   "If region is active, then call elpy-shell-send-region-or-buffer-and-go; otherwise, save current buffer and run its contents in new *Python* console, killing any existing console; "
  ;;   (interactive)
  ;;   (unless (region-active-p)
  ;;     (save-buffer)
  ;;     (sdo/kill-python-console))
  ;;   (elpy-shell-send-region-or-buffer-and-go t))
  
  ;; (use-package elpy
  ;;   :defer t
  ;;   :diminish elpy-mode
  ;;   :after flycheck flycheck-pos-tip
  ;;   ;; Bind global "make" key to "C-u the command below" This runs
  ;;   ;; the region or whole .py buffer in a (possibly newly made) *Python*
  ;;   ;; console buffer, and then moves the cursor there.
  ;;   :bind ("<f8>" . (lambda () (interactive) (elpy-shell-send-region-or-buffer-and-go t)))
  ;;   :bind ("<S-f8>" . sdo/run-python-clean-as-possible)
  ;;   :bind ("<M-f8>" . (lambda () (interactive) (realgud:pdb))) ; :ipdb, :trepan, :gdb ?
  ;;   :init
  ;;   (elpy-enable)
  ;;   ;; jupyter recommended over ipython (how s/ this work w/ conda env switch?):
  ;;   ;; https://elpy.readthedocs.io/en/latest/ide.html#interpreter-setup
  ;;   ;; conda install -c anaconda jupyter_console 
  ;;   (sdo/find-exec "jupyter-console" "Elpy is set up to use this")
  ;;   (setq python-shell-interpreter "jupyter"
  ;;         python-shell-interpreter-args "console --simple-prompt"
  ;;         python-shell-prompt-detect-failure-warning nil)
  ;;   (add-to-list 'python-shell-completion-native-disabled-interpreters
  ;;                "jupyter")

  ;;   ;; use flycheck, not elpy's flymake
  ;;   ;; (https://realpython.com/blog/python/emacs-the-best-python-editor/
  ;;   ;;  https://elpy.readthedocs.io/en/latest/customization_tips.html)
  ;;   ;; I don't think I'm seeing much flycheck output
  ;;   (if (require 'flycheck nil t)
  ;;       (progn (message "found emacs flycheck package")
  ;;              (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  ;;              (add-hook 'elpy-mode-hook 'flycheck-mode)
  ;;              (flycheck-pos-tip-mode)
  ;;              (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  ;;              )
  ;;     (warn "elpy didn't find flycheck emacs package"))

  ;;   ;; Enable emacs 26 flymake indicators in an otherwise light
  ;;   ;; modeline
  ;;   ;; https://elpy.readthedocs.io/en/latest/customization_tips.html
  ;;   (setq elpy-remove-modeline-lighter t)
  ;;   (advice-add 'elpy-modules-remove-modeline-lighter
  ;;               :around (lambda (fun &rest args)
  ;;                         (unless (eq (car args) 'flymake-mode)
  ;;                           (apply fun args))))

  ;;   ;; Better "M-.":
  ;;   ;; https://elpy.readthedocs.io/en/latest/customization_tips.html
  ;;   (defun elpy-goto-definition-or-rgrep ()
  ;;     "Go to the definition of the symbol at point, if found. Otherwise, run `elpy-rgrep-symbol'."
  ;;     (interactive)
  ;;     (ring-insert find-tag-marker-ring (point-marker))
  ;;     (condition-case nil (elpy-goto-definition)
  ;;       (error (elpy-rgrep-symbol
  ;;               (concat "\\(def\\|class\\)\s" (thing-at-point 'symbol) "(")))))
  ;;   (define-key elpy-mode-map (kbd "M-.") 'elpy-goto-definition-or-rgrep)

  ;;   ;; Enable full font locking of inputs in the python shell
  ;;   ;; https://elpy.readthedocs.io/en/latest/customization_tips.html
  ;;   ;; I can't see that this does anything
  ;;   (advice-add 'elpy-shell--insert-and-font-lock
  ;;               :around (lambda (f string face &optional no-font-lock)
  ;;                         (if (not (eq face 'comint-highlight-input))
  ;;                             (funcall f string face no-font-lock)
  ;;                           (funcall f string face t)
  ;;                           (python-shell-font-lock-post-command-hook))))

  ;;   (advice-add 'comint-send-input
  ;;               :around (lambda (f &rest args)
  ;;                         (if (eq major-mode 'inferior-python-mode)
  ;;                             (cl-letf ((g (symbol-function 'add-text-properties))
  ;;                                       ((symbol-function 'add-text-properties)
  ;;                                        (lambda (start end properties &optional object)
  ;;                                          (unless (eq (nth 3 properties) 'comint-highlight-input)
  ;;                                            (funcall g start end properties object)))))
  ;;                               (apply f args))
  ;;                           (apply f args))))    

    ;; code tidy when save
    ;; (if autopep8bin
    ;;     (add-hook 'elpy-mode-hook 'py-autopep8-mode))
    
    ;; ;; Undo ely's override of C-arrowkeys
    ;; ;; https://github.com/jorgenschaefer/elpy/issues/1188
    ;; (eval-after-load "elpy"
    ;;   '(cl-dolist (key '("C-<up>" "C-<down>" "C-<left>" "C-<right>"))
    ;;      (define-key elpy-mode-map (kbd key) nil)))
    ;;)

  ;; *** EIN
  ;; TODO: figure out plot scaling.  Once imagemagick hack is here:
  ;;       https://github.com/syl20bnr/spacemacs/issues/8770
  ;;       Emacs w/ imagemagick: https://github.com/m-parashar/emax64
  ;;       but choco might have it already.
  ;;       See C-h v system-configuration-features  and
  ;;           C-h v system-configuration-options
  ;;       I isntalled emax64 and its plots looked the same.  I ran
  ;; (image-type-available-p 'imagemagick) and got 'nil, just as will
  ;; the other programs.  What am I missing?
  ;;       But this post: https://emacs.stackexchange.com/questions/26205/elisp-resize-displayed-images-programmatically
  ;;       expects non-nil from: (image-type-available-p 'imagemagick)
  ;;       and that's what I see in choco
  ;; TODO: PASSWORD: until I can get rid of this, my jupyter pasword is: hearty
  ;; TODO: use new EIN plot scaling code in some kind of autoload function
  ;;       ein:pytools-matplotlib-dpi-correction (requires %matplotlib
  ;; inline call before it will work)
  ;;       (see
  ;; https://github.com/millejoh/emacs-ipython-notebook/issues/625)
  ;;       ein:pytools-set-figure-dpi',ein:pytools-set-matplotlib-parameter
  ;;       (https://github.com/millejoh/emacs-ipython-notebook/pull/627)
  ;;       maybe these two other calls work before %matplotlib inline is called?

  ;; seems to be only for Jupyter-non-lab notebooks, and I couldn't
  ;;get it started last time I tried it.  Comment it out until I need it.
  ;;
  ;; (use-package ein
  ;;   :defer t
  ;;   :init
  ;;   ;; So outshine or highlight-indent-guides on prog-mode-hook don't break inline plots
  ;;   (setq ein:polymode t) ;; Get right mode e.g. elpy in cells (fails in :config)
  ;;   :commands (ein:notebooklist-open))

  ;; ;; temporary hack to get rid of notebook save error
  ;; ;; https://github.com/millejoh/emacs-ipython-notebook/issues/623
  ;; (defun request--goto-next-body (&optional noerror)
  ;;   (re-search-forward "^[\r\n|\n]" nil noerror))
  )

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

;; ** Version Control: emacs vc and git

(eval-after-load "vc-hooks"
  '(define-key vc-prefix-map "=" 'vc-ediff)) ; so C-x v = will use
                                        ; ediff

;; From: https://github.com/escherize/prelude-dotemacs/blob/master/personal.el
(use-package git-link
  :config
  ;; (add-to-list 'git-link-remote-alist
  ;;              '("github\\.threatbuild\\.com" git-link-github))
  ;; (setq git-link-default-branch "master")
  (global-set-key (kbd "C-c g l") 'git-link))

;; ** R language

;; COMMENT OUT ALL ESS CONFIG SO THAT VINCENT GOULET EMACS DOESN'T CONFLICT
;; WITH IT.
;; (use-package ess
;;   :defer t ; avoid long init during emacs startup
;;   :config
;;   (setq ess-ask-for-ess-directory nil)
;;   (setq ess-local-process-name "R")

;;   ;; SO NOTE: a bug makes this not work when R isn't already started:
;;   ;; error is: "> Error: unexpected '>' in ">"
;;   (defun my-ess-start-R ()
;;     (interactive)
;;     (if (not (member "*R*" (mapcar (function buffer-name) (buffer-list))))
;;         (progn
;;           (delete-other-windows)
;;           (setq w1 (selected-window))
;;           (setq w1name (buffer-name))
;;           (setq w2 (split-window w1 nil t))
;;           (R)
;;           (set-window-buffer w2 "*R*")
;;           (set-window-buffer w1 w1name))))

;;   ;; almost works, but doesn't switch to R buffer like similar R func in C-ret
;;   (defun my-ess-eval ()
;;     (interactive)
;;     (my-ess-start-R)
;;     (if (and transient-mark-mode mark-active)
;;         (call-interactively 'ess-eval-region)
;;       (call-interactively 'ess-eval-buffer)))
;;   (add-hook 'ess-mode-hook
;;             '(lambda()
;;                (local-set-key [(shift return)] 'my-ess-eval)))
;;                ;; but flycheck does nothing if I vist an R file.  Need to do some extra config?
;; ;;               (flycheck-mode t)))

;;   (add-hook 'inferior-ess-mode-hook
;;             '(lambda()
;;                ;; Make up/down arrows search cmd history like tcsh
;;                (define-key inferior-ess-mode-map [up]
;;                  'comint-previous-matching-input-from-input)
;;                (define-key inferior-ess-mode-map [down]
;;                  'comint-next-matching-input-from-input)))

;;   ;; ESS autocomplete support
;;   ;; http://ess.r-project.org/Manual/ess.html#Auto_002dcomplete
;;   ;; setup will take too much time?
;;   (setq ess-use-auto-complete 'script-only))

;; (use-package ess-R-data-view :after ess)
;; (use-package ess-smart-equals :after ess)
;; (use-package ess-smart-underscore :after ess)
;; (use-package ess-view :after ess)

;; ** Ruby
(add-hook 'ruby-mode-hook
	  (lambda ()
	    (set (make-local-variable 'compile-command)
		 (format "ruby -cw %s"
			 (file-name-nondirectory buffer-file-name)))))

;; ** C#

;; I'm not using C# an
;;
;; (use-package csharp-mode :defer t)
;; (use-package omnisharp
;;   :defer t
;;   :after (csharp-mode company)
;;   :init
;;   ;; Inspired by: https://github.com/OmniSharp/omnisharp-emacs
;;   (defun my-csharp-mode-setup ()
;;     (omnisharp-mode)
;;     (company-mode)
;;     (flycheck-mode)
;;     (setq c-syntactic-indentation t)
;;     (c-set-style "ellemtel")
;;     (electric-pair-local-mode 1) ;; Emacs 25
;;     (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
;;     (local-set-key (kbd "C-c C-c") 'recompile))
;;
;;   (add-hook 'csharp-mode-hook 'my-csharp-mode-setup t))
;;
;; ;; maybe this can go inside of use-package ominsharp?
;; (eval-after-load
;;     'company
;;   '(add-to-list 'company-backends #'company-omnisharp))

;; ** YAML

(use-package yaml-mode
  :mode ("\\.yml$" "\\.dvc$")) ;; data version control (DVC) files

;; ** Mermaid

;; from: https://github.com/alexpeits/emacs.d
(use-package mermaid-mode
  :ensure t
  :mode (("\\.mmd\\'" . mermaid-mode)
         ("\\.mermaid\\'" . mermaid-mode)))

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

;; auto-complete gets in way of company python autocomplete
;;
;; does this make org-mode slower?  If so, disable it like this: http://stackoverflow.com/questions/24814988/emacs-disable-auto-complete-in-python-mode
;; (use-package auto-complete
;;   :defer 0
;;   :diminish auto-complete-mode
;;   :diminish global-auto-complete-mode
;;   :diminish auto-complete-minor-mode
;;   :config (global-auto-complete-mode))

;; syntax checkers for many languages
;; To use flycheck for over 40 languages, do this:
;;   (global-flycheck-mode)

;; Set flycheck python path: must do this for after conda to it
;; pythonbin points to the conda python, and not the default
;; non-working Windows python3
;; BUT THIS fails, still gets windows python, as of 5/17/22
(setq pythonbin (sdo/find-exec "python" "Needed by autofix-on-save, REPL, flycheck, elpy & py-python"))
;; this didn't help.  How could it fail??
;;(setq pythonbin "c:/Users/scott/miniconda3/python.exe")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-hscroll-mode 'current-line)
 '(aw-background t)
 '(bibtex-completion-pdf-open-function 'helm-open-file-with-default-tool)
 '(blink-cursor-mode nil)
 '(c-basic-offset 2)
 '(c-default-style
   '((c-mode . "stroustrup")
     (c++-mode . "stroustrup")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(calendar-week-start-day 1)
 '(citar-file-open-functions
   '(("html" . citar-file-open-external)
     ("pdf" . citar-file-open-external)
     (t . find-file)))
 '(column-number-mode t)
 '(conda-anaconda-home conda-env-home-directory)
 '(counsel-grep-base-command "grep -nEi '%s' %s")
 '(counsel-search-engine 'google)
 '(delete-selection-mode nil)
 '(dired-auto-revert-buffer t)
 '(dired-dwim-target t)
 '(display-time-24hr-format t)
 '(display-time-default-load-average nil)
 '(display-time-load-average-threshold 100000000)
 '(display-time-mode t)
 '(ediff-keep-variants nil)
 '(ediff-split-window-function 'split-window-horizontally)
 '(enable-recursive-minibuffers t)
 '(ess-ido-flex-matching t)
 '(ess-language "R" t)
 '(ess-own-style-list
   '((ess-indent-level . 2)
     (ess-continued-statement-offset . 2)
     (ess-brace-offset . 0)
     (ess-expression-offset . 2)
     (ess-else-offset . 0)
     (ess-brace-imaginary-offset . 0)
     (ess-continued-brace-offset . 0)
     (ess-arg-function-offset . 2)
     (ess-arg-function-offset-new-line . 2)
     (ess-close-brace-offset . 0)))
 '(ess-ps-viewer-pref "gv")
 '(ess-style 'OWN)
 '(flycheck-python-pycompile-executable pythonbin)
 '(flyspell-duplicate-distance 0)
 '(focus-follows-mouse t)
 '(gdb-many-windows t)
 '(gud-chdir-before-run t)
 '(gud-pdb-command-name "python -m pdb")
 '(gud-tooltip-echo-area t)
 '(gud-tooltip-mode t)
 '(help-enable-symbol-autoload t)
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries nil)
 '(indicate-empty-lines t)
 '(load-home-init-file t t)
 '(load-prefer-newer t)
 '(matlab-comment-column 0)
 '(matlab-comment-region-s "% ")
 '(matlab-cont-level 2)
 '(matlab-fill-strings-flag 0)
 '(matlab-indent-function-body nil)
 '(matlab-indent-level 2)
 '(minibuffer-depth-indicate-mode t)
 '(mode-line-format
   '(("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification "   " mode-line-buffer-identification mode-line-position
      (vc-mode vc-mode)
      "  " :exec conda-env-current-name "   " mode-line-modes "  " mode-line-misc-info mode-line-end-spaces)))
 '(mouse-autoselect-window 0.5)
 '(mouse-avoidance-nudge-dist 10)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount '(1 ((shift) p\. 1) ((control))))
 '(mouse-wheel-tilt-scroll t)
 '(neo-reset-size-on-open t)
 '(neo-window-fixed-size nil)
 '(next-error-message-highlight 'keep)
 '(org-confirm-shell-links 'y-or-n-p)
 '(org-ctrl-k-protect-subtree 'error)
 '(org-cycle-include-plain-lists 'integrate)
 '(org-directory "~/")
 '(org-ellipsis "…")
 '(org-export-backends '(ascii beamer html latex odt org))
 '(org-export-with-broken-links 'mark)
 '(org-fontify-done-headline t)
 '(org-fontify-emphasized-text t)
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-latex-pdf-process '("latexmk -pdf -output-directory=%o -f %f"))
 '(org-link-from-user-regexp nil)
 '(org-list-allow-alphabetical t)
 '(org-list-empty-line-terminates-plain-lists t)
 '(org-modules
   '(ol-bibtex ol-info org-inlinetask org-mouse ol-eshell ol-man org-mouse org-protocol))
 '(org-noter-auto-save-last-location t)
 '(org-noter-doc-property-in-notes t)
 '(org-occur-case-fold-search ''smart)
 '(org-odd-levels-only t)
 '(org-outline-path-complete-in-steps nil)
 '(org-pretty-entities nil)
 '(org-refile-targets '((nil :maxlevel . 6)))
 '(org-roam-db-update-method 'idle-timer)
 '(org-roam-file-completion-tag-position 'append)
 '(org-roam-file-exclude-regexp '("data/" "logseq/"))
 '(org-special-ctrl-k nil)
 '(org-speed-commands-user '(("s" . narrow-or-widen-dwim)))
 '(org-startup-align-all-tables t)
 '(org-startup-indented nil)
 '(org-startup-truncated t)
 '(org-table-header-line-p t)
 '(org-use-speed-commands t)
 '(org-yank-adjusted-subtrees t)
 '(package-check-signature 'allow-unsigned)
 '(paradox-automatically-star t)
 '(paradox-execute-asynchronously t)
 '(paradox-github-token "0c7c1507250926e3124c250ae6afbc8f677b9a61")
 '(paren-message-truncate-lines nil)
 '(recentf-max-menu-items 60)
 '(recentf-max-saved-items 200)
 '(recentf-mode t)
 '(replace-char-fold t)
 '(require-final-newline nil)
 '(safe-local-variable-values
   '((org-todo-keyword-faces
      ("ACCEPTED" . "green")
      ("TRY" . "red")
      ("REJECTED" . "gray"))))
 '(save-interprogram-paste-before-kill t)
 '(scroll-bar-mode 'right)
 '(scroll-step 1)
 '(search-default-mode 'char-fold-to-regexp)
 '(send-mail-function 'mailclient-send-it)
 '(show-paren-mode t)
 '(sml/mode-width 10)
 '(sml/modified-char "•")
 '(sml/name-width 30)
 '(sml/position-percentage-format nil)
 '(sml/prefix-face-list
   '((":SU:" sml/sudo)
     (":G" sml/git)
     (sml/projectile-replacement-format sml/projectile)
     ("" sml/prefix)))
 '(sml/prefix-regexp nil)
 '(sml/replacer-regexp-list nil)
 '(sml/shorten-directory t)
 '(sml/show-file-name nil)
 '(sml/vc-mode-show-backend nil)
 '(tool-bar-mode nil)
 '(use-short-answers t)
 '(visual-line-fringe-indicators '(nil top-right-angle))
 '(w32-use-w32-font-dialog nil)
 '(warning-suppress-log-types '((use-package) (:warning)))
 '(warning-suppress-types '((comp) (:warning)))
 '(window-divider-default-places t)
 '(window-divider-mode t))

(use-package flycheck
  :defer t
  :after conda  ;; sets python path
  :config
  (eval-after-load "flycheck-mode" '(diminish 'flycheck-mode)))
(diminish 'flycheck-mode) ;; only works outside of use-package flycheck

(use-package flycheck-pos-tip :after flycheck)

;; Make interpreter shells do arrow prev/last matching, like linux
;; shells.  I think this will be overwritten by some modes
;; e.g. gud-debugger, inferior-python-mode, and RSS, which have their own maps in this emacs
;; file. 
(define-key comint-mode-map [up]
  'comint-previous-matching-input-from-input)
(define-key comint-mode-map [down]
  'comint-next-matching-input-from-input)

;; *** Ediff

;; Do not pop up a separate window "frame" for ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; Avoid folding headlines when ediffing org-mode
;; from: https://emacs.stackexchange.com/questions/21335/prevent-folding-org-files-opened-by-ediff
(add-hook 'ediff-prepare-buffer-hook #'outline-show-all)

;; Restore window configuration after ediff quits
;; https://emacs.stackexchange.com/questions/7482/restoring-windows-and-layout-after-an-ediff-session
(defvar my-ediff-last-windows nil)

(defun my-store-pre-ediff-winconfig ()
  (setq my-ediff-last-windows (current-window-configuration)))

(defun my-restore-pre-ediff-winconfig ()
  (set-window-configuration my-ediff-last-windows))

(add-hook 'ediff-before-setup-hook #'my-store-pre-ediff-winconfig)
(add-hook 'ediff-quit-hook #'my-restore-pre-ediff-winconfig)

;; *** Outshine: org-mode like headlines in programming and other modes
(use-package outshine
  :custom
  (outshine-org-style-global-cycling-at-bob-p t)
  (outshine-use-speed-commands t)
  :hook ((outline-minor-mode . outshine-mode) ; for outshine itself
         (prog-mode . outline-minor-mode))    ; all prog modes

  :diminish outline-mode
  :diminish outline-minor-mode
  :config
  (eval-after-load "outshine" '(diminish 'outshine-mode)) 
  ;; works here
  (bind-keys
   :map outline-minor-mode-map
   ("<backtab>" . outshine-cycle-buffer))) ;Global cycle using S-TAB

;; *** Vertical indent lines in programming modes

;; seems like this isn't needed if you have highlight-indent-guides
;; https://github.com/DarthFennec/highlight-indent-guides#alternatives
;; (use-package highlight-indentation
;;   :diminish highlight-indentation-mode) ; indicator: ||

;; TODO: this doesn't work anymore
(use-package highlight-indent-guides
  :diminish highlight-indent-guides-mode ;; indicator: h-i-g (works here)
  :config
  (setq highlight-indent-guides-method 'character) ; nicest, thinnest lines
  :hook (prog-mode-hook . highlight-indent-guides))

;; *** Debuggers
;; **** realgud
;; Has  a semi-GUI in emacs: https://github.com/realgud/realgud
;; best docs I can find: https://github.com/realgud/realgud
;; middle mouse shows variable
;;  (in tooltip if M-x gud-tooltip-mode )
;; M-x gud-goto-info brings up gud docs

;; Lines below would be impoortant if I knew how to start gdb or readgud:gdb
;; (sdo/find-exec "gdb" "Needed for debugging: pacman -Ss gdb")
;; (sdo/find-exec "gcc" "gdb needs libstdc (& others?) from gcc: pacman -Ss gcc")

;; Line below would be important if I understood what ipdb was good for
;;(use-package realgud-ipdb)

(use-package realgud
  :defer t
  :config
  (load-library "realgud") ; avoid M-x load-library on every startup
  (add-hook 'gud-mode-hook
	    #'(lambda ()
                ;; conflicts w/ other home bindings...
	        (local-set-key [home]   ; move to beginning of line, after prompt
			       'comint-bol)
	        (local-set-key [up]     ; cycle backward through command history
			       #'(lambda () (interactive)
			           (if (comint-after-pmark-p)
				       (comint-previous-input 1)
				     (previous-line 1))))
	        (local-set-key [down]    ; cycle forward through command history
			       #'(lambda () (interactive)
			           (if (comint-after-pmark-p)
				       (comint-next-input 1)
				     (forward-line 1))))))
  :commands (realgud:gdb
             realgud:ipdb
             realgud:pdb))

;; realgud author's color customizations:  I'm not sure I see a
;; difference, probably because of the ansi term thing I've never been
;; able to figure out.
;; https://github.com/realgud/realgud/wiki/Customizing-Colors
(defface term-color-darkgreen
  '((t :foreground "DarkGreen" :background "DarkGreen"))
  "Face used to render dark green color code."
  :group 'term)

(defface term-color-cadetblue
  '((t :foreground "CadetBlue" :background "CadetBAlue"))
  "Face used to render dark cadet blue color code."
  :group 'term)

(defface term-color-purple
  '((t :foreground "Purple" :background "Purple"))
  "Face used to render dark Purple color code."
  :group 'term)

(defface term-color-darkgoldenrod
  '((t :foreground "Darkgoldenrod" :background "Darkgoldenrod"))
  "Face used to render dark Darkgoldenrod color code."
  :group 'term)

(defface term-color-ivory4
  '((t :foreground "Ivory4" :background "Ivory4"))
  "Face used to render dark Ivory4 color code."
  :group 'term)

(setq ansi-term-color-vector
      [term
       term-color-black
       term-color-red
       term-color-darkgreen
       term-color-cadetblue
       term-color-blue
       term-color-purple
       term-color-darkgoldenrod
       term-color-ivory4])

;; * Presentations


;; From System Crafters: https://systemcrafters.net/emacs-tips/presentations-with-org-present/
;; I think it expects more of the full setup, here (which isn't copied below):
;; The final configuration:
;; https://systemcrafters.net/emacs-tips/presentations-with-org-present/

(defun dw/org-present-prepare-slide ()
  (org-overview)
  (org-show-entry)
  (org-show-children))

(defun dw/org-present-hook ()
  (setq-local face-remapping-alist '((default (:height 1.5) variable-pitch)
                                     (header-line (:height 4.5) variable-pitch)
                                     (org-code (:height 1.55) org-code)
                                     (org-verbatim (:height 1.55) org-verbatim)
                                     (org-block (:height 1.25) org-block)
                                     (org-block-begin-line (:height 0.7) org-block)))
  (setq header-line-format " ")
  (org-display-inline-images)
  (dw/org-present-prepare-slide))

(defun dw/org-present-quit-hook ()
  (setq-local face-remapping-alist '((default variable-pitch default)))
  (setq header-line-format nil)
  (org-present-small)
  (org-remove-inline-images))

(defun dw/org-present-prev ()
  (interactive)
  (org-present-prev)
  (dw/org-present-prepare-slide))

(defun dw/org-present-next ()
  (interactive)
  (org-present-next)
  (dw/org-present-prepare-slide))

(use-package org-present
  :bind (:map org-present-mode-keymap
         ("C-c C-j" . dw/org-present-next)
         ("C-c C-k" . dw/org-present-prev))
  :hook ((org-present-mode . dw/org-present-hook)
         (org-present-mode-quit . dw/org-present-quit-hook)))

;; As-is, you can't control what headline level is the slide you switch to/from, so not useful.  But maybe there's a configuration?

;; ;; https://www.omarpolo.com/dots/emacs.html
;; (use-package org-tree-slide
;;   :custom ((org-image-actual-width nil))
;;   :config
;;   (defun op/org-present-frame ()
;;     (let ((frame (make-frame `( ;(minibuffer . nil)
;;                                (title . "Presentation")
;;                                (menu-bar-lines . 0)
;;                                (tool-bar-lines . 0)
;;                                (vertical-scroll-bars . nil)
;;                                (left-fringe . 0)
;;                                (right-fringe . 0)
;;                                (internal-border-width . 10)
;;                                ;(cursor-type . nil)
;;                                ))))
;;       (select-frame-set-input-focus frame)
;;       (toggle-frame-fullscreen)
;;       (raise-frame frame)
;;       frame))
;;
;;   (defun op/org-present ()
;;     (interactive)
;;     (let ((name "*presentazione*"))
;;       (ignore-errors
;;         (kill-buffer name))
;;       ;; (with-current-buffer (make-indirect-buffer (current-buffer)
;;       ;;                                            name))
;;       (op/org-present-frame)
;;       (org-display-inline-images)
;;       (olivetti-mode)
;;       (olivetti-set-width 90)
;;       (call-interactively #'org-tree-slide-mode)
;;       (text-scale-adjust 3))))

;; had problems w/ bullets, seemed mainly a screen magnifier and cursor hider
;; https://systemcrafters.net/emacs-tips/presentations-with-org-present/
(use-package org-present)
;;
;; https://github.com/dholm/dotemacs/blob/master/.emacs.d/lisp/modes/org.el
  ;; (use-package org-present
  ;;   :config
  ;;   (with-eval-after-load 'org-present
  ;;     (add-hook 'org-present-mode-hook
  ;;               (lambda ()
  ;;                 (org-present-big)
  ;;                 (org-display-inline-images)
  ;;                 (org-present-hide-cursor)
  ;;                 (org-present-read-only)))
  ;;     (add-hook 'org-present-mode-quit-hook
  ;;               (lambda ()
  ;;                 (org-present-small)
  ;;                 (org-remove-inline-images)
  ;;                 (org-present-show-cursor)
  ;;                 (org-present-read-write)))))

;; * Writing Tools
;; ** General Editing

(setq next-line-add-newlines nil) ; don't create newlines for arrows @ buff end
;; use spaces instead of tabs so other programs see indentation correctly
(setq-default indent-tabs-mode nil)

;; handy gnu things which for some reason are disabled by default
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(defun insert-date-string ()  "Insert a nicely formated date string."
       (interactive)
       (insert (format-time-string "%Y-%m-%d")))
(global-set-key (kbd "C-c d") 'insert-date-string)

(add-hook 'text-mode-hook
	  #'(lambda ()
	      (set (make-local-variable 'dabbrev-case-fold-search) t)
	      (set (make-local-variable 'dabbrev-case-replace) t)))

;; ** Word counting
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

;; ** flyspell

;; from: https://github.com/gicmo/dot-emacs/blob/master/init.el
;;       http://www.nextpoint.se/?p=656
;;
;; windows hunspell is more "modern" but I can't make it save to personal dict
;; my bug report:
;;       https://github.com/d12frosted/flyspell-correct/issues/97#issuecomment-923047599
;; Emacs Elements advice for Windows huspell, says aspell is painful
;;       in Windows.  I haven't looked at this, may be worthwhile:
;; https://github.com/revrari/emacs_elements_chapter_2/blob/main/installing-emacs-windows.md
;;
;; (setq hunspell_bin (sdo/find-exec "hunspell" "Needed by ispell and flyspell."))
;; (setq hunspell_dict_dir (expand-file-name "~/.hunspell"))
;; (use-package flyspell
;;   :init
;;   (setenv "DICPATH" hunspell_dict_dir)
;;   :custom
;;   (flyspell-issue-message-flag nil)
;;   (flyspell-issue-welcome-flag nil)
;;   (ispell-program-name hunspell_bin)
;;   ;; (ispell-extra-args '("-i utf-8 -p en_US"))
;;   (ispell-dictionary "english")
;;   (ispell-silently-savep t)
;;   :config
;;   (setq ispell-really-hunspell t
;; 	;; ispell-extra-args '("-i" "utf-8")
;; 	ispell-local-dictionary-alist
;; 	'(("deutsch"
;; 	   "[A-Za-zöäüß]" "[^A-Za-zöäüß]" "[']" nil
;; 	   ("-d" "de_DE_frami" "-p" hunspell_dict_dir)
;; 	   nil utf-8)
;; 	  ("english"
;; 	   "[A-Za-z]" "[^A-Za-z]" "[']" nil
;; 	   ("-d" "en_US" "-p" hunspell_dict_dir)
;; 	   nil utf-8))
;;         ispell-dictionary-alist ispell-local-dictionary-alist
;;         ispell-hunspell-dictionary-alist ispell-dictionary-alist))


;; aspell config started from https://github.com/d12frosted/flyspell-correct/issues/97#issuecomment-923047599
(setq aspell_bin (sdo/find-exec "aspell" "Needed by ispell and flyspell."))
(use-package ispell
  :defer t
  :custom
  (flyspell-issue-message-flag nil)
  (flyspell-issue-welcome-flag nil)
  (ispell-program-name aspell_bin)
  (ispell-dictionary "english")
  (ispell-silently-savep t)
  :config
  (when (equal (file-name-base ispell-program-name) "aspell")
    ;; 'normal' is 2X slower than 'ultra' but is OK
    ;; http://aspell.net/man-html/Notes-on-the-Different-Suggestion-Modes.html#Notes-on-the-Different-Suggestion-Modes
    (add-to-list 'ispell-extra-args "--sug-mode=normal")))

(use-package flyspell
  :defer t
  :diminish flyspell-mode )

;; https://github.com/d12frosted/flyspell-correct
;; fails if you don't have ispell installed (or aspell or hunspell?)
;; hunspell expects dictionaries in ~/.hunspell (see howto.org)
(use-package flyspell-correct
  :after flyspell
  ;; comment out unless specifically want to use ivy
  ;; :custom
  ;; (flyspell-correct-interface 'flyspell-correct-ivy)
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))

;; ** writegood
(use-package writegood-mode :defer t)

(defun sdo/reading-scores (&optional start end)
  "Flesch-Kincaid reading grade level and ease.  This is a merged version of the scoring functions 'writegood-grade-level and 'writegood-reading-ease."
  (interactive)
  (let* ((params (writegood-fk-parameters start end))
         (sentences (nth 0 params))
         (words     (nth 1 params))
         (syllables (nth 2 params))
         (ease-score     (+ (* 0.39 (/ words sentences)) (* 11.8 (/ syllables words)) -15.59))
         (grade-score (- 206.835 (* 1.015 (/ words sentences)) (* 84.6 (/ syllables words)))))
    (message "Grade %.2f: Ease: %.2f (%s)" grade-score
             ease-score (writegood-reading-ease-score->comment ease-score))))

;; ** toggle writing tools
;; flyspell and writegood both highlight duplicated words; use the
;; flyspell face b/c it only highlights the duplicated workd
;; writegood faces
;;   writegood-weasels-face
;;   writegood-passive-voice-face
;;   writegood-duplicates-face
;; flyspell faces
;;   flyspell-duplicate-face
;;   flyspell-incorrect-face

;; TODO turn on/off visual line mode
(defun toggle-writing-tools ()
  "Enable/disable writing and proofing tools"
  (interactive)
  ;; why don't these modes turn off when this function is called twice?  They do when called individually and interactively
  (call-interactively 'flyspell-mode)
  (call-interactively 'writegood-mode))
(global-set-key (kbd "C-c W") 'toggle-writing-tools)

;; ** markdown

;; https://jblevins.org/projects/markdown-mode/
;; https://codeberg.org/takeonrules/dotemacs/src/branch/main/emacs.d/configuration.org
(use-package markdown-mode
  :hook ((markdown-mode . turn-on-visual-line-mode))
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))


;; ** Latex

(sdo/find-exec "latexmk"
               "For org-mode Latex pdfs. TexLive doesn't install it by default")

;; Hack: (use-package auctex) doesn;t work because, "once installed, auctex overrides the tex package":
;; http://cachestocaches.com/2015/8/getting-started-use-package/
;;(use-package tex :defer t :straight auctex) ; a hack for auctex
;;(use-package auctex-latexmk :defer t)

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (define-key LaTeX-mode-map "\C-xn"
	      nil)))

;; ** Citations
;; SEE ALSO: org-ref

(defun add-bibitem-org ()
  "Opens main .bib file (was energy.bib) in one window and main .org (was energytop.org) in the other, 
so you can add a reference to either or both.  
When done, can undo the window config with winner-mode: C-c Left"
  (interactive)
  (delete-other-windows)
  (find-file bibfile_energytop_fnm)
  (split-window-horizontally)
  (other-window 1)
  (find-file bibfile_energy_fnm))

;; ** pdfgrep
;; can't install Windows binary, although could on MacOS
;; (use-package pdfgrep
;;   :straight (:host github :repo "jeremy-compostella/pdfgrep")
;;   )

;; * Shrink garbage collection @ end of init

;; Threshold was made huge @ init beginning for fast startup time. Shrink it here, so emacs doesn't get giant when after running for a while
;; (https://youtu.be/9i_9hse_Y08?t=3066)
(setq gc-cons-threshold (* 2 1000 1000))  

;; * Variables Set By Emacs's built-in Customization Interface 
;; ** Custom Set Variables

;; custom set variables used to be here but emacs moved them and keeps
;; them moved.  TODO: move them back.

;; ** Custom Set Faces

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "red" :weight bold))))
 '(consult-file ((t (:inherit swiper-match-face-2))))
 '(consult-preview-cursor ((t (:inherit swiper-match-face-2))))
 '(consult-preview-line ((t (:inherit swiper-line-face :extend t))))
 '(consult-preview-match ((t (:inherit swiper-match-face-2))))
 '(corfu-bar ((t (:inherit swiper-line-face))))
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
 '(flyspell-duplicate ((t (:foreground "black" :strike-through t :underline "firebrick1"))))
 '(flyspell-incorrect ((t (:foreground "black" :underline (:color "firebrick" :style wave)))))
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
 '(orderless-match-face-0 ((t (:inherit swiper-match-face-2 :weight bold))))
 '(orderless-match-face-1 ((t (:inherit swiper-match-face-3))))
 '(orderless-match-face-2 ((t (:inherit swiper-match-face-4 :weight bold))))
 '(orderless-match-face-3 ((t (:inherit swiper-match-face-1 :weight bold))))
 '(org-code ((t (:inherit black :inverse-video nil :weight bold :family "Courier New"))))
 '(org-done ((t (:foreground "Gray" :weight bold))))
 '(org-done-face ((t (:foreground "gray" :weight bold))))
 '(org-drawer ((t (:foreground "snow3"))))
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
 '(org-roam-link ((t (:foreground "dark goldenrod"))))
 '(org-table ((t (:background "honeydew1" :foreground "gray0"))))
 '(org-tag ((nil (:foreground "dark green" :slant italic :weight bold))))
 '(org-target ((t (:foreground "dark slate blue" :weight bold))))
 '(org-todo ((t (:foreground "Firebrick" :weight normal))))
 '(org-verbatim ((t (:inherit shadow :weight bold))))
 '(org-warning ((t (:foreground "firebrick" :weight normal))))
 '(region ((t (:background "LightSteelBlue1"))))
 '(sml/modified ((t (:inherit sml/not-modified :foreground "firebrick" :weight bold))))
 '(swiper-match-face-3 ((t (:inherit popup-isearch-match))))
 '(table-cell-face ((t (:background "honeydew1" :foreground "black" :inverse-video nil))))
 '(vertico-current ((t (:inherit swiper-line-face))))
 '(vertico-group-separator ((t (:inherit green :strike-through t))))
 '(vertico-group-title ((t (:inherit red :slant italic))))
 '(vertico-multiline ((t (:inherit violet))))
 '(writegood-duplicates-face ((t (:foreground "black" :strike-through t :underline "firebrick1"))))
 '(writegood-passive-voice-face ((t (:foreground "LightBlue4" :underline t :weight bold))))
 '(writegood-weasels-face ((t (:foreground "dark khaki" :underline t :weight bold)))))

(put 'narrow-to-region 'disabled nil)
