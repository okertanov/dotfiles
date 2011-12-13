;;
;; Copyright (c) 2011 Oleg Kertanov <okertanov@gmail.com>
;;
;; ui.el - ux configuration

;; Window
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(unless (eq system-type 'darwin) (menu-bar-mode -1))

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


(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(setq whitespace-line-column 100)

;; Theme
;;(load-theme 'zenburn t)
(load-theme 'solarized-light t)

(set-face-background 'region "pink") ; Set region background color
;;(set-background-color        "wheat3") ; Set emacs bg color

;; Fonts
(when (eq system-type 'windows-nt)
    (if window-system
        (set-face-attribute 'default nil :font "Courier New-13")))

;; Module
(provide 'ui)
