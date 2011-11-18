;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs --- 
;; Author          : Balaji N
;; Created On      : Wed Nov  2 18:47:58 2005
;; Last Modified By: Balaji N
;; Last Modified On: Tue Dec  4 16:08:32 2007
;; Update Count    : 40
;; Status          : Unknown, Use with caution!
;; $Id: Exp $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Emacs version
;; [balajin@balajin dotfiles] $ emacs -version
;; GNU Emacs 21.3.1
;; Copyright (C) 2002 Free Software Foundation, Inc.
;; GNU Emacs comes with ABSOLUTELY NO WARRANTY.
;; You may redistribute copies of Emacs
;; under the terms of the GNU General Public License.
;; For more information about these matters, see the file named COPYING.


(require 'cl)

( setq
  auto-mode-alist
  ( cons '("/tmp/muttng-.*" . mail-mode-hook) auto-mode-alist )
  )
(add-hook 'mail-mode-hook 'turn-on-auto-fill)


;; Set user names
(setq user-full-name "Balaji N")
(setq user-login-name "balajin")

;; install all custom libraries to elisp
(add-to-list 'load-path "~/elisp")

;; load ngnus
(setq load-path (cons "~/elisp/ngnus-0.3/lisp" load-path))
(require 'gnus-load)
(require 'info)
(setq Info-default-directory-list
      (cons "~/elisp/ngnus-0.3/texi" Info-default-directory-list))
(setq load-path (cons "~/elsip/bbdb-2.35/lisp/" load-path))

;; Color Themes
(require 'color-theme)
;; (color-theme-robin-hood)
;;(color-theme-subtle-hacker)
;;(color-theme-wheat)
(color-theme-charcoal-black)

;; How to add a function to be loaded on startup
;; (defun my-onload()
;;   (color-theme-wheat)
;; )
;; (add-hook 'after-init-hook 'my-onload)

(setq message-log-max 500)

;; ;;turn off bell
(setq visible-bell t)

(require 'header)

(global-font-lock-mode t)

;; Redefine some keys.
(global-set-key "\C-z" 'goto-line) ;;mapped it to iconize key
;; use ctrl TAB to cycle thru buffers
(global-set-key [(control tab)] 'bury-buffer)
(global-set-key [kp-delete] 'delete-char)

;;get the filename in the title
(setq frame-title-format "%f")

;;default file type as
(setq default-buffer-file-coding-system 'undecided-unix)

;;; kbd-macro stuff ===============
(global-set-key (kbd "<f11>")     'start-kbd-macro)
(global-set-key (kbd "<C-f11>")   'end-kbd-macro)
(global-set-key (kbd "<f12>")     'call-last-kbd-macro)
(global-set-key (kbd "<C-f12>")     'apply-macro-to-region-lines)

;; (defun init-macro-counter-default ()
;; "sets the initial counter to 1; resets every time it's called;
;; toset to a different value call kmacro-set-counter
;; interactivelyi.e M-x kmacro-set-counter "
;; (interactive)
;; (kmacro-set-counter 1))

;; (global-set-key (kbd "<f5>") 'init-macro-counter-default)
;; (global-set-key (kbd "<f6>") 'kmacro-insert-counter)

;;;map Meta o to toggle to other buffer
(global-set-key [(meta o)]
                (lambda ()
                  (interactive)
                  (switch-to-buffer (other-buffer))))

;;be able to open tar,gzip files
(auto-compression-mode 1)

;; ;;color slowly,loads faster
;; (setq font-lock-maximum-decoration t )
;; (setq font-lock-support-mode 'jit-lock-mode)

;;set to delete highlighted text using BSPACE & DEL key
(delete-selection-mode t)

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; highlight regions of text
(transient-mark-mode t)

;; Make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; ;;;enable narrowing
;; (put 'narrow-to-region 'disabled nil)

;show time on status bar
(display-time)

;; allow for recursive deletes in dired after top-level confirmation
(setq dired-recursive-deletes 'top)

;; need the column position too in the mode line
(setq column-number-mode t)

;; If no other mode indicated, use Text as Major Mode
(setq default-major-mode 'text-mode) ;default mode

;;word wrap at 72
(setq fill-column 72)

;;show which function we are in
(which-func-mode t)

;; (put 'upcase-region 'disabled nil)
;; (put 'downcase-region 'disabled nil)

;; Abbreviations
(setq abbrev-file-name "~/elisp/abbrev_defs")
(when (file-exists-p abbrev-file-name)
  (quietly-read-abbrev-file))

(add-hook 'text-mode-hook (function
                           (lambda ()
                             (setq ispell-parser 'tex)
                             (ispell-minor-mode)
                             (local-set-key (kbd "<f5>") 'init-macro-counter-default)
                             (local-set-key (kbd "<f6>") 'kmacro-insert-counter)
                             (local-set-key "\M-\t" 'ispell-complete-word)
                             (flyspell-mode 1)
                             (footnote-mode t)
                             (show-paren-mode t)
                             (setq fill-column 70)
                             (auto-fill-mode 1)
                             ;;(ruler-mode t)
                             (abbrev-mode t)
                             (setq skeleton-pair t)
                             )))

;; (require 'simple)


;; ;;end of menu-item add
;; ;; -----------------------------------------------------------------
;; ;; AUC TeX
;; (require 'tex-site)
;; ;; ;;; some basic customizations
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)
;; (setq LaTeX-section-hook
;;       '(LaTeX-section-heading
;;         LaTeX-section-title
;;         LaTeX-section-toc
;;         LaTeX-section-section
;;         LaTeX-section-label))
;; ;; Only parse \documentstyle information.
;; (setq-default TeX-auto-regexp-list 'LaTeX-auto-minimal-regexp-list)
;; ;; The documentstyle command is usually near the beginning.
;; (setq-default TeX-auto-parse-length 2000)

;; ;; ;;; default Style and Options.
;; (setq LaTeX-default-style "scrartcl")
;; (setq LaTeX-default-options "a4paper,12pt,draft")

;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX t)
;; (setq reftex-enable-partial-scans t)
;; (setq reftex-save-parse-info t)
;; (setq reftex-use-multiple-selection-buffers t)
;; (add-hook 'LaTeX-mode-hook
;;           (function (lambda ()
;;                       (setq fill-column 68)
;;                       (auto-fill-mode t)
;;                       (flyspell-mode 1)
;;                       (ruler-mode t)
;;                       (paren-toggle-matching-quoted-paren 1)
;;                       (paren-toggle-matching-paired-delimiter 1))))
;; (setq reftex-load-hook (quote(imenu-add-menubar-index)))
;; (setq reftex-mode-hook (quote (imenu-add-menubar-index)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;enable narrowing
(put 'narrow-to-region 'disabled nil)

;; Ispell has it's own coding-system support which is broken under W32
(setq ispell-dictionary-alist
      '((nil "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B") nil raw-text-dos)
        ("american" "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B")
         nil raw-text-dos)
        ("british" "[A-Za-z]" "[^A-Za-z]" "[']" nil
        ("-B" "-d" "british") nil raw-text-dos)
      ("english" "[A-Za-z]" "[^A-Za-z]" "[']" nil ("-B")
       nil raw-text-dos)))

(autoload 'ispell-word "ispell"
  "Check the spelling of word in buffer." t)
(global-set-key "\e$" 'ispell-word)
(autoload 'ispell-region "ispell"
  "Check the spelling of region." t)
(autoload 'ispell-buffer "ispell"
  "Check the spelling of buffer." t)
(autoload 'ispell-complete-word "ispell"
  "Look up current word in dictionary and try to complete it." t)


(global-set-key [M-tab] 'ispell-complete-word)

;; (setq tex-mode-hook '(lambda ()
;;                        (local-set-key "\M-\t" 'ispell-complete-word)))
;; (setq latex-mode-hook '(lambda ()
;;                          (local-set-key "\M-\t" 'ispell-complete-word)))
;; (setq ispell-enable-tex-parser t)
;; This is added for GNU-WIN32 version of ispell--
;; it's necessary so that the emacs file offsets match up with
;; the list of offsets returned by :file filename...
(setq buffer-file-type t)

;;;;;;
;;;;;;;; mic parentheses
;; (when (or (string-match "XEmacs\\|Lucid" emacs-version) window-system)
;;   (require 'mic-paren) ; loading
;;   (paren-activate))     ; activating
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Backup all files in this directory
(setq backup-directory-alist (quote (("." . "~/backup"))))

;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(backup-directory-alist (quote (("." . "~/backup"))))
;;  '(bbdb-get-addresses-headers (quote ((authors "From" "Resent-From"
;; "Reply-To") (recipients "Resent-To" "Resent-CC" "To" "Cc" "CC"
;; "BCC"))))
;;  '(bbdb-get-only-first-address-p nil)
;;  '(bbdb-info-file "~/emacs/bbdb-2.35/info/bbdb.info")
;;  '(bbdb-use-pop-up nil)
;;  '(flyspell-sort-corrections t)
;;  '(global-hl-line-mode nil nil (hl-line))
;;  '(inhibit-startup-message t)
;;  '(woman-manpath (quote ("/usr/man" "/usr/share/man" "/usr/local/man"
;; "/usr/X11R6/man"))))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(flyspell-incorrect-face ((t (:foreground "OrangeRed" :box
;; (:line-width 2 :color "grey75" :style released-button) :underline t
;; :weight bold))))
;;  '(gnus-header-content-face ((t (:foreground "cyan" :slant italic
;; :weight bold))))
;;  '(gnus-header-from-face ((t (:foreground "cyan"))))
;;  '(gnus-header-name-face ((((class color) (background dark))
;; (:foreground "Green" :weight bold))))
;;  '(gnus-header-newsgroups-face ((t (:foreground "yellow" :slant italic
;; :weight bold))))
;;  '(gnus-header-subject-face ((((class color) (background dark))
;; (:foreground "orange" :weight bold))))
;;  '(gnus-signature-face ((t (:slant italic :weight bold))))
;;  '(message-cited-text-face ((((class color) (background dark))
;; (:foreground "coral"))))
;;  '(message-header-cc-face ((t (:foreground "aquamarine" :weight bold))))
;;  '(message-header-name-face ((((class color) (background dark))
;; (:foreground "yellow" :weight bold))))
;;  '(message-header-other-face ((((class color) (background dark))
;; (:foreground "hotpink1"))))
;;  '(message-header-subject-face ((((class color) (background dark))
;; (:foreground "pink" :weight bold))))
;;  '(message-header-to-face ((t (:foreground "aquamarine" :weight bold))))
;;  '(message-header-xheader-face ((((class color) (background dark))
;; (:foreground "cyan" :weight extra-bold))))
;;  '(message-separator-face ((((class color) (background dark))
;; (:foreground "cornsilk")))))

