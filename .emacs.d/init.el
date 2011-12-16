;;
;; Copyright (c) 2011 Oleg Kertanov <okertanov@gmail.com>
;;
;; init.el - configuration entry point
;; Based on https://github.com/mathieulegrand/Emacs-configuration/blob/master/init.el
(message "%s" "Emacs!")

;; Runtime directory
(defvar base-dir (file-name-directory (or (buffer-file-name) load-file-name))
  "Base directory")
(defvar base-vendor-dir (concat base-dir "vendor/")
  "Emacs packages")

(add-to-list 'load-path base-dir)
(add-to-list 'load-path base-vendor-dir)

;; System directories
  (push "~/bin" exec-path)
  (push "~/.lein/bin" exec-path)

;; Custom Emacs 24 color themes support
(defvar themes-dir (concat base-dir "themes/")
  "Custom themes")
(defvar solarized-themes-dir (concat themes-dir "emacs-color-theme-solarized/")
  "Custom themes")

(add-to-list 'custom-theme-load-path themes-dir)
(add-to-list 'custom-theme-load-path solarized-themes-dir)
(add-to-list 'load-path solarized-themes-dir)

;; Core configuration
(require 'packages)
(require 'ui)
(require 'editor)
(require 'orgmode)
(require 'development)

