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
(defvar base-custom-dir (concat base-dir "modules/")
  "Custom packages")

(add-to-list 'load-path base-dir)
(add-to-list 'load-path base-vendor-dir)
(add-to-list 'load-path base-custom-dir)

;; System directories
(push "~/bin" exec-path)
(push "~/.lein/bin" exec-path)

;; Darwin system directories
(if (eq system-type 'darwin)
    (push "/usr/local/bin" exec-path))

;; Timestamps appear in English
(setq system-time-locale "C")

;; Core configuration
(require 'packages)
(require 'editor)
(require 'ui)
(require 'development)
(require 'orgmode)
(require 'clojure)
