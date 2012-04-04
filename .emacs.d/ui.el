;;
;; Copyright (c) 2011 Oleg Kertanov <okertanov@gmail.com>
;;
;; ui.el - ux configuration

;; Window
(when window-system
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  ;(unless (eq system-type 'darwin) (menu-bar-mode -1))
  )

;; Suppress messages
(setq inhibit-splash-screen t)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)

;; Mode line settings
(setq-default indicate-empty-lines 'nil)
(setq global-font-lock-mode t)
(setq line-number-mode t)
(setq column-number-mode t)
(setq desktop-save-mode t)
(setq desktop-save t)
(blink-cursor-mode -1)

;; No bell
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Whitespaces
(setq whitespace-style
      '(trailing lines space-before-tab indentation space-after-tab))
(setq whitespace-line-column 100)
(whitespace-mode)

;; Custom Emacs 24 color themes support
(defvar themes-dir (concat base-dir "themes/")
  "Custom themes")
(defvar solarized-themes-dir (concat themes-dir "emacs-color-theme-solarized/")
  "Custom themes")

(add-to-list 'custom-theme-load-path themes-dir)
(add-to-list 'custom-theme-load-path solarized-themes-dir)
(add-to-list 'load-path solarized-themes-dir)

;; Apply theme
;;(load-theme 'zenburn t)
(load-theme 'solarized-light t)

;; Cistomize appearance
(set-face-background 'region "pink") ; Set region background color
;;(set-face-foreground 'default "blue")
;;(set-face-background 'default "green")
;;(set-background-color "lightgrey")

;; OSX font and cursor
(when (eq system-type 'darwin)
    (when (window-system)
        (set-cursor-color "darkgrey")
        (set-face-attribute 'default nil :font "Melno-16")))

;; Windows font
(when (eq system-type 'windows-nt)
    (when (window-system)
        (set-face-attribute 'default nil :font "Courier New-13")))

;; Maximized on Windows
(when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488))

;; Module
(provide 'ui)
