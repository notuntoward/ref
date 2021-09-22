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
;; ** straight.el

;; Requires git 
;; https://github.com/raxod502/straight.el#features
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
;; (use-package docker :straight t)
(straight-use-package 'use-package)

;; make straight the default (for now, it's org-roam only)
;; https://github.com/raxod502/straight.el/blob/0946e1b14886e05973fb88ff18ccd90a8c8a25a4/README.md#integration-with-use-package
;; (setq straight-use-package-by-default t)

;; ** package.el
;; Avoid complaints, put before (require 'package)
;; https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; use package.el at least for getting a list of archives
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t) 
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; TODO: Do I need separate org archive?  Boots faster if I remove it?
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(unless (package-installed-p 'use-package) ; so can do a totally clean start
  (message "Installing use-package, diminish and refreshing")
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'diminish)) ; wouldn't install w/ use-package for some reason

;; from: http://cachestocaches.com/2015/8/getting-started-use-package/
(eval-when-compile
  (require 'use-package))

(use-package bind-key) ; use inside use-package, invoke with :bind-key

(setq use-package-always-ensure t) ; so use-package always installs missing pkgs

(use-package try) ; M-x try to test a pkg w/o installing it

;; ** elpa gpg key error workaround
;; Just these things skip elpa 27.1 gpg key error:
;;
;; Install gnupg package w/ choco.  Seems that was using gpg program
;; in windows git, and this was mixing up windows/linux paths
;;
;; This updates some keyring thing
;; https://www.reddit.com/r/emacs/comments/d9rchm/emacs_archivecontentssig_not_verifying/
(use-package gnu-elpa-keyring-update)

;; ** paradox package interface
;; updated package interface.  Start with M-x paradox-list-packages
;; TODO: paradox modeline faces aren't visible when window is in use
;; (i.e. the modeline background is dark blue)
;; can customize paradox-modeline-face (try M-x paradox-customize)
;; but other modelines are automatically inverted when the modeline is
;; darkened.  Is that controlled by installed pkg: smart-mode-line ?

(use-package paradox
  :defer 1
  :custom
  (paradox-enable))

;; |----------+---------------------------------------|
;; | Shortcut | Description                           |
;; |----------+---------------------------------------|
;; | v        | Visit the package's homepage          |
;; | l        | View a list of recent commits         |
;; | f r      | filters by regexp (occur);            |
;; | f u      | display only packages with upgrades;  |
;; | f k      | filters by keyword (emacs 24.4 only). |
;; | f c      | clear filters                         |
;; | h        | See all keys                          |
;; | s        | Star/unstar package                   |
;; | g        | Refresh package list                  |
;; |----------+---------------------------------------|

;; * Emacs Speed Test

;; Find out what's slowing down emacs start by running M-x esup
(use-package esup)

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
  ("macbook-pro.local"     ; Geli MacBook Pro
   (progn (setq shareDir "/Users/scott/OneDrive/share")))
  ("desktop-6bq3kmf" ; Surface Pro
   (setq shareDir "C:/Users/scott/OneDrive/share"))
  ("desktop-qegmu0d" ; Surface Book 2
   (setq shareDir "C:/Users/scott/OneDrive/share"))
  ("desktop-rvtj6ua" ; Surface Go
   (setq shareDir "C:/Users/scott/OneDrive/share"))
  (progn (warn "Can't assign shareDir for unknown computer: %s" computerNm)
	 (setq shareDir (concat "unknown_computer_" computerNm "_shareDir")))
  )
;; Dad's computers: Desktop-2L6G237 (Surface), Desktop-IOS9UTJ (Compaq) 


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

;; this does something every time window size changes (not just frames
;; but windows inside of it)

;; from: https://www.reddit.com/r/emacs/comments/dpc2aj/readjusting_fontsize_according_to_monitor/
;; (defun hoagie-adjust-font-size (frame)
;;   (message "window size change event"))
;; (add-hook 'window-size-change-functions #'hoagie-adjust-font-size)
;; is dispwatch a better alternative?

;; dispwatch calls you if the current display (monitor?) configuration changes.
;;https://github.com/mnp/dispwatch

;; Didn't work
;; (defun set-fonts-per-dpi ()
;;   ;; change font height approriately for display DPI
;;   (let* ((dpi (dpi-avg))
;;          (fontHeightThis
;;           (cond
;;            ((< dpi 110) 100)
;;            ((< dpi 130) 100)
;;            ((< dpi 160) 100)
;;            (t 100))))
;; ;;       (fontHeightThis (round (/ 20480 dpiThis))))

;;     ;; Emacs font height is a fixed physical height in real world: 10 * points (https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html)
;;     ;; so DPI shouldn't matter, then, right?
;;     ;; 1 point: a fixed 1/72" = 0.353mm (https://en.wikipedia.org/wiki/Point_(typography))
;;     (message "Setting font of display with dpi=%s to height %s" dpi fontHeightThis)
;;     ;; advice from: https://protesilaos.com/codelog/2020-09-05-emacs-note-mixed-font-heights/
;;     (set-face-attribute 'default nil :font "Consolas" :height fontHeightThis)
;;     (set-face-attribute 'fixed-pitch nil :family "Consolas" :height 1.0)
;;     (set-face-attribute 'variable-pitch nil :family "Georgia" :height 1.0)))
  
;; (add-hook 'after-init-hook #'set-fonts-per-dpi)
;; (add-hook 'after-make-frame-functions #'set-fonts-per-dpi)
;; (defun my-display-changed-hook (disp)
;;   (message "Changed to display of size %s" disp)
;;   (set-fonts-per-dpi)) 

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

;; do something similar with functions that clone to frames or
;; whatever?
;; could entirely replace function, like this: (define-key
;; special-event-map [iconify-frame] 'my-frame-action)
;; (https://emacs.stackexchange.com/a/64616/14273)

;; centers every new frame, including the initial one using
;; (after-init-hook  and 'after-make-frame-functions.  I could change
;; fonts instead.
;;
;; https://christiantietze.de/posts/2021/06/emacs-center-window-single-function/

;; different font per window; if a buffer moves to, say, a buffer with
;; a big font, then all windows containint that buffer will get big
;; (in this idea):
;; https://emacs.stackexchange.com/a/13263/14273

;; function that shrinks frame text font if frame width gets less than
;; 76 chars
;; https://blog.patshead.com/2016/04/emacs-automatically-adjust-font-size-when-frame-width-changes.html

;; 4 ways to name fonts in emacs.  In Windows, only the form
;; "fontname[-fontsize]" is supported.  So do always use that so it's multiplatform.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html

;; default-text-scale package (I have/use) sets all fonts on all
;; frames and new ones made thereafter:
;; https://github.com/purcell/default-text-scale

;; (display-monitor-attributes-list &optional DISPLAY) omitting
;; DISPLAY gives you selected (active?) frame's monitor properties.
;; Or, you can give it a DISPLAY argument
;; https://emacs.stackexchange.com/questions/60707/how-to-get-the-display-dimensions-of-the-display-emacs-is-in

;; Emacs's idea of a  “Display” is the total available space, while
;; “monitor” is a single (display) device, like one Dell monitor.
;; display-monitor-attributes-list. That shows information for all
;; monitors known to the system; frame-monitor-attributes, that limits
;; the information to the monitor of the current Emacs frame. Has code
;; to center a frame in a monitor.  Also works on MacOS, which has
;; some kind of menu offsetting:
;; https://christiantietze.de/posts/2021/06/emacs-center-window-on-current-monitor/

;; (display-pixel-width)
;; (display-pixel-height)
;; return "display" size in pixels
;; https://stackoverflow.com/questions/2151449/can-i-detect-the-display-size-resolution-in-emacs

;; vague advice for detecting if a frame moves to a different frame.
;; Guy says he's implemented it but doesn't give code
;; https://emacs.stackexchange.com/questions/22513/is-there-a-way-to-detect-change-of-monitor-in-emacs-elisp

;; setting default frame size but is this obsoleted by the
;; default-font package I'm using now?
;; https://emacs.stackexchange.com/questions/7583/transiently-adjust-text-size-in-mode-line-and-minibuffer

;; recommended way to change all font sizes (when they have mixed sizes): change fonts in proportion to a change in the default font
;; https://protesilaos.com/codelog/2020-09-05-emacs-note-mixed-font-heights/
;; Font size adjustment


(defun calcDivNpix ()
  "Computes # pix for window divider based on screen DPI.
TODO: make this a general function."

  ;; (let* ((nPixHigh 6.0)    ; Home monior (Dell 4K)
  ;;       (DPIhigh   185.0)
  (let* ((nPixHigh 6.0)    ; Surface Pro / SB2: dpi = 267 / 260
         (DPIhigh   267)
         (nPixLow   3.0)    ; CPR monitor
         (DPIlow    94.0)
         DPIthis nPixThis)

    (setq DPIthis (dpi-avg))
    (message "DPIthis %s" DPIthis)
    (setq nPixThis (max 1 (round (+ (* (/ (- nPixHigh nPixLow) (- DPIhigh DPIlow)) (- DPIthis DPIlow)) nPixLow))))))

;; (defun set-default-font-per-dpi ()
;;   "Sets the default font appropriately for the screen DPI"

;;     (setq DPIthis (dpi-avg))
;;     (message "DPIthis %s" DPIthis)

;;     (default-text-scale-increment 50) ; about right for Dell 27"
    
;;     (defun my-preferred-font-increment ()
;;       (let ( (dpi (dpi-avg)) )
;;         (cond
;;          ((< dpi 110) 10)
;;          ((< dpi 130) 11)
;;          ((< dpi 130) 50)
;;          (t 12))))
;;
;; (defvar my-preferred-font-increment (my-preferred-font-increment)))

;; default-text-scale-increment.el
;; increments all frames
;;

;; didn't work
;; (defun change-font-size-pixels (size)
;;   "Change font size (clearly `:pixels` in `face-attribute`) to given SIZE."

;;   (interactive
;;    (list
;;     (read-number
;;      (format "Input font size (current=%d pix): " (face-attribute 'default :pixels))
;;      nil)))
 
;;   (set-face-attribute 'default nil :pixels size)
;; )

(if window-system
    (progn
      ;; middle mouse click on url starts browser in every file
      (when (fboundp 'goto-address) (add-hook 'find-file-hooks 'goto-address))
      (define-key global-map [S-down-mouse-3] 'imenu)

      ;; TODO: put this inside of set-fonts-per-dpi ()
      
      ;; Set window dividers (mouse grab lines for moving window boundaries)
      (setq nPixDiv (calcDivNpix))
      (message "nPixDiv: %s" nPixDiv)
      ;; setq said to best best way, even though this is customizable
      (setq window-divider-default-right-width nPixDiv)
      ;; bottom hard to mouse on SP; hack is to add a pixel (TODO: improve)
      (setq window-divider-default-bottom-width (+ nPixDiv 1))

      ;; TODO also set pixel width of scrollbars, etc
      ;; TODO Use dispwatch, https://github.com/mnp/dispwatch, to change these things dynamically
      ;;      Also:
      ;; https://emacs.stackexchange.com/questions/28390/quickly-adjusting-text-to-dpi-changes
      ;; Scroll bar width/height
      ;; (set-window-scroll-bars nil 11 t) ; set current WINDOW
      ;;(setq-default scroll-bar-width 50) ; default or all new windows and
      ;;frames
      ;; (modify-all-frames-parameters ) should change them all
      ;; (message "%s" (frame-parameters)) prints frame params
      ;;
      ;; need to change both initial and default params:
      ;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Emacs-ignores-frame-parameters.html

      ;; TODO change font too?
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

;; * Window/Frame Config, Desktop Save and Restore
;; ** Window resizing

;; https://github.com/dpsutton/resize-window
(use-package resize-window) ; put in hydra below

;; ** Adjusting Window Orientation
(use-package transpose-frame ; tons of functions; this one is most general
  :config (global-set-key (kbd "C-|")  'rotate-frame-clockwise))

(winner-mode 1) ; Undo window config: C-c left; Redo window config: C-c right

;; ** Attempts at saving desktop
;; *** Burly

;; Seems promising, but I can't get it to work.  If I save a burly
;; bookmark and then try to open it wtth burly-open-bookmark, I get an
;; error:  window--state-put-2: Wrong type argument: stringp, nil
;; Also, Zamansky has a video showing that you can persist burly
;; bookmarks to a file, but I don't see it on the official burly page:
;; https://github.com/alphapapa/burly.el/blob/master/README.org
;;
;; TODO: come back to this later

;; ;; from: https://github.com/tompurl/dot-emacs/blob/master/emacs-init.org
;; (unless (package-installed-p 'quelpa)
;;   (with-temp-buffer
;;     (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
;;     (eval-buffer)
;;     (quelpa-self-upgrade)))

;; ;;…and let’s integrate it with use-package:

;; (quelpa
;;  '(quelpa-use-package
;;    :fetcher git
;;    :url "https://github.com/quelpa/quelpa-use-package.git"))
;; (require 'quelpa-use-package)

;; (use-package async) ;; SO: below needs this

;; (use-package burly
;;   :quelpa (burly :fetcher github :repo "alphapapa/burly.el"))

;; ;; from https://github.com/torgeir/.emacs.d
;; (use-package burly
;;   :straight 
;; ;;  :straight nil
;;   :commands (burly-bookmark-windows burly-open-bookmark burly-open-url)
;;   :load-path "site-lisp/burly")

;; *** Perspectives for emacs
;; ;; From: https://github.com/andresilva/emacs.d/blob/master/init.el

;; ;; Use one folder for all save/history/cache files (more than persp-mode uses it)
;; (defconst !/savefile-dir (expand-file-name "savefile" user-emacs-directory))
;; (unless (file-exists-p !/savefile-dir)
;;   (make-directory !/savefile-dir))


;; ;; https://github.com/Bad-ptr/persp-mode.el  
;; (use-package persp-mode
;;   :ensure t
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

;; I don't think I ever got perspectives to work
;; ** Make a new *scratch* buffer right after killing it

;; From: https://www.emacswiki.org/emacs/RecreateScratchBuffer
;; If the *scratch* buffer is killed, recreate it automatically
;; FROM: Morten Welind
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

;; *** Moom Frame Resize

;; https://github.com/takaxp/moom
(use-package moom
  :diminish moom-mode
  :config
  (setq moom-verbose t)
  (setq moom-use-font-module nil)
  (setq moom-user-margin '(0 0 0 0)) ;; FYI, the default value is '(0 0 0 0), not t
  (add-hook 'moom-before-fill-screen-hook #'moom-move-frame)
  (moom-mode 1)
  ;;(setq moom-user-margin '(0 0 16 0))
  ;; (moom-mode)
  )

(setq moom--height-maximized nil) ; state for height max toggle

(defun sdo/moom-toggle-frame-height-maximized ()
  "Toggle frame height maximized.  This almost works but doesn't"
  (interactive)
  (let ((moom--print-status nil))
    (if (setq moom--height-maximized (not moom--height-maximized))
        (progn
          (moom--save-last-status)
          (moom-fill-height)
          (toggle-frame-fullscreen)
          (toggle-frame-fullscreen))
      (moom-restore-last-status)))
  (moom-print-status))

;; 
       
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

;; *** My Frame Resize doodling (for reference, commented out)

;; ;; set frame position
;; (setq frame-resize-pixelwise t)
;; (set-frame-position (selected-frame) 0 0)

;; ;; set frame size
;; (set-frame-size (selected-frame) 1024 600 t)

;; ;; get frame size
;; (frame-pixel-height)
;; (frame-pixel-width)

;; (set-frame-height (selected-frame) (frame-pixel-width) 600 t)

;; (toggle-frame-fullscreen)

;; (display-height-pix)

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
(global-set-key (kbd "C-M-=") 'global-display-line-numbers-mode) ; toggles all

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
(setq windmove-wrap-around t ) ; wrap windows around edge, like torus space

;; TODO: remove these bindings in favor of hyra?
;; Overwrites org keys I don't use (are inhibited in org setup)
(global-set-key (kbd "<C-up>")     'windmove-up)
(global-set-key (kbd "<C-down>")   'windmove-down)
(global-set-key (kbd "<C-left>")   'windmove-left)
(global-set-key (kbd "<C-right>")  'windmove-right)

;; Window movement, since windmove mappings above are overwritten in elpy
;; https://www.reddit.com/r/emacs/comments/7evidd/windmove_shortcuts/
;; TODO: is which-key good enough for this?  Only thing is how to keep
;; it going until done, as hydra does it with _SPC_
;; TODO: shrink some more and put a bunch of other window functions on
;; this hydra?  Maybe frames, buffers, ...
;; TODO compare w/ ace-window and hydr: https://www.youtube.com/watch?v=_qZliI1BKzI
(use-package hydra) ; s/ probably put some hydra defs inside of it, or this inside of ivy
(defhydra hydra-window (:color pink :hint nil :timeout 20)
  "
     Move          Swap          Resize        Split
╭─────────────────────────────────────────────────────────┐
      U            C-U             M-U         [v]ertical
      ▲             ▲               ▲          [h]orizontal
 L ◀   ▶ R   C-L ◀   ▶ C-R   M-L ◀   ▶ M-R    [s]ensibly
      ▼             ▼               ▼          ╭──────────┐
      D            C-D             M-D          quit : [q]
"
  ("<left>" windmove-left)
  ("<down>" windmove-down)
  ("<up>" windmove-up)
  ("<right>" windmove-right)
  ("h" split-window-below)
  ("v" split-window-right)
  ("s" (split-window-sensibly))
  ("M-<up>" hydra-move-splitter-up) 
  ("M-<down>" hydra-move-splitter-down)
  ("M-<left>" hydra-move-splitter-left)
  ("M-<right>" hydra-move-splitter-right)
  ("C-<up>" buf-move-up)
  ("C-<down>" buf-move-down)
  ("C-<left>" buf-move-left)
  ("C-<right>" buf-move-right)
  ("q" nil))

(global-set-key (kbd "C-x w") 'hydra-window/body)

;; splitter funcs from: https://github.com/abo-abo/hydra/blob/master/hydra-examples.el
(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

;; A different use for C-x w: works pretty well but does less than
;; hydra above (could add all those keys, though)
;; https://www.reddit.com/r/emacs/comments/7evidd/windmove_shortcuts/
;; (defun windmove-prefix ()
;;   (interactive)
;;   (set-transient-map
;;    (let ((map (make-sparse-keymap)))
;;      (define-key map (kbd "<left>") 'windmove-left)
;;      (define-key map (kbd "<right>") 'windmove-right)
;;      (define-key map (kbd "<up>") 'windmove-up)
;;      (define-key map (kbd "<down>") 'windmove-down) map)
;;    t))

;; (define-key (current-global-map) (kbd "C-x w") 'windmove-prefix)

;; *** Window move forward/back
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

;; smart-region is similar (worse?) and I was running out of key bindings
;;(use-package smart-region ; smart region selection expand
;;:init (global-set-key (kbd "C--") 'smart-region)) ; C-x toggles to start/end

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

;; *** crux (a mix of movement and other stuff)
(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
         ("M-'" . crux-duplicate-and-comment-current-line-or-region)
         ("C-c R" . crux-rename-file-and-buffer)
         ("C-k" . crux-kill-and-join-forward)))

;; * Buffer Handling
;; ** Buffer naming

;; Renames buffers containing same file names, different dirs
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p 1)

;; save C-c n for org-roam
;;(global-set-key "n" 'rename-buffer) ; TODO does this work?

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

;; ** Indirect Buffer Cloning

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

;; ;; from: https://emacs.stackexchange.com/a/2915/14273
;; (defun maybe-delete-frame-buffer (frame)
;;   "When a dedicated FRAME is deleted, also kill its buffer.
;; A dedicated frame contains a single window whose buffer is not
;; displayed anywhere else."
;;   (let ((windows (window-list frame)))
;;     (when (eq 1 (length windows))
;;       (let ((buffer (window-buffer (car windows))))
;;         (when (eq 1 (length (get-buffer-window-list buffer nil t)))
;;           (kill-buffer buffer))))))

;; ;; bind to C-x 0 (maybe this is too unexpected?)
;; (add-to-list 'delete-frame-functions #'maybe-delete-frame-buffer)

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



;; ** Recursive minibuffers

;; Allows you to open a minubuffer when already in one.  Not sure when
;; this is useful  -- maybe when gettting multiple files loaded?  Is
;; used in
;; https://github.com/nobiot/Zero-to-Emacs-and-Org-roam/blob/main/40.Qol.md
;;
;; I've enabled this by customizing enable-recursive-minibuffers  and minibuffer-depth-indicate-mode


;; * File Finding / Opening

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
(defun sdo/popdir (dir)
  "Like unix popd.  Return parent directory of dir."
  (unless (equal "/" dir)
    (file-name-directory (directory-file-name dir))))

(if (setq pacbin (sdo/find-exec "pacman" "Need MSYS2 for pdf-tools & more"))
    (progn
      (use-package pdf-tools
        :config
        ;; Ensure mingw64 libraries on front of PATH, not other tools' libs
        ;; https://github.com/politza/pdf-tools#compilation-and-installation-on-windows
        (setq msys2dir (sdo/popdir (sdo/popdir (sdo/popdir pacbin))))
        (setq msys2libdir (expand-file-name "mingw64\\bin" msys2dir))
        (setenv "PATH" (concat msys2libdir ";" (getenv "PATH")))
        ;; initialise (will download and build msys2 libs too, I think)
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

        ;; Keybindings: https://github.com/politza/pdf-tools
        ;; - M-g l x: is "go to page number x", also M-g g
        ;; - B, N: history-back and history-forward
        ;; - M-s o: pdf-occur is nice, has same mapping as <occur>
        ;; - Copy rectangular images (equations, graphs):
        ;;   select w/ M-mouse, then (C-c TAB) or (right-mouse & "create image")
        ))
  (message "Can't find msys2 not installed so skipping pdf-tools init"))

;; ** Dired Mode
;; *** Generic Dired and Win32 integration

;; REMINDER: in dired, type "W" on a file to open w/ Windows default
;; application (Firefox for .html, emacs for .org, ...)

;; TODO: when I do this, dired-subtree doesn't work.  Figure out why, fix.
;; So dired puts folders at top.  The discovered ls program must
;; handle GNU switches (e.g. OSX doesn't)
;;(setq insert-directory-program (sdo/find-exec "ls" "For dired folder ordering"))
;;(setq dired-listing-switches "-laGh1v --group-directories-first")
;;(setq dired-listing-switches "-laGh1v")
;;(setq ls-lisp-dirs-first t) ; for Windows, when runs lisp ls by default
(add-hook  'dired-mode-hook
	   (lambda ()
             (dired-hide-details-mode) ; less junk.  ')' restores orig format
             ;; make dired search case insensitive (default is case sensitive)
	     (setq case-fold-search t)
             ;; override for dired, in which this is annoying, for some reason
	     (define-key dired-mode-map (kbd "C-x C-f") 'find-file)))

;; so that dired automatically updates stale directory list when buffer revisted
(setq dired-no-confirm `(revert-subdirs))
;; I want to do these w/o interrupting emacs prompts
(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)

;; *** Dired subtree and project explorer

;; From: https://mads-hartmann.com/2016/05/12/emacs-tree-view.html
;; TODO: consider using whole dired-subtree package, or dired-filter
;; TODO: add the code for projectile/project explorer

;; (defun sdo/dwim-toggle-or-open ()
;;   "Toggle subtree or open the file.  Do nothing on '.'; on '..', go up"
;;   (interactive)
;;   (if (file-directory-p (dired-get-file-for-visit))
;;       (let ((dir-at-point (file-name-nondirectory(dired-get-filename nil t))))
;;         (if (string= dir-at-point "..")
;;             (dired-find-file) ;; go up a dir
;;           (if (not (string= dir-at-point ".")) ;; do nothing if on '.'
;;               (progn
;;                 (dired-subtree-toggle)
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

;; TODO: Click both toggles directory and opens in a new dired window.  Get rid of the open.
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
        ("<enter>" . dired-find-file)
        ("<return>" . dired-find-file)
        ("<tab>" . mhj/dwim-toggle-or-open)
        ("<down-mouse-1>" . mhj/mouse-dwim-to-toggle-or-open))
  :config
  (progn
    ;; Function to customize the line prefixes (I simply indent the lines a bit)
    (setq dired-subtree-line-prefix (lambda (depth) (make-string (* 2 depth) ?\s)))
    (setq dired-subtree-use-backgrounds nil)))

;; My "Bugfixed" version of the function in dired-subtree.el
;; Mabye it's not fixing anything: See my bug report:
;;   https://github.com/Fuco1/dired-hacks/issues/164
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
;; is somewhat redundant w/ just doing swiper search of dired buffer
;; also see: narrow-or-widen-dwim
(use-package dired-narrow
  :ensure t
  :bind (:map dired-mode-map ("/" . dired-narrow)))

;; *** Better org-links from dired

;; From:
;; https://emacs.stackexchange.com/questions/13093/get-org-link-to-insert-link-description-automatically
(defun my//dired-store-link (orig-fun &rest args)
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
(advice-add 'org-store-link :around #'my//dired-store-link)


;; *** Open current file from dired using default OS program

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

(define-key dired-mode-map [(shift return)] 'xah-open-in-external-app)

;; ** BROKEN Open current file's folder in default OS finder e.g. Windows Explorer

;; Works both in dired and in an ordinary buffer visiting some file
;;
;; ONLY WORKS IF PATH HAS NO SPACES
;;
(defun xah-show-in-desktop ()
  "Show current file in desktop.
 (Mac Finder, Windows Explorer, Linux file manager)
This command can be called when in a file buffer or in `dired'.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2020-11-20 2021-01-18"
  (interactive)
  (let (($path (if (buffer-file-name) (buffer-file-name) default-directory)))
    (cond
     ((string-equal system-type "windows-nt")
      (message (format "PowerShell -Command Start-Process Explorer -FilePath %s" (shell-quote-argument default-directory)))
      (shell-command (format "PowerShell -Command Start-Process Explorer -FilePath %s" (shell-quote-argument default-directory)))
      ;; todo. need to make window highlight the file
      )
     ((string-equal system-type "darwin")
      (if (eq major-mode 'dired-mode)
          (let (($files (dired-get-marked-files )))
            (if (eq (length $files) 0)
                (shell-command (concat "open " (shell-quote-argument (expand-file-name default-directory ))))
              (shell-command (concat "open -R " (shell-quote-argument (car (dired-get-marked-files )))))))
        (shell-command
         (concat "open -R " (shell-quote-argument $path)))))

     ((string-equal system-type "gnu/linux")
      (let (
            (process-connection-type nil)
            (openFileProgram (if (file-exists-p "/usr/bin/gvfs-open")
                                 "/usr/bin/gvfs-open"
                               "/usr/bin/xdg-open")))
        (start-process "" nil openFileProgram (shell-quote-argument $path)))
      ;; (shell-command "xdg-open .") ;; 2013-02-10 this sometimes froze emacs till the folder is closed. eg with nautilus
      ))))

;; overwrites built-in set-fill-column
;;(global-set-key (kbd "C-x F") 'xah-show-in-desktop)

;; ** Find-file and URL
;;
;; find-file is currently overwritten by ido, which is a pain about pasting in full file paths.  Kludge is to type c-f c-f so orig find-file is called, which handles full-paths fine.
;;
;; But ivy just handles it.
;; https://emacs.stackexchange.com/questions/18128/quickly-open-file-by-full-path-in-clipboard
;;
;; TODO: I would like to use ivy but functions below use
;;find-file-other-window and find-file-other-frame, which have no ivy
;;analogs.  Also, I like ido's grid mode (ivy-explorer is a grid-like option,
;;but it's become buggy and unsupported)

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

(global-set-key (kbd "C-x C-r") 'sdo/find-recentf)
(global-set-key (kbd "C-x 4 r") 'sdo/find-recentf-other-window) ; like find-file
(global-set-key (kbd "C-x 5 r") 'sdo/find-recentf-other-frame)

;; ** Find recent directories
;; From: http://pragmaticemacs.com/emacs/open-a-recent-directory-in-dired-revisited
;; And:  http://stackoverflow.com/questions/23328037/in-emacs-how-to-maintain-a-list-of-recent-directories
;; Alternative: M-x crux-recentf-find-directory
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

;; Emacs binding conventions: https://www.emacswiki.org/emacs/ChoosingKeysToBind
;; M-x describe-personal-keybindings to see what keys you have bound, although this is only keys you've bound in use-package.
;;
;; See what keys are unbound. To see what's left on e.g. C-c type 'p'
;; and then the chars "C-c". Don't type the keycombo "C-c"
(use-package free-keys)

(global-set-key [f1] 'revert-buffer)
(global-set-key [f2] 'vc-dir)
(global-set-key [f3] 'ediff-files)
(global-set-key [f4] 'indent-buffer)
;; (use-package igrep
;;   :config
;;   (setq igrep-options "-i") ; -n is default for igrep
;;   (global-set-key [f5] 'igrep)
;;   (global-set-key [f6] 'igrep-find))
;; deadgrep, counsel-rg, etc. if ripgrep installed, else 'lgrep (see above)
;; (global-set-key [f5] 'lgrep)
(global-set-key [f6] 'rgrep)
(global-set-key [f7] 'clear-buffer)
(global-set-key [f8] 'compile)
(global-set-key [f9] 'align-equals)
;; f10 reserved for remote desktop (vnc, thinlink, etc.)
;;(global-set-key [f11] 'shell) (make OS-dependent, above)
(global-set-key [f12] 'repeat-complex-command)

;; emacs 27.1 has some gpg change.  I think I fixed this on the SP but
;; not on the GO.  Skip this for now since I don't use it anyway.
;;
;; ;; ** CSV mode

;; ;; aligns columns (on: C-c C-a , off: C-c C-u), prints header, etc.
;; ;; Need to toggle-truncate-lines (C-c w) for wide files
;; (use-package csv-mode
;;   :ensure t
;;   :config
;;   (setq csv-align-padding 2)
;;
;; ;; From: https://tinyurl.com/trtrmau
;; (defun csv-align-visible ()
;;   "Align only visible entries in csv-mode. C-c C-a is already bound to align all fields, but is slow."
;;   (interactive)
;;   (csv-align-fields nil
;;    (window-start (selected-window))
;;    (window-end (selected-window)))
;;   (message "Aligned visible fields only. Press C-c C-w to align again."))

;; :bind (:map csv-mode-map
;;             ("C-c C-w" . 'csv-align-visible)
;;             ("C-c C-h" . csv-header-line))
;; ;; 1st page only, must redo 
;; :hook (csv-mode . csv-align-visible) 
;; ;; show header: bad for long colnames, narrow colvals
;; :hook (csv-mode . csv-header-line)
;; ;; doesn't seem to work
;; :hook (csv-mode . toggle-truncate-lines)) 

;; * Version Control

;; magit-section needed for org-roam-bibtex at least.  But it's getting it from straight.el or melpa if installed that way.
;; (use-package magit
;; ;;  :bind (("C-x g" . magit-status))
;;   :config
;;   ;; seems to bring up the 2 panel ediff instead of standard 3 panel
;;   ;; 2vs3 panel discussion:
;;   ;; https://github.com/magit/magit/issues/1743
;;   ;; However one of the panels ("index") is read-only
;;   (setq magit-ediff-dwim-show-on-hunks t))

;; * Programming Modes
;; ** Matlab mode

;; Got errors about obsolete code when I first installed this in packages. Note that abo-abo says that this package is no longer maintained (but did he mean THIS package or is THIS package actually his package? the 'matlab' package below is 'matlab-emacs' in sourceforge).  Anyway, abo-abo has a new matlab package, maybe worth trying.

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

;; Get rid of message "Package cl is deprecated".
(setq byte-compile-warnings '(cl-functions))

;; (https://github.com/kiwanami/emacs-epc/issues/35)
;; cl is obsolete and shouldn't be used anymore:
;; (https://github.com/kiwanami/emacs-epc/issues/35)
;; Running 
;;   (require 'loadhist)
;;  (file-dependents (feature-file 'cl))
;; shows that the following still depend upon clib
;; ("c:/Users/scott/.emacs.d/elpa/omnisharp-20201002.1600/omnisharp.elc" "c:/Users/scott/.emacs.d/elpa/writegood-mode-20180525.1343/writegood-mode.el" "c:/Users/scott/.emacs.d/elpa/org-plus-contrib-20201102/org-choose.elc")

(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (set (make-local-variable 'dabbrev-case-fold-search) nil)
	     (set (make-local-variable 'dabbrev-case-replace) nil)))

;; Rename elisp symbols:
;; C-c C-v r : Rename symbol in current buffer. Resolve let binding as long as i can.
;; Other bindings: https://github.com/mhayashi1120/Emacs-erefactor
;; As of 11/5/20, the elpa version causes a compile warning.  Fix is
;; to manually edit: ./elpa/erefactor-20200513.1252/erefactor.el:922,
;; replacing preceding-sexp with elisp--preceding-sexp, then
;; recompiling.
;; My erefactor issue: https://github.com/mhayashi1120/Emacs-erefactor/issues/5
(use-package erefactor
  :defer t
  :init
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (define-key emacs-lisp-mode-map "\C-c\C-v" erefactor-map)))

  ;; TODO do this
  ;;And set these variables correctly: erefactor-lint-path-alist, erefactor-lint-by-emacsen
  ;; Highlight local variables: DOES THIS DO ANYTHING?  Need paths above?
  (add-hook 'emacs-lisp-mode-hook 'erefactor-lazy-highlight-turn-on)
  (add-hook 'lisp-interaction-mode-hook 'erefactor-lazy-highlight-turn-on))

;; ** C/C++
;; note: connect to common hook used by new cc-mode
(add-hook 'c-mode-common-hook
	  '(lambda ()
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
  :config
  (define-key cscope-list-entry-keymap "q" 'quit-window)) ; so quits like dired

;; ** Python

;; *Python* buffer doesn't start at home.  I tried conda updata --all
;; *and also the hack below, but now, instead of an error message, the
;; **Python* buffer opens but is frozen when I run, for example,
;; *sutil.py from elpy (C-u C-c C-c).  But in a conda terminal, I can
;; *start "jupyter console" so I'm not sure what's going on.

;; hack:
;; *https://stackoverflow.com/questions/59631663/jupyter-console-fails-to-start-but-jupyter-notebook-is-fine

;; *** Python editing setup

;; TODO: some of my calls to sdo/find-exec may no longer be necessary,
;; as elpy now downloads its own python environement with some of
;; these already in it.  I should see which of these I can remove.

;; To activate a non-hardcoded env, run:
;; M-x conda-env-activate

;; (when (setq conda_exe (sdo/find-exec "thisIsNotThere" "Needed for most python packages"))

(when (setq conda_exe (sdo/find-exec "conda" "Needed for most python packages"))
  (use-package conda
    :ensure t
    :config
    (setq conda-env-home-directory (expand-file-name
                                    (concat (file-name-directory conda_exe)
                                            "..")))
    (custom-set-variables
     '(conda-anaconda-home conda-env-home-directory))
    
    (conda-env-initialize-interactive-shells)
    (conda-env-initialize-eshell)
    (conda-env-activate "base")
    
    ;; Use if projects have environments files indicating their conda envs
    ;;(setq conda-project-env-name "environment.yml") ; needed by autoactivate
    ;;(conda-env-autoactivate-mode t)
    ;;conda environment is set on the modeline in custom variables
    )

  (setq autopep8bin (sdo/find-exec "autopep8" "Needed by py-autopep8 autofix-on-save & elpy"))
  (when autopep8bin (use-package py-autopep8))

  ;; So C-c i generates a python function/method stub from symbol at point
  ;; (use-package elpygen ; seems to be separate from elpy, despite the name
  ;;   :config
  ;;   (define-key python-mode-map (kbd "C-c i") 'elpygen-implement))

  ;; for Python mode comment filling
  ;; https://stackoverflow.com/questions/2214199/how-to-use-emacs-to-write-comments-with-proper-indentation-line-length-and-wra
  (require 'newcomment)
  (add-hook 'python-mode-hook (progn
                                (setq comment-auto-fill-only-comments 1)
                                (setq-default auto-fill-function 'do-auto-fill)))

  (diminish 'auto-fill-function) ; only works here, for some reason

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

  (defun sdo/run-python-clean-as-possible ()
    "If region is active, then call elpy-shell-send-region-or-buffer-and-go; otherwise, save current buffer and run its contents in new *Python* console, killing any existing console; "
    (interactive)
    (unless (region-active-p)
      (save-buffer)
      (sdo/kill-python-console))
    (elpy-shell-send-region-or-buffer-and-go t))
  
  (use-package elpy
    :defer t
    :diminish elpy-mode
    ;; Bind global "make" key to "C-u the command below" This runs
    ;; the region or whole .py buffer in a (possibly newly made) *Python*
    ;; console buffer, and then moves the cursor there.
    :bind ("<f8>" . (lambda () (interactive) (elpy-shell-send-region-or-buffer-and-go t)))
    :bind ("<S-f8>" . sdo/run-python-clean-as-possible)
    :bind ("<M-f8>" . (lambda () (interactive) (realgud:pdb))) ; :ipdb, :trepan, :gdb ?
    :init
    (elpy-enable)
    ;; jupyter recommended over ipython (how s/ this work w/ conda env switch?):
    ;; https://elpy.readthedocs.io/en/latest/ide.html#interpreter-setup
    ;; conda install -c anaconda jupyter_console 
    (sdo/find-exec "jupyter-console" "Elpy is set up to use this")
    (setq python-shell-interpreter "jupyter"
          python-shell-interpreter-args "console --simple-prompt"
          python-shell-prompt-detect-failure-warning nil)
    (add-to-list 'python-shell-completion-native-disabled-interpreters
                 "jupyter")

    ;; use flycheck, not elpy's flymake
    ;; (https://realpython.com/blog/python/emacs-the-best-python-editor/
    ;;  https://elpy.readthedocs.io/en/latest/customization_tips.html)
    ;; I don't think I'm seeing much flycheck output
    (if (require 'flycheck nil t)
        (progn (message "found emacs flycheck package")
               (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
               (add-hook 'elpy-mode-hook 'flycheck-mode)
               (flycheck-pos-tip-mode)
               (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
               )
      (warn "elpy didn't find flycheck emacs package"))

    ;; Enable emacs 26 flymake indicators in an otherwise light
    ;; modeline
    ;; https://elpy.readthedocs.io/en/latest/customization_tips.html
    (setq elpy-remove-modeline-lighter t)
    (advice-add 'elpy-modules-remove-modeline-lighter
                :around (lambda (fun &rest args)
                          (unless (eq (car args) 'flymake-mode)
                            (apply fun args))))

    ;; Better "M-.":
    ;; https://elpy.readthedocs.io/en/latest/customization_tips.html
    (defun elpy-goto-definition-or-rgrep ()
      "Go to the definition of the symbol at point, if found. Otherwise, run `elpy-rgrep-symbol'."
      (interactive)
      (ring-insert find-tag-marker-ring (point-marker))
      (condition-case nil (elpy-goto-definition)
        (error (elpy-rgrep-symbol
                (concat "\\(def\\|class\\)\s" (thing-at-point 'symbol) "(")))))
    (define-key elpy-mode-map (kbd "M-.") 'elpy-goto-definition-or-rgrep)

    ;; Enable full font locking of inputs in the python shell
    ;; https://elpy.readthedocs.io/en/latest/customization_tips.html
    ;; I can't see that this does anything
    (advice-add 'elpy-shell--insert-and-font-lock
                :around (lambda (f string face &optional no-font-lock)
                          (if (not (eq face 'comint-highlight-input))
                              (funcall f string face no-font-lock)
                            (funcall f string face t)
                            (python-shell-font-lock-post-command-hook))))

    (advice-add 'comint-send-input
                :around (lambda (f &rest args)
                          (if (eq major-mode 'inferior-python-mode)
                              (cl-letf ((g (symbol-function 'add-text-properties))
                                        ((symbol-function 'add-text-properties)
                                         (lambda (start end properties &optional object)
                                           (unless (eq (nth 3 properties) 'comint-highlight-input)
                                             (funcall g start end properties object)))))
                                (apply f args))
                            (apply f args))))    

    ;; code tidy when save
    (if autopep8bin
        (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
    
    ;; Undo ely's override of C-arrowkeys
    ;; https://github.com/jorgenschaefer/elpy/issues/1188
    (eval-after-load "elpy"
      '(cl-dolist (key '("C-<up>" "C-<down>" "C-<left>" "C-<right>"))
         (define-key elpy-mode-map (kbd key) nil)))
    )

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

  (use-package ein
    :ensure t
    :init
    ;; So outshine or highlight-indent-guides on prog-mode-hook don't break inline plots
    (setq ein:polymode t) ;; Get right mode e.g. elpy in cells (fails in :config)
    :commands (ein:notebooklist-open))

  ;; temporary hack to get rid of notebook save error
  ;; https://github.com/millejoh/emacs-ipython-notebook/issues/623
  (defun request--goto-next-body (&optional noerror)
    (re-search-forward "^[\r\n|\n]" nil noerror))
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

;; ** VC source code control (also see "Org and Git")

(eval-after-load "vc-hooks"
  '(define-key vc-prefix-map "=" 'vc-ediff)) ; so C-x v = will use ediff

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

;; ** elisp programming and dot emacs

(defun dot-emacs-diff (p)
  "Ediff ~/.emacs with ref/.emacs.  When done, can undo the window config with winner-mode: C-c Left"
  (interactive "p")
  (ediff-files "~/.emacs"
               (expand-file-name ".emacs" docDir)))

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

;; Note that I've remapped er\iedit to iedit-within-defun

;; syntax checkers for many languages
;; To use flycheck for over 40 languages, do this:
;;   (global-flycheck-mode)

;; Set flycheck python path: must do this for after conda to it
;; pythonbin points to the conda python, and not the default non-working Windows python3
(setq pythonbin (sdo/find-exec "python" "Needed by autofix-on-save, REPL, flycheck, elpy & py-python"))
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
 '(column-number-mode t)
 '(conda-anaconda-home conda-env-home-directory)
 '(counsel-grep-base-command "grep -nEi '%s' %s")
 '(counsel-search-engine 'google)
 '(delete-selection-mode nil)
 '(dired-dwim-target t)
 '(display-time-24hr-format t)
 '(display-time-default-load-average nil)
 '(display-time-load-average-threshold 100000000)
 '(display-time-mode t)
 '(ediff-keep-variants nil)
 '(ediff-split-window-function 'split-window-horizontally)
 '(elpy-rpc-python-command "python")
 '(elpy-shell-display-buffer-after-send t)
 '(elpy-shell-starting-directory 'current-directory)
 '(emacsw32-style-frame-title t)
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
 '(flyspell-correct-interface 'flyspell-correct-ivy)
 '(flyspell-duplicate-distance 0)
 '(flyspell-issue-message-flag nil)
 '(flyspell-issue-welcome-flag nil)
 '(focus-follows-mouse t)
 '(gdb-many-windows t)
 '(gud-chdir-before-run t)
 '(gud-pdb-command-name "python -m pdb")
 '(gud-tooltip-echo-area t)
 '(gud-tooltip-mode t)
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
 '(minibuffer-depth-indicate-mode t)
 '(mode-line-format
   '(("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification "   " mode-line-buffer-identification mode-line-position
      (vc-mode vc-mode)
      "  " :exec conda-env-current-name "   " mode-line-modes "  " mode-line-misc-info mode-line-end-spaces)))
 '(moom-use-font-module nil)
 '(mouse-autoselect-window 0.5)
 '(mouse-avoidance-nudge-dist 10)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount '(1 ((shift) p\. 1) ((control))))
 '(mouse-wheel-tilt-scroll t)
 '(neo-reset-size-on-open t)
 '(neo-window-fixed-size nil)
 '(org-agenda-files
   '("~/OneDrivef/energytop.org" "~/OneDrive/ref/DOE_brainstorm/20200605152244-test0.org" "c:/Users/scott/OneDrive/ref/tmp.org"))
 '(org-confirm-shell-links 'y-or-n-p)
 '(org-ctrl-k-protect-subtree 'error)
 '(org-cycle-include-plain-lists 'integrate)
 '(org-directory "~/")
 '(org-ellipsis "…")
 '(org-export-backends '(ascii html latex odt org confluence freemind s5))
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
   '(ol-bibtex ol-info org-inlinetask org-mouse ol-eshell org-annotate-file ol-bookmark org-choose ol-elisp-symbol org-mac-link ol-man org-track org-mouse org-protocol org-choose))
 '(org-noter-auto-save-last-location t)
 '(org-noter-doc-property-in-notes t)
 '(org-occur-case-fold-search ''smart)
 '(org-odd-levels-only t)
 '(org-outline-path-complete-in-steps nil)
 '(org-pretty-entities nil)
 '(org-refile-targets '((nil :maxlevel . 6)))
 '(org-roam-completion-system 'ivy)
 '(org-roam-db-update-method 'idle-timer)
 '(org-roam-file-completion-tag-position 'append)
 '(org-special-ctrl-k nil)
 '(org-speed-commands-user '(("s" . narrow-or-widen-dwim)))
 '(org-startup-align-all-tables t)
 '(org-startup-indented nil)
 '(org-startup-truncated t)
 '(org-superstar-cycle-headline-bullets nil)
 '(org-superstar-headline-bullets-list '("●" "￭" "￮" "►" "•" "□" "▸" "▫" "▹"))
 '(org-superstar-item-bullet-alist '((42 . 10043) (43 . 10011) (45 . 9644)))
 '(org-superstar-special-todo-items t)
 '(org-superstar-todo-bullet-alist '(("TODO" . 9646) ("DONE" . 9647)))
 '(org-table-header-line-p t)
 '(org-use-speed-commands t)
 '(org-yank-adjusted-subtrees t)
 '(outshine-org-style-global-cycling-at-bob-p t)
 '(outshine-use-speed-commands t)
 '(package-check-signature 'allow-unsigned)
 '(package-selected-packages
   '(smart-mode-line conda org-superstar moom resize-window frame-fns quelpa-use-package frame-cmds recursive-narrow ivy-todo ivy-explorer counsel ivy-bibtex org-ref unfill xterm-color org-noter org-plus-contrib realgud highlight-indent-guides org-web-tools elpy quelpa paradox gnu-elpa-keyring-update deadgrep erefactor helm-org-rifle deft zotxt zotxt-emacs emacsql-sqlite3 cask wttrin org ivy-hydra helm-org dired-narrow shell-pop dired-subtree ivy-rich flycheck-cstyle flycheck-cython flycheck-inline flycheck-pos-tip multi-line yaml-mode flycheck csharp-mode omnisharp org-bullets py-autopep8 smex helm elpygen ox-pandoc powershell helpful dired+ helm-descbinds smartscan artbollocks-mode highlight-thing swiper-helm esup auctex auctex-latexmk psvn helm-cscope xcscope ido-completing-read+ helm-swoop ag company dumb-jump outshine lispy org-download w32-browser replace-from-region xah-math-input flyspell-correct flyspell-correct-ivy google-translate gscholar-bibtex helm-google ox-minutes transpose-frame which-key beacon ox-clip hl-line+ copyit-pandoc pandoc pandoc-mode org-ac flycheck-color-mode-line flycheck-perl6 iedit wrap-region avy cdlatex latex-unicode-math-mode f writegood-mode auto-complete matlab-mode popup parsebib org-cliplink org-autolist key-chord ido-grid-mode ido-hacks ido-describe-bindings hydra google-this google-maps flx-ido expand-region diminish bind-key biblio async adaptive-wrap buffer-move))
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
 '(swiper-action-recenter nil)
 '(tool-bar-mode nil)
 '(visual-line-fringe-indicators '(nil top-right-angle))
 '(w32-use-w32-font-dialog nil)
 '(window-divider-default-places t)
 '(window-divider-mode t))

(use-package flycheck
  :config
  (eval-after-load "flycheck-mode" '(diminish 'flycheck-mode)))
(diminish 'flycheck-mode) ;; only works outside of use-package flycheck

(use-package flycheck-pos-tip)

;; Make interpreter shells do arrow prev/last matching, like linux
;; shells.  I think this will be overwritten by some modes
;; e.g. gud-debugger, inferior-python-mode, and RSS, which have their own maps in this emacs
;; file. 
(define-key comint-mode-map [up]
  'comint-previous-matching-input-from-input)
(define-key comint-mode-map [down]
  'comint-next-matching-input-from-input)

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
  ;; this works if I run it from inside .emacs but not after a clean start  
  ;;  :bind (:map outline-minor-mode-map ("S-<tab>" . outshine-cycle-buffer))
  ;; diminish doesn't work
  :diminish outline-mode
  :diminish outline-minor-mode
  :config
  (add-hook 'outline-minor-mode-hook 'outshine-mode) ; for outshine itself
  (add-hook 'prog-mode-hook 'outline-minor-mode)     ; all prog modes
  ;; can only diminish outshine mode here, like this, for some reason
  (eval-after-load "outshine" '(diminish 'outshine-mode)) 
  ;; works here
  (bind-keys
   :map outline-minor-mode-map
   ("<backtab>" . outshine-cycle-buffer))) ;Global cycle using S-TAB

;; *** Vertical indent lines in programming modes

(use-package highlight-indentation
  :diminish highlight-indentation-mode) ; indicator: ||

(use-package highlight-indent-guides
  :diminish highlight-indent-guides-mode ;; indicator: h-i-g (works here)
  :config
  (setq highlight-indent-guides-method 'character) ; nicest, thinnest lines
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

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
;; * Org Mode
;; ** Org-* dirs and files

;; set up org and bib for old way of doing things and experimental org-roam, or a true org-roam, org-ref setup
(setq bibfile_energy_fnm (expand-file-name "energy.bib" docDir)
      bibfile_energy_pdf_dir (expand-file-name "papers" docDir)
      bibfile_energytop_fnm (expand-file-name "energytop.bib" docDir))

(if t
    (progn
      (message "Old org/bib init with playground org-roam or DOE brainstorm")
      (setq
       org_roam_dir (expand-file-name "DOE_brainstorm" docDir)
;;       org_roam_dir (expand-file-name "C:/Users/scott/tmp/bibNotesOR")
       org_notes_dir (expand-file-name "org-notes" org_roam_dir)
       bibfile_roam_fnms (list (expand-file-name
                                "deepSolarDOE.bib" org_roam_dir)
                               (expand-file-name
                                "newTechAdoption.bib"
                                (expand-file-name "newTechAdoption" org_roam_dir)))
       bibfile_roam_pdf_dir (expand-file-name "papers" org_roam_dir)
       org_ref_notes_dir (expand-file-name "bib-notes" org_roam_dir)
       org_ref_notes_fnm (expand-file-name "DOE_brainstorm.org" org_roam_dir)
       org-directory org_notes_dir
       deft-directory org_notes_dir
       ))
  (progn
    (message "org-roam style init")
    ;; simillar to idea in https://rgoswami.me/posts/org-note-workflow/
    (setq
     org_roam_dir (expand-file-name "org_roam" docDir)
     org_notes_dir (expand-file-name "org_notes" org_roam_dir)
     bibfile_roam_fnms (list (expand-file-name "zotlib.bib" org_roam_dir))
     bibfile_roam_pdf_dir (expand-file-name "papers" org_roam_dir)
     org_ref_notes_dir (expand-file-name "org_ref_notes" org_roam_dir)
     org-directory org_notes_dir
     deft-directory org_notes_dir
     org-roam-directory org_notes_dir
     )))

;; Users of this require that it really be a list, even if only one item
(setq bibfile_list bibfile_roam_fnms) ;; helm-bibtex slow w/ energy.bib
;; but include pdfs in energy.bib so it can find pdfs if visited manually
(setq bibpdf_list (list bibfile_energy_pdf_dir bibfile_roam_pdf_dir)) 

;; ** Org-download

;; From: https://coldnew.github.io/hexo-org-example/2018/05/22/use-org-download-to-drag-image-to-emacs/
(use-package org-download
  :config
  ;; add support to dired
  (add-hook 'dired-mode-hook 'org-download-enable))

;; make drag-and-drop image save in the same name folder as org file
;; ex: `aa-bb-cc.org' then save image test.png to `aa-bb-cc/test.png'
(defun org-download-method-dirname-from-orgfile (link)
  (let ((filename
         (file-name-nondirectory
          (car (url-path-and-query
                (url-generic-parse-url link)))))
        (dirname (file-name-sans-extension (buffer-name)) ))
    ;; if directory not exist, create it
    (unless (file-exists-p dirname)
      (make-directory dirname))
    ;; return the path to save the download files
    (expand-file-name filename dirname)))

;; ** Org Basic Config

;; TODO This sets frame width based on screen and char size.  Might help:
;; https://gitlab.msu.edu/joshia/celta-vm-home-config/commit/f34b238c7a7eb5da2130b1a337e83f5940f086ae?w=1

;; TODO: experiment with C-c C-x C-b or M-x org-tree-to-indirect-buffer

(use-package org
  :ensure org-plus-contrib ; fewer clean install errors, still must restart 3X
  :pin org
  :diminish org-mode  ; doesn't hide the "Org" in modeline, for some reason
  :diminish org-table-header-line-mode  ; customization: org-table-header-line-p
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
  ;; (define-key org-mode-map (kbd "C-x n <return>") 'org-toggle-narrow-to-subtree) ; was switch TODO set
  ;;(define-key org-mode-map (kbd "C-x n")
  ;;'org-toggle-narrow-to-subtree) ; was switch TODO set

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
  
  ;; TODO get this to work
  ;; could do setq-local for dir or file-specific dirname:
  ;; https://coldnew.github.io/hexo-org-example/2018/05/22/use-org-download-to-drag-image-to-emacs/
  (setq org-download-method 'org-download-method-dirname-from-orgfile))

;; Show org-mode bullets as UTF-8 characters (org-bullets replacement).
;; Nicer bullets: for others:
;; https://www.w3schools.com/charsets/ref_utf_symbols.asp

;; My TODO chars.  Checked box graphics look cool but aren't fixed
;; width and so mess up headline indenting a little bit
 ;; '(org-superstar-todo-bullet-alist
 ;;   '(("TODO" . 9744)
 ;;     ("DONE" . 9745)
 ;;     ("TRY" . 9728)
 ;;     ("REJECTED" . 10005)
 ;;     ("ACCEPTED" . 10003)))

(use-package org-superstar
  :after org
  :init
  ;; org-superstar github: loads faster
  (setq inhibit-compacting-font-caches t)
  :hook (org-mode . org-superstar-mode))

;; (use-package org-superstar
;;   :after org
;;   :init
;;   ;; org-superstar github: loads faster
;;   ;; (setq inhibit-compacting-font-caches t)
;;   :hook
;;   (org-mode . (lambda () (org-superstar-mode 1))))


;; Show hidden emphasis markers e.g.* in *bold*.  So can see where cursor is.
(use-package org-appear
  :custom
  (org-appear-autoentities t)
  (org-appear-autokeywords t)
  (org-appear-autolinks t)
  (org-appear-autosubmarkers t)
  (org-appear-delay 1)
  :hook (org-mode . org-appear-mode))

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

(use-package org-autolist ; new - or -[ ] w/ return
  :after org
  :diminish org-autolist-mode
  :config
  (add-hook 'org-mode-hook #'org-autolist-mode)) 

;; Quick org emphasis:  Select text & hit key below. expand-region pkg helps.
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

;; I can't get this to do anything but duplicate existing org-cliplink
;; functionality.  Other stuff seems broken or just doesn't do much.
;;
;; ;; The archive site (https://archive.is/E14FW) this uses to get a
;; ;; zipped webfile doesn't actually make he zip file, even if I
;; ;; manually type the original URL into the site's URL page.  See:
;; ;; https://archive.is/E14FW and try to download the zipfile on the page.

;; ;; From: https://github.com/jwiegley/dot-emacs/blob/master/dot-org.el
;; (use-package org-web-tools
;;  :bind (("C-, C-y" . my-org-insert-url) ;; like org-cliplink
;;         ("C-, C-M-y" . org-web-tools-insert-web-page-as-entry))
;;  :functions (org-web-tools--org-link-for-url
;;             org-web-tools--get-first-url)
;;  :preface
;;   (declare-function org-web-tools--org-link-for-url "org-web-tools")
;;   (declare-function org-web-tools--get-first-url "org-web-tools")
;;   (defun my-org-insert-url (&optional arg)
;;     (interactive "P")
;;     (require' org-web-tools)
;;     (let ((link (org-web-tools--org-link-for-url
;;                  (org-web-tools--get-first-url))))
;;       (if arg
;;           (progn
;;             (org-set-property "URL" link)
;;             (message "Added pasteboard link to URL property"))
;;         (insert link)))))

;; ** org Mode Dedicated Targets
(require 'org)

;; --- Hide org-mode dedicated targets -----------------------------------------
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

;; ** Hide/show/toggle :PROPERTIES: drawer

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
;; Converts non-heading text lines to checkboxes lists;
;; convert checkbox lists to TODO's with: C-c C-*
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

;; ** Org Export

(use-package ox-minutes :defer 5) ; nice(er) ascii export, but slow start

;; *** Pandoc helper for org export

(when (sdo/find-exec "pandoc" "Needed for org-mode export to .docx, etc.")
  ;; from: https://github.com/rubensts/.emacs.d/blob/master/emacs-init.org
  (use-package ox-pandoc
    :after org-plus-contrib
    :demand t
    :config
    (validate-setq org-pandoc-options '((standalone . t))            ; default options for all output formats
                   org-pandoc-options-for-docx '((standalone . nil)) ; cancel above settings only for 'docx' format

                   org-pandoc-options-for-beamer-pdf '((latex-engine . "lualatex"))
                   org-pandoc-options-for-latex-pdf  '((latex-engine . "lualatex"))
                   ;;org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")
                   ;;                                   (template . "~/.pandoc/templates/memoir2.latex" ))
                   ;;org-pandoc-options-for-latex '((latex-engine . "xelatex")
                   ;;                               (template . "~/.pandoc/templates/memoir2.latex" ))

                   ;; Use external css for html5
                   ;; (let ((stylesheet (expand-file-name
                   ;;                    (locate-user-emacs-file "etc/pandoc.css"))))
                   ;;   (setq org-pandoc-options-for-html5
                   ;;         `((css . ,(concat "file://" stylesheet)))))
                   )
    ))


;; ** Org Import

(use-package org-pandoc-import
  :straight (:host github
             :repo "tecosaur/org-pandoc-import"
             :files ("*.el" "filters" "preprocessors")))

;; ** Org and Git

;; Behavior when link to a file in git.  This only happens if org-modules contains  ol-git-link
;;
;; OL-GIT-LINK IS TOO PROBLEMATIC without improvements below e.g. if you're in the middle of editing before checking in, git: links send you to a file without your edits!
;;
;; WARNING: If you've changed the file since the last git checkin,
;; following that link won't show your changes.  This is because
;; ol-git-link checks out the most recently checked in version of the
;; file you've made the link from and then displays that.

;; TODO: warn if file has changes not in git.  Maybe don't check out a
;; version but link directly to the file?
;; TODO: move the "description is marked region" thing to org-store-link-props since everybody must call that one, right?

;; Makes a link description from the marked region for git links. Overwrites function in:
;; ~/.emacs.d/elpa/org-plus-contrib-20210816/ol-git-link.el
;;
;; (defun org-git-store-link ()
;;   "Store git link to current file.  The link description is the active mark region, if there is one.
;; This is an overwrite of the same-named function in ol-git-link.el"
;;   (when (buffer-file-name)
;;     (let ((file (abbreviate-file-name (buffer-file-name)))
;; 	  (line (line-number-at-pos)))
;;       (when (org-git-gitrepos-p file)
;;         (if mark-active
;;           (let ((region (funcall region-extract-function nil)))
;;             (deactivate-mark)
;;             ;; I'm using the obsolete org-store-link-props here b/c org-link-store-props concats :description into the link instead of making it a separate description.  SOMETIMES org-store-link-props does too (in .py files?)  Seems to think that marked region (or :description?) is the string that should be searched for when visiting the link.  Does it NOT use description if region is marked?
;; 	    (org-store-link-props
;;              :link (org-git-create-git-link file line)
;;              :description region
;;              :type "git"))
;;           (org-link-store-props
;; 	   :link (org-git-create-git-link file line)
;;            :type "git"))))))

;; also see .emacs example: (defun my//dired-store-link ...)

;;For magit buffers https://github.com/magit/orgit
;;(use-package orgit)

;; This is nice, but it ALWAYS stores git links if the file is in a
;;git repository -- screws up links across energytop.org and
;;howto.org, because they would point to certain git versions instead
;;of the CURRENT git version.
;;
;; My issue report:
;;https://github.com/ReimarFinken/org-git-link/issues/5
;; Author's introduction:
;;https://lists.gnu.org/archive/html/emacs-orgmode/2009-10/msg00730.html
;; somebody has same problem:
;;https://stackoverflow.com/questions/56158827/how-do-i-disable-or-rein-in-org-git-link-org-plus-contrib-20190513
;;
;;All git links https://orgmode.org/worg/org-contrib/org-git-link.html
;;(if (sdo/find-exec "git") (add-to-list 'org-modules 'org-git-link))

;; ** Org-rifle
;; Search org-mode file(s) and get results and their place in the org-mode tree hierarchy
;; TODO: Try it: https://github.com/alphapapa/org-rifle
;;
;; Is this better than org-deft b/c it limits its search to org files?
;;
;; From: https://dustinlacewell.github.io/emacs.d/
(use-package helm-org-rifle
  :after (helm org)
  :commands helm-org-rifle-current-buffer
  :config
  (define-key org-mode-map (kbd "M-r") 'helm-org-rifle-current-buffer))

;; ** org-ql

;; From https://github.com/novoid/dot-emacs/blob/master/config.org
;; Used by: org-ql
;; Completion package for Org mode: https://github.com/emacs-helm/helm-org
(use-package helm-org
  ;;:defer 90
  :ensure t
  :config
  ;; (add-to-list 'helm-completing-read-handlers-alist '(org-capture . helm-org-completing-read-tags))
  ;; (add-to-list 'helm-completing-read-handlers-alist '(org-set-tags . helm-org-completing-read-tags))
  )

;; commented out to avoid the dash-functional warning
;; my bug report: https://github.com/alphapapa/org-ql/issues/206
;; (use-package org-ql
;;   :after helm-org
;;   :config
;;   (require 'org-ql-search) ;; workaround for https://github.com/alphapapa/org-ql/issues/53
;; )
;;
;; (use-package helm-org-ql
;;   :after org-ql
;;   :config
;;   (require 'helm-org-ql) ;; so it's available
;; )

;; Dedicated target search (in non-expq query, use dt:Name)
;; https://github.com/alphapapa/org-ql/issues/158
;; Doesn't compile
;; (org-ql-defpred (dedicated-target dt) (name)
;;   "Search for a dedicated target named NAME (i.e. \"<<NAME>>\")."
;;   :normalizers ((`(, predicate-names ,name)
;;                  `(regexp ,(concat "<<" name ">>")))))

;; ** Org and Zotero

;; For Zotero add-in "zutilo"  Conflicts/same-as zotxt?
;; https://orgmode-exocortex.com/2020/05/13/linking-to-zotero-items-and-collections-from-org-mode/
(org-link-set-parameters "zotero" :follow
                         (lambda (zpath)
                           (browse-url
                            ;; we get the "zotero:"-less url, so we put it back.
                            (format "zotero:%s" zpath))))

;; For Zotero add-in "zotxt"  Conflicts/same-as zutilo?
;; https://github.com/egh/zotxt-emacs
;; Pastes biblio summary of Zotero entries in org-mode, connects to org-noter
(use-package zotxt)

;; ** Org-ref

;; Store links in bibtex: C-c l; in .org files C-c ]
;; Inspiration: https://github.com/bixuanzju/emacs.d/blob/master/emacs-init.org
(use-package org-ref
  :after org
  :init
  (let ((default-directory docDir))

    (setq org-ref-bibliography-notes org_ref_notes_fnm
          org-ref-default-bibliography bibfile_list 
          ;; whatever looks at org-ref-pdf-directory seems to look only at 1st element of list, unlike user of bibtex-completion-bibliography in helm--bibtex.  This is even though user of org-ref-default-bibliography =does= look at lists.
          org-ref-pdf-directory bibpdf_list
          reftex-default-bibliography org-ref-default-bibliography))

  ;; ;; showing broken links slowed down energytop.org (but much less in Oct. 2017)
  ;; ;;  https://github.com/jkitchin/org-ref/issues/468
  ;;(setq org-ref-show-broken-links nil) ;still need to prohibit broken link show?
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
  ;; Make org-ref cite: link folded in emacs.  Messes up Latex export:
  ;; https://github.com/jkitchin/org-ref/issues/345#issuecomment-262646855
  ;;  (org-link-set-parameters "cite" :display nil)
  ;; Improvement, or at least more explicity setting from:
  ;; https://org-roam.discourse.group/t/customize-display-of-cite-links/129/19
  (org-link-set-parameters "cite" :display 'org-link)
  ;; Make the 'cite:' link type available when C-c l on a bibtex entry
  ;; https://github.com/jkitchin/org-ref/issues/345
  (let ((lnk (assoc "bibtex" org-link-parameters)))
    (setq org-link-parameters (delq lnk org-link-parameters))
    (push lnk org-link-parameters))
  )

;; Unfortunately, this may screw up linking to techreports:
;; https://github.com/jkitchin/org-ref/issues/205
;; at least they work after I comment it out
;; (bibtex-set-dialect 'biblatex); so org-ref can recognize more entry types e.g. patent

;; ** v2 Org-Roam

;; TODO: :custom (org-id-method 'ts) doesn't work
;;       https://org-roam.discourse.group/t/org-roam-major-redesign/1198/28
;; TIPS
;; add org-id to headline: org-id-copy

;; https://systemcrafters.net/build-a-second-brain-in-emacs/keep-a-journal/
;; several startup org-roams, also initializing org-roam-bibtex 
(use-package org-roam
  ;;  :straight t
  ;; calling one of these commands will initialize Org-roam and ORB
  :commands (org-roam-node-find org-roam-graph org-roam-capture
                                org-roam-dailies-capture-today org-roam-buffer-toggle)
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "~/tmp"))
  ;; (org-roam-directory (file-truename org_roam_dir))
  (org-roam-completion-everywhere t) ;; org-roam links completion-at-point
  (org-id-method 'ts)

  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n g" . org-roam-graph)
         ("C-c n h" . org-roam-capture)
         ([mouse-1] . org-roam-visit-thing)
         ;; may not exist aymore
         ("C-c n j" . org-roam-dailies-capture-today)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         ;; this map may not exist anymore
;;         :map org-roam-dailies-map
;;         ("Y" . org-roam-dailies-capture-yesterday)
;;         ("T" . org-roam-dailies-capture-tomorrow)
         )
  ;; causes error:
  ;; :bind-keymap
  ;; ("C-c n d" . org-roam-dailies-map)
  
  :config
  ;;(org-roam-setup)
  
  ;; The line below caues org-roam to hang and time out after 30
  ;;seconds, at least on Windows.  Maybe it didn't on Mac
  ;;(org-roam-bibtex-mode +1)
  
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode)

  ;; commenting this out removed an org-roam empty buffer error (sometimes)
  ;; https://org-roam.discourse.group/t/minimal-setup-for-helm-bibtex-org-roam-v2-org-roam-bibtex/1971/2?u=scotto
  ;;(org-roam-bibtex-mode +1)
  )

(use-package ivy-bibtex)
  
;; adds a bullet to today's daily w/ a timestamp on the front of it
;; (works in v2):
;; https://org-roam.discourse.group/t/v2-daily-capture-template-not-working/1887
;; (setq org-roam-dailies-capture-templates
;;       (let ((head
;;              (concat "#+title: %<%Y-%m-%d (%A)>\n#+startup: showall\n* Daily Overview\n"
;;                      "#+begin_src emacs-lisp :results value raw\n"
;;                      "(as/get-daily-agenda \"%<%Y-%m-%d>\")\n"
;;                      "#+end_src\n"
;;                      "* [/] Do Today\n* [/] Maybe Do Today\n* Journal\n")))
;;         `(("j" "journal" entry
;;            "* %<%H:%M> %?" :if-new
;;            (file+head+olp "%<%Y-%m-%d>.org" ,head ("Journal"))))))

;; https://systemcrafters.net/build-a-second-brain-in-emacs/keep-a-journal/
;; (use-package org-roam
;; ;;  :straight t
;;   ;;:straight (:branch "v2.1.10" :host github :repo "org-roam/org-roam")
;;   :init
;;   (setq org-roam-v2-ack t)
;;   :custom
;;   ;; (org-roam-directory (file-truename org_roam_dir))
;; ;;  (org-roam-completion-everywhere t) ;; org-roam links completion-at-point
;;   (org-roam-directory (file-truename "~/tmp"))
;;   (org-roam-completion-everywhere t)
;;   (org-id-method 'ts) ;; use timestamps for org-id
;;   :bind (("C-c n l" . org-roam-buffer-toggle)
;;          ("C-c n f" . org-roam-node-find)
;;          ("C-c n i" . org-roam-node-insert)
;;          ("C-c n g" . org-roam-graph)
;;          ("C-c n h" . org-roam-capture)
;;          ([mouse-1] . org-roam-visit-thing)
;;          ;; may not exist aymore
;;          ;;("C-c n j" . org-roam-dailies-capture-today)
;;          :map org-mode-map
;;          ("C-M-i" . completion-at-point)
;;          ;; this map may not exist anymore
;;          ;; :map org-roam-dailies-map
;;          ;; ("Y" . org-roam-dailies-capture-yesterday)
;;          ;; ("T" . org-roam-dailies-capture-tomorrow)
;;          )
;;   ;; may not exist anymore
;;   ;;:bind-keymap
;;   ;;("C-c n d" . org-roam-dailies-map)
;;   ;; :config
;;   ;;(require 'org-roam-dailies) ;; Ensure the keymap is available
;;   ;; from: https://org-roam.discourse.group/t/daily-task-management-with-org-agenda-and-org-roam-dailies/989/17?u=scotto
;;   ;; (setq org-roam-dailies-capture-templates
;;   ;;       (let ((head
;;   ;;              (concat "#+title: %<%Y-%m-%d (%A)>\n#+startup: showall\n* Daily Overview\n"
;;   ;;                      "#+begin_src emacs-lisp :results value raw\n"
;;   ;;                      "(as/get-daily-agenda \"%<%Y-%m-%d>\")\n"
;;   ;;                      "#+end_src\n"
;;   ;;                      "* [/] Do Today\n* [/] Maybe Do Today\n* Journal\n")))
;;   ;;         `(("j" "journal" entry
;;   ;;            "* %<%H:%M> %?"
;;   ;;            :if-new (file+head+olp "%<%Y-%m-%d>.org" ,head ("Journal")))
;;   ;;           ("t" "do today" item
;;   ;;            "[ ] %a"
;;   ;;            :if-new (file+head+olp "%<%Y-%m-%d>.org" ,head ("Do Today"))
;;   ;;            :immediate-finish t)
;;   ;;           ("m" "maybe do today" item
;;   ;;            "[ ] %a"
;;   ;;            :if-new (file+head+olp "%<%Y-%m-%d>.org" ,head ("Maybe Do Today"))
;;   ;;            :immediate-finish t))))

;;   (org-roam-db-autosync-mode) ;; function isn't defined (ONLY IN WINDOWS?)
;;   ;; If using org-roam-protocol
;;   ;; doesn't seem to be there anymore
;;   ;;(require 'org-roam-protocol)







;;   )


;; ** org-roam-dailies


;; ** org-roam-bibtex

;; needed for ORB, apparently
;;(use-package magit-section)


;; s/b Loaded INSIDE Of Org-Roam?
;; https://org-roam.discourse.group/t/org-roam-bibtex-for-org-roam-v2/1574/88
;; (use-package org-roam-bibtex
;;   :after org-roam
;;   :config
;;   (require 'org-ref)) ; if Org Ref is not loaded anywhere else, load it here

;; orb puts any .org file link into or db:  i don't want that b/c i want to link to product code, etc.
;; turn off for now
;; todol: make a pr about this

;; ;; setup like 1st of https://githubmemory.com/repo/org-roam/org-roam-bibtex/issues
;; (use-package org-roam-bibtex
;; ;;  :straight t
;;   ;; :after needed for straight: https://github.com/org-roam/org-roam-bibtex
;;   :after (org-roam org-ref helm-bibtex ivy-bibtex)
;;   :init
;;   (setq orb-insert-interface 'ivy-bibtex)
;;   (setq orb-note-actions-interface 'ivy)
;;   (add-to-list 'orb-preformat-keywords "year")
;;   (org-roam-bibtex-mode)) ;; probably what grabs C-c l

;; A temporary ORB fix so don't have to select template type every time.
;; Goes away when proposed changes to main org-roam pkg are made
;; https://github.com/org-roam/org-roam-bibtex/issues/206
;; (setq org-roam-capture-templates
;;   '(;; find node template
;;     ("d" "default" plain "%?" :if-new
;;      (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
;;      :unnarrowed t)

;;     ;; dailies template
;;     ("r" "reference template" plain "* %?" 
;;       :if-new
;;       (file+head "path/to/notes/${citekey}.org" "#+title: ${title}\n")
;;       :type org-roam-bibtex)))   ;; <= type marker

;; ** org-roam-ui (graph viewing)

;; config from: https://github.com/org-roam/org-roam-ui
(use-package org-roam-ui
  :straight (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
;;  :hook
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

;; "pdf-scrapper" part of org-roam-bibtex requires ruby gem
;; anystyle_cli
;; https://github.com/org-roam/org-roam-bibtex
; https://github.com/inukshuk/anystyle-cli
;; (use-package org-roam-bibtex
;;   :straight (:branch "v2" :host github :repo "org-roam/org-roam")
;;   :diminish org-roam-bibtex-mode
;;   :after org-roam
;;   :hook (org-roam-mode . org-roam-bibtex-mode)
;;   :bind (:map org-mode-map
;;               (("c-c n a" . orb-note-actions))))

;; (use-package org-roam-bibtex
;;   :straight (:branch "v2" :host github :repo "org-roam/org-roam")
;;   :after org-roam
;;   :config
;;   (require 'org-ref)) ; optional: if Org Ref is not loaded anywhere else, load it here

;; ** PRE-V2 ORG-ROAM: when I uninstalled it, the bibtex "Which function for
;; *** creating the link?" problem went away
;; *** PRE-V2: Org-roam
;; *** Org-roam basic config

;; Started from:
;; http://www.cesarolea.com/posts/taking-smart-notes/index.html

;; (sdo/find-exec "dot" "graphviz needed by org-roam")

;; (use-package org-roam
;;   :diminish org-roam-mode
;;   :hook (after-init . org-roam-mode) ; really slows down emacs startup
;;   :config
;;   (setq org-roam-db-location "~/org-roam.db")
;;   (require 'org-roam-protocol) ;; for org-roam-capture?
;;   :custom (org-roam-directory org_roam_dir)
;;   ;;:custom (org-roam-directory "~/Sync/Org/roam/")
;;   :bind (:map org-roam-mode-map
;;               (("C-c n l" . org-roam)
;;                ("C-c n f" . org-roam-find-file)
;;                ("C-c n g" . org-roam-graph)
;;                ("C-c n c" . org-roam-capture))
;;               :map org-mode-map
;;               (("C-c n i" . org-roam-insert))
;;               (("C-c n I" . org-roam-insert-immediate))))

;; ;; Much fancier than OR default graph viewer.  Clickable links, etc.
;; ;; To see the graph in your browser:
;; ;;   M-x org-roam-server-mode
;; ;;   open browser to 127.0.0.1:8080
;; (use-package org-roam-server
;;   :config
;;   (setq org-roam-server-host "127.0.0.1"
;;         org-roam-server-port 8080
;;         org-roam-server-authenticate nil
;;         org-roam-server-export-inline-images t
;;         org-roam-server-serve-files nil
;;         org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
;;         org-roam-server-network-poll t
;;         org-roam-server-network-arrows nil
;;         org-roam-server-network-label-truncate t
;;         org-roam-server-network-label-truncate-length 60
;;         org-roam-server-network-label-wrap-length 20))

;; ;; *** Deft

;; ;; not super-useful, as it searches titles only, I think.  ag. seems better
;; ;; starter config from: https://github.com/TimPerry/.emacs.d/blob/master/init.el
;; (use-package deft
;;   :bind ("<f6>" . deft)
;;   :commands (deft)
;;     :config
;;     (setq deft-extensions '("org") ;; ignore anything but .org (good idea?)
;;           deft-directory org_roam_dir
;;           deft-recursive t))

;; ;; ;; deft as Used by org-roam author
;; ;; ;; https://blog.jethro.dev/posts/zettelkasten_with_org/
;; ;; ;; and others from org-roam searching.
;; ;; ;; From: https://rgoswami.me/posts/org-note-workflow/#search
;; ;; (use-package deft
;; ;;   :commands deft
;; ;;   :init
;; ;;   (setq deft-default-extension "org"
;; ;;         ;; de-couples filename and note title:
;; ;;         deft-use-filename-as-title nil
;; ;;         deft-use-filter-string-for-filename t
;; ;;         ;; disable auto-save
;; ;;         deft-auto-save-interval -1.0
;; ;;         ;; converts the filter string into a readable file-name using kebab-case:
;; ;;         deft-file-naming-rules
;; ;;         '((noslash . "-")
;; ;;           (nospace . "-")
;; ;;           (case-fn . downcase)))
;; ;;   :config
;; ;;   (add-to-list 'deft-extensions "tex")
;; ;;   )

;; ;; *** Org-roam-bibtex

;; ;; Handy: to open a cite note's pdf: C-c n a RET
;; ;;From github page: https://github.com/org-roam/org-roam-bibtex
;; (use-package org-roam-bibtex
;;   :diminish org-roam-bibtex-mode
;;   :after org-roam
;;   :hook (org-roam-mode . org-roam-bibtex-mode)
;;   :bind (:map org-mode-map
;;               (("C-c n a" . orb-note-actions))))

;; ;; NOTE the below don't take effect unless you've run M-x org-roam-bibtex-mode or customize it to ON
;; ;;
;; ;; BUG below: I removed the heading: "* {title}" or something like that from the orb-template, but org-noter must be started on a heading, for some stupid reason, so when I try to run it, it asks for some file and I don't what what it wants.  Didn't do that before I removed the heading.
;; ;;
;; ;;From github page: https://github.com/org-roam/org-roam-bibtex
;; ;; This works with org-noter.  If you're in the org-roam-cite note, and run org-noter, it will set things up correctly.  Two cautions
;; ;; 1. must put cursor in headline (required) before M-x org-noter
;; ;; 2. I =think= you have to save (C-c C-n?) the new helm-bibtex capture b/f running org-noter
;; (setq orb-preformat-keywords
;;       '(("citekey" . "=key=") "title" "url" "file" "author-or-editor" "keywords"
;;         "year" "abstract"))

;; (setq orb-templates
;;       '(("r" "ref" plain (function org-roam-capture--get-point)
;;          ""
;;          :file-name "bib-notes/${citekey}"
;;          :head "#+TITLE: ${citekey}\n#+created: %u\n#+last_modified: %U\n#+ROAM_KEY: ${ref}

;; *${title}*
;; ${author-or-editor} (${year})


;; ;; put citekey in title of bib notes, title in note.  This can get much fancier and can have multiple templates
;;  (setq orb-templates
;;       '(("r" "ref" plain (function org-roam-capture--get-point) ""
;;          :file-name "${citekey}"
;;          :head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}\n" ; <--
;;          :unnarrowed t)))


;; from:  https://rgoswami.me/posts/org-note-workflow/#helm-bibtex
;; Copies in keywords, which I may or may not like
;;  (use-package org-roam-bibtex
;;   :after (org-roam)
;;   :hook (org-roam-mode . org-roam-bibtex-mode)
;;   :config
;;   (setq org-roam-bibtex-preformat-keywords
;;    '("=key=" "title" "url" "file" "author-or-editor" "keywords"))
;;   (setq orb-templates
;;         '(("r" "ref" plain (function org-roam-capture--get-point)
;;            ""
;;            :file-name "${citekey}"
;;            :head "#+TITLE: ${=key=}: ${title}\n#+ROAM_KEY: ${ref}

;; - tags ::
;; - keywords :: ${keywords}

;; \n* ${title}\n  :PROPERTIES:\n  :Custom_ID: ${=key=}\n  :URL: ${url}\n  :AUTHOR: ${author-or-editor}\n  :NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n  :NOTER_PAGE: \n  :END:\n\n"

;;            :unnarrowed t))))

;; These are for capturing stuff not in a bibtex file already, I think
;;
;; from: https://github.com/zaeph/org-roam-bibtex
;; (setq orb-preformat-keywords
;;       '(("citekey" . "=key=")
;;         ("type" . "=type=")
;;        "title"))
;; (setq org-roam-capture-templates
;;       '(("r" "reference" plain (function org-roam-capture--get-point)
;;          "#+ROAM_KEY: %^{citekey}%? fullcite: %\1
;;           #+TAGS: %^{type}
;;           This %\2 deals with ..."
;;          :file-name "references/%<%Y-%m-%d-%H%M%S>_${title}"
;;          :head "#+TITLE: ${title}"
;;          :unnarrowed t)))


;; based on: https://dotdoom.rgoswami.me/config.html#text-3
;;;;(after org-ref
;; (setq
;;  ;; bibtex-completion-notes-path org_ref_notes_dir
;;  ;; bibtex-completion-bibliography bibfile_roam_fnms
;;  ;; bibtex-completion-pdf-field "file"
;;  bibtex-completion-notes-template-multiple-files
;;  (concat
;;   "#+TITLE: ${title}\n"
;;   "#+ROAM_KEY: cite:${=key=}\n"
;;   "* TODO Notes\n"
;;   ":PROPERTIES:\n"
;;   ":Custom_ID: ${=key=}\n"
;;   ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
;;   ":AUTHOR: ${author-abbrev}\n"
;;   ":JOURNAL: ${journaltitle}\n"
;;   ":DATE: ${date}\n"
;;   ":YEAR: ${year}\n"
;;   ":DOI: ${doi}\n"
;;   ":URL: ${url}\n"
;;   ":END:\n\n"
;;   )
;;  )
;; ;;)

;; a better alternative?
;; https://org-roam.discourse.group/t/does-anyone-have-a-workflow-for-associating-notes-with-a-zotero-stored-pdf/112/10?u=scotto
;;
;; or pieces of this:
;; https://rgoswami.me/posts/org-note-workflow/


;; *** Org-roam-tags

;; From: https://gist.github.com/d12frosted/4a55f3d072a813159c1d7b31c21bac9a
;; Docs: https://d12frosted.io/posts/2020-06-10-org-roam-tags.html
;;
;; Didn't work.  Calling +org-notes-tags-add inside a note gave the error: "user-error: Current buffer is not a note"

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

;; ** Bibfile files and directories
;;    see also Org-roam-bibtex

;; init these here so helm-bibtex and ivy-bibtex can share them
(setq bibtex-completion-bibliography bibfile_list)
(setq bibtex-completion-library-path bibpdf_list)
;; Find pdf w/ JabRef/Zotero fields
(setq bibtex-completion-pdf-field "file")
;; This dir must be present, otherwise helm-bibtex will make a file with this name.  YET it is ignored.
(setq bibtex-completion-notes-path (expand-file-name "bib-notes" org_roam_dir))

;; *** Helm-bibtex
;; Seems to be rquired for org-roam-bibtex
;; but then v2 org-roam-bibtex complains that it can't find 
;; (use-package helm-bibtex
;;   :bind*
;;   ("C-c C-h" . helm-bibtex))

;; *** ivy-bibtex

;; BSAG has dropped org-roam now.  I thought removing migh fix my ivy
;; problem but it didn't.  Anyway, maybe there are newer ivy-bibtex
;; setups that I could revisit if I revisitorg-roam.

;; ;; BSAG uses this instead of helm.  This is part from her:
;; ;; https://mail.google.com/mail/u/0/#sent/FFNDWMkpMkrFWrkjBSSGpHcJSdSZHJGb
;; ;; and part from:
;; ;; https://people.umass.edu/weikaichen/zh/post/emacs-academic-tools/
;; (use-package ivy-bibtex
;;   :ensure t
;;   :bind*
;;   ("C-c C-r" . ivy-bibtex)
;;   :config
;;   ;; https://github.com/tmalsburg/helm-bibtex
;;   (setq bibtex-completion-additional-search-fields '(journal booktitle))
;;   ;; TODO good extra info but makes entry list scraggly.  Fix that.
;;   (setq bibtex-completion-display-formats
;;         '((article       . "${=has-pdf=:1}${=has-note=:1} ${=type=:3} ${year:4} ${author:36} ${title:*} ${journal:40}")
;;           (inbook        . "${=has-pdf=:1}${=has-note=:1} ${=type=:3} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
;;           (incollection  . "${=has-pdf=:1}${=has-note=:1} ${=type=:3} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
;;           (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${=type=:3} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
;;           (t             . "${=has-pdf=:1}${=has-note=:1} ${=type=:3} ${year:4} ${author:36} ${title:*}")))
;;   (setq ivy-bibtex-default-action #'ivy-bibtex-insert-citation)
;;   (ivy-set-actions
;;    'ivy-bibtex
;;    '(("p" ivy-bibtex-open-any "Open PDF, URL, or DOI")
;;      ("e" ivy-bibtex-edit-notes "Edit notes")))
;;   ;; from BSAG
;;   (defun bibtex-completion-open-pdf-external (keys &optional fallback-action)
;;     (let ((bibtex-completion-pdf-open-function
;;            (lambda (fpath) (async-start-process "open" "open" "open" fpath))))
;;       (bibtex-completion-open-pdf keys fallback-action)))

;;   (ivy-bibtex-ivify-action bibtex-completion-open-pdf-external ivy-bibtex-open-pdf-external)

;;   (ivy-add-actions
;;    'ivy-bibtex
;;    '(("P" ivy-bibtex-open-pdf-external "Open PDF file in external viewer (if present)")))
;;   ;; TODO too busy?
;;   (setq bibtex-completion-pdf-symbol "⌘")
;;   (setq bibtex-completion-notes-symbol "✎"))


;; ** Org-noter
;;
;; keybindings, basic explanation: https://github.com/weirdnox/org-noter#keys

;; simple, just so it compiles.  started from: https://rgoswami.me/posts/org-note-workflow
(use-package org-noter
  :after (:any org pdf-view)
  :config
  (setq
   ;; the wm can handle splits
   org-noter-notes-window-location 'other-frame
   ;; please stop opening frames
   org-noter-always-create-frame nil
   ;; i want to see the whole file
   org-noter-hide-other nil
   ;; everything is relative to the main notes file
   org-noter-notes-search-path (list org_notes_dir)))

;;
;; Workflow w/ org-noter, org-roam org-roam-bibtex and org-ref.  Also plans for org-journal: https://rgoswami.me/posts/org-note-workflow/
;;
;; Could also try https://github.com/rudolfochrist/interleave although
;;I guess it's not as good at multiple documents
;;(https://dotdoom.rgoswami.me/config.html)
;;
;; ;; org-noter config inspired by: https://write.as/dani/notes-on-org-noter
;; (use-package org-noter
;;   :after org
;;   :after pdf-tools
;;   :config
;;   (setq org-noter-default-notes-file-names '("org-noter-notes.org")
;;                 org-noter-notes-search-path '("~/tmp/org-noter")))
;; ;;                  org-noter-separate-notes-from-heading t))
;; ;; coordinating org-noter with org-notes
;; ;; https://write.as/dani/notes-on-org-noter
;; (defun org-ref-noter-at-point ()
;;   "open the pdf for bibtex key under point if it exists."
;;   (interactive)
;;   (let* ((results (org-ref-get-bibtex-key-and-file))
;;          (key (car results))
;;          (pdf-file (funcall org-ref-get-pdf-filename-function key)))
;;     (if (file-exists-p pdf-file)
;;         (progn
;;           (find-file-other-window pdf-file)
;;           (org-noter))
;;       (message "no pdf found for %s" key))))

;; (add-to-list 'org-ref-helm-user-candidates 
;;              '("org-noter notes" . org-ref-noter-at-point))

;; ** Org-pdftools and org-noter-pdftools
;;
;; A fork/enhancement of defunct org-pdfview, has big future plans, recent commits (April 2020).  Has some kinda (temporary?) integrate with org-noter.
;; TODO: try it
;; https://github.com/fuxialexander/org-pdftools

;; ** org-latex

;; Faster latex entry: http://orgmode.org/manual/CDLaTeX-mode.html#CDLaTeX-mode
;;
;; When scimax/org-return, maybe use it instead.  May go back to this if the two are merged.
;; (use-package cdlatex
;;   :diminish org-cdlatex-mode
;;   :config (add-hook 'org-mode-hook 'turn-on-org-cdlatex))

;; TODO: does this work? https://github.com/politza/pdf-tools#compilation-and-installation-on-windows
;; (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

;; mostly from: https://github.com/hieutkt/emacs-config
;;

;; makes most things variable pitch except code, tables, etc.
;; Variable pitch
;; (add-hook 'org-mode-hook
;;           '(lambda ()
;;              (variable-pitch-mode 1)))
;;
;; (mapc (lambda (face)
;;         (set-face-attribute face nil :inherit 'fixed-pitch))
;;       (list 'org-code
;;             'org-link
;;             'org-block
;;             'org-table
;;             'org-block-begin-line
;;             'org-block-end-line
;;             'org-meta-line
;;             'org-document-info-keyword
;;             'org-latex-and-related))

;; can't get org-preview example to work.  This one:
;; https://orgmode.org/worg/org-tutorials/org-latex-preview.html
;;
;; ;; ORG LATEX PREVIEW
;; (setq org-startup-with-latex-preview t
;;       ;; Make latex preview with "C-c C-x C-l" slightly bigger
;;       org-format-latex-options
;;       (plist-put org-format-latex-options :scale 1.8)
;;       ;; Cache the preview images elsewhere
;;       org-preview-latex-image-directory "~/.cache/ltximg/")

;; Highlight latex stuffs
;; But does this slow down energytop.org?
;; (setq org-highlight-latex-and-related '(latex entities))

;; Auto expand preview latex images when cursor is on it
;; nice but really slows down energytop.org
;; (use-package org-fragtog
;;   :config (add-hook 'org-mode-hook 'org-fragtog-mode))


;; So equation numbers in org-mode increment correctly.  If force it
;;to remove old images, then this *almost* works.
;; https://kitchingroup.cheme.cmu.edu/blog/2016/11/07/Better-equation-numbering-in-LaTeX-fragments-in-org-mode/
(defun org-renumber-environment (orig-func &rest args)
  (let ((results '()) 
        (counter -1)
        (numberp))

    (setq results (loop for (begin .  env) in 
                        (org-element-map (org-element-parse-buffer) 'latex-environment
                          (lambda (env)
                            (cons
                             (org-element-property :begin env)
                             (org-element-property :value env))))
                        collect
                        (cond
                         ((and (string-match "\\\\begin{equation}" env)
                               (not (string-match "\\\\tag{" env)))
                          (incf counter)
                          (cons begin counter))
                         ((string-match "\\\\begin{align}" env)
                          (prog2
                              (incf counter)
                              (cons begin counter)                          
                            (with-temp-buffer
                              (insert env)
                              (goto-char (point-min))
                              ;; \\ is used for a new line. Each one leads to a number
                              (incf counter (count-matches "\\\\$"))
                              ;; unless there are nonumbers.
                              (goto-char (point-min))
                              (decf counter (count-matches "\\nonumber")))))
                         (t
                          (cons begin nil)))))

    (when (setq numberp (cdr (assoc (point) results)))
      (setf (car args)
            (concat
             (format "\\setcounter{equation}{%s}\n" numberp)
             (car args)))))
  
  (apply orig-func args))

(advice-add 'org-create-formula-image :around #'org-renumber-environment)

;; You can remove the advice like this.
;; (advice-remove 'org-create-formula-image #'org-renumber-environment)


;; * Narrowing

;; Default emacs narrowing has too many keys: Could wipe them out and
;; make it a toggle as in  http://endlessparentheses.com/emacs-narrow-or-widen-dwim.html (has
;; a bunch of other toggles, maybe handy but I'll stick w/ this for
;; now) Or could just addd a toggle and leave the old keys in place,
;; as I'm doing.  Also, toggling with recursive-narrow instead of
;; endlessparens narrow-or-widen function:
;;
;; Note that dired-narrow is different, narrows based on search terms
;;
;; endlessparens' toggler.  Seems like commenters like
;; recursive-narrow better
;;
;; (defun narrow-or-widen-dwim (p)
;;   "Widen if buffer is narrowed, narrow-dwim otherwise.
;; Dwim means: region, org-src-block, org-subtree, or
;; defun, whichever applies first. Narrowing to
;; org-src-block actually calls `org-edit-src-code'.

;; With prefix P, don't widen, just narrow even if buffer
;; is already narrowed."
;;   (interactive "P")
;;   (declare (interactive-only))
;;   (cond ((and (buffer-narrowed-p) (not p)) (widen))
;; 	((region-active-p)
;; 	 (narrow-to-region (region-beginning)
;; 			   (region-end)))
;; 	((derived-mode-p 'org-mode)
;; 	 ;; `org-edit-src-code' is not a real narrowing
;; 	 ;; command. Remove this first conditional if
;; 	 ;; you don't want it.
;; 	 (cond ((ignore-errors (org-edit-src-code) t)
;; 		(delete-other-windows))
;; 	       ((ignore-errors (org-narrow-to-block) t))
;; 	       (t (org-narrow-to-subtree))))
;; 	((derived-mode-p 'latex-mode)
;; 	 (LaTeX-narrow-to-environment))
;; 	(t (narrow-to-defun))))
;; ;; TODO Idea is to have only a toggle.  Wipes out Emacs' entire
;; ;; narrowing keymap but not in org-mode, which overwrites this, somehow.
;; (define-key ctl-x-map "n" #'narrow-or-widen-dwim)

;; Commenters act like recursive-narrow is an improvement over endlessparens'
;; narrow-or-widen-dwim but I'm not sure why.  Maybe narrowed result
;; maintains top headline indent?  Maybe that's because it handles
;; org-mode too?
(use-package recursive-narrow
  :after org)

;; TODO put binding below inside recursive-narrow use-package
;;
;; Global narrowing binding is same as in org-mode
(global-set-key (kbd "C-x n n") 'recursive-narrow-or-widen-dwim)
;; Could have wiped out all Ctl-x n funcs (below) but this would have
;; wiped out some org-roam funcs that I haven't tried yet.
;;(define-key ctl-x-map "n" #'recursive-narrow-or-widen-dwim)

;; * Search and Replace (see also Swiper/Ivy)
;; ** Web Search

;; overrides org-mode bindings e.g. sparse-tree: C-c /
;; (use-package google-this      ;; TODO: compare with counsel-search
;;   :diminish google-this-mode
;;   :config
;;   (google-this-mode 1)) ; bound to C-c / g (and other bindings after '/')

;; ** File System Search

;; *** deadgrep
;; File search w/ nice interface, better than standard emacs lgrep, I think
;; Alternative mentioned by deadgrep author is ivy-rg, for incremental results:
;; https://www.reddit.com/r/emacs/comments/8x57ck/deadgrep_fast_friendly_searching_with_ripgrep_and/
;;
;; TODO deadgrep vs. counsel-rg vs. rg vs. ivy-grep vs. helm-rg
;; TODO make deadgrep search contents of pdfs, like Windows explorer
;; can
;;
;; TODO: use :init or :config within use-package
;; TODO: maybe don't need wh/return-default-dir anymore:  https://github.com/Wilfred/deadgrep/commit/14c7d6b74c7891ed7294abe1a6f5914948e4ab49
(if (setq rg_exe (sdo/find-exec "rg" "ripgrep needed org-roam and others"))
    (progn (use-package deadgrep)
           (global-set-key [f5] 'deadgrep)
           ;; use current working dir as starting point of search
           ;; https://github.com/Wilfred/deadgrep/issues/14#issuecomment-464363207
           (defun wh/return-default-dir ()
             default-directory)

           (setq deadgrep-project-root-function #'wh/return-default-dir))
  (global-set-key [f5] 'lgrep))

;; *** counsel-rg
;; TODO combo of conusel-rg and fuzzy (fzf) searching
;;  as in: https://protesilaos.com/dotemacs/
;;  demo: https://www.youtube.com/watch?v=IDkx48JwDco
;; nice swiper like completion.  helm-rg might/might not be better
;; problem is that it's like swiper: can't go back and forth between search results.  Also, prot convinced me that pkg rg is better (below)
;;
;; (if rg_exe
;;     (global-set-key [f5] 'counsel-rg)
;;   (global-set-key [f5] 'lgrep))

;; *** helm-rg
;; helm-rg couldn't adjust faces easily and prot convinced me that pkg
;; 'rg' is better (but then I couldn't get rg to work and went to deadgrep)

;; but helm-rg has nice hook to add file links based on search results
;; see  Use helm-rg to find notes to make connections to using full
;; text search" in : https://notes.alexkehayias.com/org-roam/
;;
;; but this config didn't compile immediately for me so I removed it

;; (use-package helm-rg
;;   :bind
;;   (("C-c r" . helm-rg)))

;; (use-package helm-rg
;;   :if (executable-find "rg")
;;   :ensure t
;;   :init
;;   (progn
;;     (setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:white' --smart-case --no-heading --line-number %s %s %s")
;;     (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:white'"))))
;;     ;; (general-setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
;;     ;; (general-setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))))

;; 
;; (if rg_exe
;;     ;; prot likes this: https://www.youtube.com/watch?v=4qLD4oHOrlc
;;     (use-package rg
;;       :init
;;       (rg-enable-default-bindings)
;;       :config
;;       (global-set-key [f5] 'rg))
;;   (global-set-key [f5] 'lgrep))

;; see also: Deft in org-roam section

;; (use-package ag
;;   :after counsel
;;   :config
;;   ;; supposed to work on Windows: https://github.com/abo-abo/swiper/issues/672
;;   (setq counsel-ag-base-command "ag --vimgrep --nocolor --nogroup %s")  
;;   ;; DOESN'T WORK.  Neither does counsel-ag
;;   ;; so can use ag inside of eshell. Installation: run alias ag 'ag-eshell $1' in eshell. This puts this elisp in emacs.d/eshell/alias, so need to do this for each install.
;;   ;; from: https://github.com/tomjakubowski/.emacs.d/issues/3
;;   (defun ag-eshell (string)
;;     "Search with ag using the current eshell directory and a given string.
;;    To be used from within an eshell alias
;;    (`alias ag 'ag-eshell $1'` within eshell)"
;;     (ag/search string (eshell/pwd))))

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

;; * Swiper/Ivy

;; Help while in ivy search:
;;  ivy hydra: C-o;
;;  ivy full help: C-h m
(use-package swiper
  :diminish ivy-mode
  :init
  ;;(setq ivy-use-virtual-buffers t) ; ivy-switch-buffer also shows recent files
  (setq ivy-count-format "(%d/%d) ") ; show candidate index/count in swiper
  ;; Search with swiper, handles org-mode headline unfold much better than helm
  ;; C-s C-w (extra C-w's expand region) also works well
  ;; I added -i to counsel-grep-base-command so grep is case-insensitive
  ;;  (fset 'swiper-func 'counsel-grep-or-swiper) ; uses grep for long files, esp. org

  ;; swiper-isearch is much faster than plain swiper:
  ;; https://oremacs.com/2019/04/07/swiper-isearch/
  ;; Are the matches different?
  ;; (fset 'swiper-func-forward 'swiper) ; standard swiper, slow on large org files
  ;; (fset 'swiper-func-backward 'swiper-backward) ; standard swiper,
  ;; slow on large org files
  ;; Note: could also experiment w/ swiper-isearch-toggle
  (fset 'swiper-func-forward 'swiper-isearch) ; standard swiper, slow on large org files
  (fset 'swiper-func-backward 'swiper-isearch-backward) ; standard swiper, slow on large org files

  ;; TODO: combine forward backward into one function instead of this hack
  ;; (defun sdo/swiper-region (isForward)
  ;;   "If region selected, swipe for it, else do normal swiper call"
  ;;   (interactive)
  ;;   (let ((swiper-func (if isForward swiper-func-forward swiper-func-backward)))
  ;;     (if mark-active
  ;;         (let ((region (funcall region-extract-function nil)))
  ;;           (deactivate-mark)
  ;;           (funcall swiper-func region))
  ;;       (funcall swiper-func))))
  ;;
  ;; (defun sdo/swiper-region-forward ()
  ;;   "If region selected, swipe for it forward, else do normal swiper call"
  ;;   (interactive)
  ;;   (sdo/swiper-region t))

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
  ;; ivy-views integrate with ivy-switch-buffer (See
  ;; https://oremacs.com/2016/06/27/ivy-push-view/).  That's probably
  ;; nice but I'm still using ido-switch-buffer b/c of its rectangular
  ;; grid view.  So, I've bound ivy-switch view to something close to switch-buffer.
  ;; NOTE: there is now an "ivy-grid" view: ivy-explorer, below.
  (global-set-key (kbd "C-c v") 'ivy-push-view)
  (global-set-key (kbd "C-c V") 'ivy-pop-view) ; works like delete
  (global-set-key (kbd "C-x V") 'ivy-switch-view)
  ;; actually, this seems to do the (nearly) same thing as C-s s
  (global-set-key (kbd "C-c C-r") 'ivy-resume) ;Resume last ivy completion sess
  (global-set-key (kbd "C-x B") 'ivy-switch-buffer-other-window )
  :config
  ;; for consistent backwards search binding within ivy minibuffer
  (bind-key "C-r" 'ivy-previous-line-or-history ivy-minibuffer-map)
  )

;; prescient sorts and filters candidate lists for ivy/counsel.
;; Does this sometimes stop ivy search from working?
;;
(use-package prescient
  :config
  (prescient-persist-mode)) ; persist across emacs sessions

;; prescient-sort-full-matches-first
;; prescient-use-char-folding
;; prescient-use-case-folding
;; prescient-save-file

(use-package ivy-prescient
  :after counsel ivy prescient
  :custom
  (ivy-prescient-mode t))
;; in docs but doesn't exist?  
;;  (ivy-prescient-retain-classic-highlighting t))

;; consider these counsel commands (from:
;; https://dev.to/deciduously/how-i-emacs-and-so-can-you-packages-m9p)
;; so far, I like: counsel-git, counsel-git-grep, 

;; ;; Override the basic Emacs commands
;; (use-package counsel
;;   :bind* ; load when pressed
;;   (("M-x"     . counsel-M-x)
;;    ("C-s"     . swiper)
;;    ("C-x C-f" . counsel-find-file)
;;    ("C-x C-r" . counsel-recentf)  ; search for recently edited
;;    ("C-c g"   . counsel-git)      ; search for files in git repo
;;    ("C-c j"   . counsel-git-grep) ; search for regexp in git repo
;;    ("C-c /"   . counsel-ag)       ; Use ag for regexp
;;    ("C-x l"   . counsel-locate)
;;    ("C-x C-f" . counsel-find-file)
;;    ("<f1> f"  . counsel-describe-function)
;;    ("<f1> v"  . counsel-describe-variable)
;;    ("<f1> l"  . counsel-find-library)
;;    ("<f2> i"  . counsel-info-lookup-symbol)
;;    ("<f2> u"  . counsel-unicode-char)
;;    ("C-c C-r" . ivy-resume)))     ; Resume last Ivy-based completion

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

  ;; TODO? use this to replace ido func, as in
  ;; https://github.com/nobiot/Zero-to-Emacs-and-Org-roam/blob/main/40.Qol.md
;; ?
  ;; this would mess up find-file guessing, etc. and ido grid-mode
;; (since ivy-explorer has probs and is unsupported)

  ;; (global-set-key (kbd "M-x") #'counsel-M-x)
;; This causes find-file to crash when in a scratch buffer, dired, and
;; a few other places.  It works fine or .org, .emacs and other
;; programming files.
;; It might have been causing org-roam problems too, so I commented it
;; out now.
;; Bug Report: https://github.com/clemera/ivy-explorer/issues/16
 ; ido-grid-mode for ivy: C-f/b/p/n/a/e navigate 
;; (use-package ivy-explorer
;;   :after ivy
;;   :diminish ivy-explorer-mode
;;   :init
;;   (ivy-explorer-mode 1))

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

;; ;; Is this needed anymore, since ivy-isearch is now (Apr 2019) so much faster?
;; (defun org-toggle-outline-visibility ()
;;   "Hides all subheadlines or restores original visibility before toggle.
;;    Eventually use this to speed up ivy by showing everything, searching and then unshowing everything."
;;   (interactive)
;;   ;; NAH, need to call "hide everything on one call; save outline on next.  Also, apparently need for arguments for org-save-outline-visibility:  see emacs help. 
;;   (org-save-outline-visibility nil))

;; * IDO Mode

;; TODO: find a new file that's like something already existing but shorter (so you can create a new file w/ a shorter name.  eg.s C-x C-x tmp   and there
;; is already a file named tmp.txt.  Or, renane a file to a shorter
;; version of its name e.g. rename tmp.txt to tmp.
;; I can't do this.  Ido and counsel-find-file both
;; have a problem in this situation.
;; Note: ido on find-file supposedly can be overriden with C-j (to validate) or
;; C-F (after you've narrowed options).  However, Evernote is
;; currently bound to C-F.
;; https://stackoverflow.com/questions/21007014/not-selecting-what-emacs-ido-is-suggesting
;; But neither option works. in the case of shorter name.
;;
;; Commentining out (ido-mode 1) and (ido-everywhere 1) fixes file
;; visiting but not file renaming.  Ivy is getting in the
;; way with naming: can force it to accept your shorter choice with C-M-j
;;
;; TODO: how to open a pdf with ido (mapped to C-x C-f).  Currently,
;; it doesn't use the system default (PDF Xchange editor) but instead
;; opens it in an emacs buffer.  Is Ivy any better?
;; Nope. counsel-find-file does it too.
;; In dired, I can open a pdf with the sytem pdf reader with 'W' key.
;; This calls browse-url-of-dired-file; hitting RETURN of 'f' calls
;; dired-find-file

;; Ido mode (a replacement for iswitchb and much else).  Much is in customizations
;; advice from: http://www.masteringemacs.org/article/introduction-to-ido-mode
;; See also sdo/get-recentf() in keybinding section, which (currently) uses ido
;; Ivy is fancier but I'm keeping Ido around because it has a nice
;; grid mode that isn't available for Ivy (but see ivy-explorer).
;;
;; Should be placed after ivy to avoid partial ivy overwrites of ido functions

;; Commenting out  these fixed renaming a file to a shorter but similar name
;;(ido-mode 1) ; https://github.com/DarwinAwardWinner/ido-completing-read-plus
;;(ido-everywhere 1)

;; From: http://stackoverflow.com/questions/17986194/emacs-disable-automatic-file-search-in-ido-mode
;; so it doesn't search for file completions in other directories.  Really
;; hoses up dired directory create, for example.
;;(setq ido-auto-merge-work-directories-length -1)

;; replaces emacs w/ ido in as many places as possible
;; https://github.com/DarwinAwardWinner/ido-completing-read-plus
;; (use-package ido-completing-read+
;;   :config (ido-ubiquitous-mode 1)) ; run it (almost) everywhere

;; how files are ordered in the ido mini-buffer
;; (setq ido-file-extensions-order '(".org" ".m" ".R" "_emacs" ".emacs" ".txt" ".py" ".pl" ".pm" ".el" ".c" ".cpp" ".h" ".rb" ".xml"))

;; (use-package ido-grid-mode ;; https://github.com/emacsmirror/ido-vertical-mode
;;   :config (ido-grid-mode 1))

;; (use-package flx-ido
;;   :init
;;   ;; copied from https://github.com/bdd/.emacs.d/blob/master/packages.el
;;   (setq gc-cons-threshold (* 20 (expt 2 20)) ido-use-faces nil) ; megabytes
;;   :config
;;   (flx-ido-mode 1)
;;   ;; disable ido faces to see flx highlights.
;;   (setq ido-enable-flex-matching t)
;;   (setq ido-use-faces nil))

;; ;; This disappeard from melpa, and I gues I'm not using it anyway
;; ;; ;; I also have a hydra set up to do counsel bindings but ido-describe-bindings is here because it also shows unicode chars (that I don't know how to activate with my keyboard, but at least they're there...)
;; ;; (use-package ido-describe-bindings
;; ;;   :config (global-set-key (kbd "C-h b") 'ido-describe-bindings))

;; ;; ido- matching for emacs commands: https://www.reddit.com/r/emacs/comments/1xnhws/speaking_of_emacs_modes_flx_flxido_ido_smex_helm/?st=iu1g56lu&sh=554484fb
;; (use-package smex
;;   :config
;;   (smex-initialize)
;;   (global-set-key (kbd "M-x") 'smex)
;;   (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;   ;; This is your old M-x.
;;   (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;; * Company Mode
;; Tab completion of variables, common words, ...  To activate (not a default): M-x company-mode or turn it on globally.

;; Used in other packages.  Here, make it prescient.  Maybe put this section in one of those places instead of here?
(use-package company-prescient
  :after company
  :init
  (company-prescient-mode))

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
	  '(lambda ()
	     (set (make-local-variable 'dabbrev-case-fold-search) t)
	     (set (make-local-variable 'dabbrev-case-replace) t)))

;; ** Google translate.

;; There are tons of customizations
;; https://github.com/atykhonov/google-translate
;;
;; TODO fix keybindings.  I have a syntax error of some kind
;;
;; (use-package google-translate
;;    :defer t
;;    :commands (google-translate-query-translate-reverse
;;                 google-translate-query-translate
;;                 google-translate-at-point
;;                 google-translate-at-point-reverse)
;;    :init
;;    (progn
;;      (bind-key "c-c t s"  'google-translate-smooth-translate)
;;      (bind-key "c-c t l" 'google-translate-query-translate-reverse)
;;      (bind-key "c-c t l" 'google-translate-query-translate)
;;      (bind-key "c-c t k" 'google-translate-at-point)
;;      (bind-key "c-c t k" 'google-translate-at-point-reverse))
;;    :config
;;    (setq google-translate-default-source-language "en")
;;    (setq google-translate-default-target-language "de")
;;    ;; use c-n to switch language translation direction
;;    (setq google-translate-translation-directions-alist '(("en" . "de") ("de" . "en")))
;;    ;; (org-babel-load-file "~/.emacs.d/init-google-translate.org") 
;;    )

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


;; windows hunbspell can't save to personal dict
;; my bug report: https://github.com/d12frosted/flyspell-correct/issues/97#issuecomment-923047599
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
  :config
  (setq ispell-dictionary "english"
        ispell-program-name aspell_bin)
  (when (equal (file-name-base ispell-program-name) "aspell")
    (add-to-list 'ispell-extra-args "--sug-mode=normal")))

(use-package flyspell
  :diminish flyspell-mode )

;; https://github.com/d12frosted/flyspell-correct
;; fails if you don't have ispell installed (or aspell or hunspell?)
;; hunspell expects dictionaries in ~/.hunspell (see howto.org)
(use-package flyspell-correct
  :after flyspell
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))

(use-package flyspell-correct-ivy
  :after flyspell-correct)

;; ** find repeated words
;; redundant since in writegood
;; (defun find-find-word-word ()
;;   (interactive)
;;   (re-search-forward "\\b\\(\\w+\\)\\W+\\1\\b"))
;; ;; (global-set-key "\e=" 'find-find-word-word) ; use this for goto-line-with-feedback

;; ** artbollocks
;; https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org
;; do I like this?
;; writegood-mode does similar things
;; (use-package artbollocks-mode
;;   :defer t
;;   :config
;;   (setq artbollocks-weasel-words-regex
;;         (concat "\\b" (regexp-opt
;;                        '("one of the"
;;                          "should"
;;                          "just"
;;                          "sort of"
;;                          "a lot"
;;                          "probably"
;;                          "maybe"
;;                          "perhaps"
;;                          "I think"
;;                          "really"
;;                          "pretty"
;;                          "nice"
;;                          "action"
;;                          "utilize"
;;                          "leverage") t) "\\b"))
;;   ;; Don't show the art critic words, or at least until I figure
;;   ;; out my own jargon
;;   (setq artbollocks-jargon nil))


;; ** writegood
(use-package writegood-mode)
  ;; :config
  ;; (global-set-key "\C-cg" 'writegood-mode)
  ;; (global-set-key "\C-c\C-gg" 'writegood-grade-level)
  ;; (global-set-key "\C-c\C-ge" 'writegood-reading-ease))

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

;; ** Latex

;; Note: while debugging, I uninstalled imagemagick (choco) and then reinstalled it on SB2.  But now magick .exe doesn't exist.
;; Skip it for now.
;;(sdo/find-exec "magick" "Imagemagick binary required by ein & latex preview")

;; Hack: (use-package auctex) doesn;t work because, "once installed, auctex overrides the tex package":
;; http://cachestocaches.com/2015/8/getting-started-use-package/
(use-package tex :defer t :ensure auctex) ; a hack for auctex
(use-package auctex-latexmk :defer t)

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (define-key LaTeX-mode-map "\C-xn"
	      nil)))

;; ** Bibtex
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


;;" Guru mode disables some common keybindings and suggests the use of the established Emacs alternatives instead."
;;(use-package guru-mode) ; nudges you to use

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
;; ** Font Size and Text Scaling

;; Change default font, changing frame size, keeping constant # chars in frame
(use-package default-text-scale
  :bind (("C-M-=" . default-text-scale-increase)
         ("C-M--" . default-text-scale-decrease)))

;; change text scale, keeping constant frame size while increasing size of chars
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
  :diminish beacon-mode
  :config
  (beacon-mode 1))

;; ** Modeline
(display-time-mode 1) ; time on the modeline (is customized)

;; From?: https://www.reddit.com/r/emacs/comments/722t6w/in_smartlinemode_how_to_only_view_buffername_and/dnffnoq/
(use-package smart-mode-line 
  :config
  (setq sml/theme nil) ; don't change existing modeline faces
  (sml/setup))

;;(setq sml/replacer-regexp-list '((".+" "")))

;; THIS ENDED UP PRODUCING LONG NAMES IN BUFFER in emacs 27.  The
;; default is better than this
;;
;; modeline filename is something like uniquified buffer name but has
;; project info.  I don't quite understand the logic for '|' vs. '/'
;; From:
;; https://www.reddit.com/r/emacs/comments/8xobt3/tip_in_modeline_show_buffer_file_path_relative_to/

;; (with-eval-after-load 'subr-x
;;   (setq-default mode-line-buffer-identification
;;                 '(:eval (format-mode-line (propertized-buffer-identification (or (when-let* ((buffer-file-truename buffer-file-truename)
;;                                                                                              (prj (cdr-safe (project-current)))
;;                                                                                              (prj-parent (file-name-directory (directory-file-name (expand-file-name prj)))))
;;                                                                                    (concat (file-relative-name (file-name-directory buffer-file-truename) prj-parent) (file-name-nondirectory buffer-file-truename)))
;;                                                                                  "%b"))))))

;; attempt to get just the unquified buffer name.  Didn't work.
;; (with-eval-after-load 'subr-x
;;   (setq-default mode-line-buffer-identification
;;                 'buffername))


;; ;; TODO: try https://github.com/seagle0128/doom-modeline
;;Not pretty out of the box, but is good for long filenames: uses
;;buffer-name, which I have set to be uniquified.
;; (use-package doom-modeline
;;   :config
;;   (setq doom-modeline-buffer-file-name-style 'buffer-name)
;;   :hook (after-init . doom-modeline-mode))

;; ** Shell Look (xterm, eshell, etc.)

;; ANSI & XTERM 256 color support
;; From: https://github.com/seagle0128/.emacs.d/blob/master/lisp/init-shell.el
(use-package xterm-color
  :defines (compilation-environment
            eshell-preoutput-filter-functions
            eshell-output-filter-functions)
  :functions (compilation-filter my-advice-compilation-filter)
  :init
  ;; For shell and interpreters
  (setenv "TERM" "xterm-256color")
  (setq comint-output-filter-functions
        (remove 'ansi-color-process-output comint-output-filter-functions))
  (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
  (add-hook 'shell-mode-hook
            (lambda ()
              ;; Disable font-locking to improve performance
              (font-lock-mode -1)
              ;; Prevent font-locking from being re-enabled
              (make-local-variable 'font-lock-function)
              (setq font-lock-function #'ignore)))

  ;; For eshell
  (with-eval-after-load 'esh-mode
    (add-hook 'eshell-before-prompt-hook
              (lambda ()
                (setq xterm-color-preserve-properties t)))
    (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
    (setq eshell-output-filter-functions
          (remove 'eshell-handle-ansi-color eshell-output-filter-functions)))

  ;; For compilation buffers
  (setq compilation-environment '("TERM=xterm-256color"))
  (defun my-advice-compilation-filter (f proc string)
    (funcall f proc
             (if (eq major-mode 'rg-mode) ; compatible with `rg'
                 string
               (xterm-color-filter string))))
  (advice-add 'compilation-filter :around #'my-advice-compilation-filter)
  (advice-add 'gud-filter :around #'my-advice-compilation-filter))

;; ** Other

(show-paren-mode 1) ; turn on blinking parens

;; visual line mode messes up org-tables but is GREAT for everything else.
(global-visual-line-mode +1) ; soft line wrapping
(global-set-key (kbd "C-c t") 'toggle-truncate-lines) ; e.g. to view org-mode tables
;;(global-set-key (kbd "C-c w") 'toggle-truncate-lines) ; e.g. to view org-mode tables

(column-number-mode 1) ; in mode-line
(mouse-avoidance-mode 'animate)  ; get mouse out of way of cursor, is customized

(auto-fill-mode -1)  ; don't do autofill: do visual wrap instead
;; in case some other mode sets this hook in text mode
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

;; Sets the wrap-prefix property on the fly so that single-long-line
;; paragraphs get word-wrapped in a way similar to what you'd get with
;; M-q using adaptive-fill-mode, but withouth changing text so doesn't
;; mess up visual line mode. However, it doesn't indent 2nd line numbered or lettered lists
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
;; runs when type M-q
(use-package unfill
  :bind ([remap fill-paragraph] . unfill-toggle))

;; turn off the bell
(setq bell-volume 0)
(setq sound-alist nil)
(setq visible-bell t)
;; turn off the annoying alarm bell (is this redundant?)
(setq ring-bell-function 'ignore)

;; * Outside World
;; ** Weather
;;
;; SEEMS BROKEN, as of Feb 2021
;; The problem might be known, and there's an unmerged PR to fix it (could try
;; *straight to get it?)
;; https://github.com/bcbcarl/emacs-wttrin/issues/16

;; M-x wttrin to start, 'g' to next city, 'q' qo quit
(use-package wttrin
  :ensure t
  :commands (wttrin wttrin-query wttrin-exit)
  :init
  (setq wttrin-default-cities '("Seattle"
                                "Alexandria, MN"
                                "Minneapolis"
                                "New York"
                                "Copenhagen, Denmark"
                                "Bayreuth, Germany")))
;; Originally from: http://pragmaticemacs.com/emacs/weather-in-emacs/
;; Rewritten to remove dependence on obsolete frame-cmds pkg, and to
;; clean up after itself at quit (sdo in Jan 2020)

;; Function to open wttrin with first city on list
(defun sdo/wttrin ()
  "Open `wttrin' without prompting, using first city in `wttrin-default-cities'.  Window is sized to fit wttrn display."
  (interactive)
  (setq pre-wttrin-frame-config (current-frame-configuration))
  (delete-other-windows)
  (set-frame-width (selected-frame) 130)
  (set-frame-height (selected-frame) 48)
  (set-background-color "black") ;; goes away after do wttrn 'q'
  (set-foreground-color "gray")
  (wttrin-query (car wttrin-default-cities)))

(defun sdo/wttrin-restore-frame ()
  "Remove all *wttr.in buffers, then restore frame and window configuration saved prior to launching wttrin."
  (interactive)
  (kill-matching-buffers "*wttr.in - *" nil t)
  (set-frame-configuration pre-wttrin-frame-config))
(advice-add 'wttrin-exit :after #'sdo/wttrin-restore-frame)

;; * Variables Set By Emacs's built-in Customization Interface 
;; ** Custom Set Variables

;; '(w32shell-cygwin-bin "C:\\cygwin64\\bin"))

;; ** Custom Set Faces

;; For Macbook Pro
;; '(default ((t (:inherit nil :extend nil :stipple nil :background
;; "#ffffff" :foreground "#000000" :inverse-video nil :box nil
;; :strike-through nil :overline nil :underline nil :slant normal
;; :weight normal :height 120 :width normal :foundry "nil" :family
;; "Consolas"))))

;; For windows PCs
;; '(default ((t (:inherit nil :stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 102 :width normal :foundry "outline" :family "Consolas"))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(org-roam-link ((t (:foreground "dark goldenrod"))))
 '(org-table ((t (:background "honeydew1" :foreground "gray0"))))
 '(org-tag ((nil (:foreground "dark green" :slant italic :weight bold))))
 '(org-target ((t (:foreground "dark slate blue" :weight bold))))
 '(org-todo ((t (:foreground "Firebrick" :weight normal))))
 '(org-verbatim ((t (:inherit shadow :weight bold))))
 '(org-warning ((t (:foreground "firebrick" :weight normal))))
 '(region ((t (:background "LightSteelBlue1"))))
 '(sml/modified ((t (:inherit sml/not-modified :foreground "firebrick" :weight bold))))
 '(table-cell-face ((t (:background "honeydew1" :foreground "black" :inverse-video nil))))
 '(writegood-duplicates-face ((t (:foreground "black" :strike-through t :underline "firebrick1"))))
 '(writegood-passive-voice-face ((t (:foreground "LightBlue4" :underline t :weight bold))))
 '(writegood-weasels-face ((t (:foreground "dark khaki" :underline t :weight bold)))))