;;;;delete blank lines in region
(defun delete-blank-lines-region ()
  "Delete blank lines in the region.  If the mark is not set or
inactive, act like `delete-blank-lines'."
  (interactive)
  (if mark-active
      (save-excursion
        (save-restriction
          (narrow-to-region (point) (mark))
          (goto-char (point-min))
          (delete-matching-lines "^[ \t]*$")))
    (delete-blank-lines)))

(defadvice dired-advertised-find-file (around dired-subst-directory activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
 (filename (dired-get-filename)))
    ad-do-it
    (when (and (file-directory-p filename)
        (not (eq (current-buffer) orig)))
      (kill-buffer orig))))

;; For Gnus
;; Directory variable from which all other Gnus file variables are derived.
(setq gnus-directory "~/personal/gnus/")
(setq message-directory "~/personal/gnus/")
(setq gnus-dribble-directory "~/personal/gnus")

;; For opening links in firefox
;; open a new url in a tab in an existing browser window. if none are
;; found, launch a new browser instance.
(defun browse-url-firefox-new-tab (url &optional new-window)
  "Open URL in a new tab in Mozilla."
  (interactive (browse-url-interactive-arg "URL: "))
  (unless
      (string= ""
          (shell-command-to-string
      (concat "firefox -remote 'openURL(" url ",new-tab)'")))
    (message "Starting Firefox...")
    (start-process (concat "firefox " url) nil "firefox" url)
    (message "Starting Firefox...done")))

(setq       ;; click url in text buffers.
       gnus-button-url 'browse-url-generic
       browse-url-generic-program "firefox"
       browse-url-browser-function 'browse-url-firefox-new-tab
)


;; Moving cursor down at bottom scrolls only a
;; single line, not half page
(setq scroll-step 1)
(setq scroll-conservatively 5)

;; VI style paren matching.
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
   ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
   (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)   ; vi style paren matching.

;; Htmlizeing files
(require 'htmlize)


;; For fortune
;; Ensure fortune.el is in path
(autoload 'fortune "fortune" nil t)
(autoload 'fortune-add-fortune "fortune" nil t)
(autoload 'fortune-from-region "fortune" nil t)
(autoload 'fortune-compile "fortune" nil t)
(autoload 'fortune-to-signature "fortune" nil t)

;; For html mode
(autoload 'html32-mode "html32-mode" "HTML major mode." t)
(add-to-list 'auto-mode-alist '("\\.\\(html\\|htm\\|shtml\\)$" . html32-mode))


;; For eshell
;;(add-to-list 'load-path "~/elisp/eshell-2.4.2")
;;(add-to-list 'load-path "elisp/pcomplete-1.1.7")
;;(load "eshell-auto")
;; Auto load a few shells
;;(shell)
;;(rename-buffer "tail")
;;(shell)
;;(rename-buffer "build")
;;(shell)
;;(rename-buffer "work")
(custom-set-faces)

(setq-default comint-output-filter-functions
 '(comint-watch-for-password-prompt))
(setq comint-password-prompt-regexp "\\(\\([Oo]ld \\|[Nn]ew \\|balajin@.* \\|^\\)[Pp]assword\\|Enter password\\|[Pp]assphrase\\|Enter passphrase.*\\):\\s *\\'")

;; Tells emacs to use the backspace key to delete characters backward
;;(define-key global-map "\C-h" 'backward-delete-char-untabify)
;; (define-key global-map "\f2" 'bookmark-set)
;; (define-key global-map "\f3" 'bookmark-jump)


;; Long lines - For soft word wrap instead of hard
(autoload 'longlines-mode  "longlines.el" "Minor mode for automatically wrapping long lines." t)
;;(add-hook 'text-mode-hook 'longlines-mode)

;; For Tramp
(require 'tramp)
(setq tramp-default-method "scp")

;; configure css-mode
(autoload 'css-mode "css-mode")
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-indent-level '2)

;; For PHP
(autoload 'php-mode "php-mode" "Mode for editing PHP source files")
;;(add-to-list 'auto-mode-alist '("\\.\\(inc\\|php[s34]?\\)" . php-mode))
(add-hook 'php-mode-user-hook 'turn-on-font-lock)


;; For MM-mode/home/balajin/elisp/mmm-mode-0.4.8
(add-to-list 'load-path "~/elisp/mmm-mode-0.4.8")
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

;; set up an mmm group for fancy html editing
(mmm-add-group
 'fancy-html
 '(
   (html-php-tagged
    :submode php-mode
    :face mmm-code-submode-face
    :front "<[?]php"
    :back "[?]>")
   (html-css-attribute
    :submode css-mode
    :face mmm-declaration-submode-face
    :front "style=\""
    :back "\"")))
;;
;; What files to invoke the new html-mode for?
(add-to-list 'auto-mode-alist '("\\.inc\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.[sj]?html?\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . html-mode))
;;
;; What features should be turned on in this html-mode?
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-js))
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil embedded-css))
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil fancy-html))

;; For Planner
;; To load timeclock last
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/planner-el" t) 
(add-to-list 'load-path "~/elisp/planner-configs")
(require 'planner-configs)


;; Emacs server using screen server
(require 'screenserver)

(set-face-font 'default "-adobe-courier-bold-r-normal--14-140-75-75-m-90-iso8859-1")

