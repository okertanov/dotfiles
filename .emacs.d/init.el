;; init.el - configuration entry point
;; Based on https://github.com/mathieulegrand/Emacs-configuration/blob/master/init.el
(message "%s" "Emacs!")

;; Runtime directory
(defvar base-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(defvar base-vendor-dir (concat base-dir "vendor/") "Emacs packages")

(add-to-list 'load-path base-dir)
(add-to-list 'load-path base-vendor-dir)

;; Core configuration
(require 'ui)
(require 'editor)
(require 'packages)
