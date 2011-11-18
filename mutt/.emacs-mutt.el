
;;Emacs for Mutt

(add-to-list 'load-path "~/elisp")

;; mail-mode hook
(setq
  auto-mode-alist
  ( cons '("/tmp/mutt-.*" . mail-mode) auto-mode-alist )
  )
(add-hook 'mail-mode-hook 'turn-on-auto-fill)

(add-hook 'mail-mode-hook (function
                           (lambda ()
                             (flyspell-mode 1)
                             (footnote-mode t)
                             (show-paren-mode t)
                             ;;(ruler-mode t)
                             (abbrev-mode t)
                             (setq skeleton-pair t)
                             )))


;; 'ispell-minor-mode (flyspell-mode t))

;; Set user names
(setq user-full-name "Balaji N")
(setq user-login-name "balajin")

;; Color Themes
(require 'color-theme)
(color-theme-charcoal-black)

;; ;;turn off bell
(setq visible-bell t)

;;set to delete highlighted text using BSPACE & DEL key
(delete-selection-mode t)

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; highlight regions of text
(transient-mark-mode t)

;; allows shifted cursor-keys to control the region.
(setq shift-select-mode t)

;; Make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;;word wrap at 72
(setq fill-column 72)

;;Enable to auto fill 
(auto-fill-mode 1)

;; Moving cursor down at bottom scrolls only a
;; single line, not half page
(setq scroll-step 1)
(setq scroll-conservatively 5)

;;Fix delete under linux / xterms
(normal-erase-is-backspace-mode 1) 

;;(flyspell-mode t)
