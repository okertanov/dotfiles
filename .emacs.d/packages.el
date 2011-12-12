;; packages.el - ux configuration

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; For the Clojure
(require 'clojure-mode)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;; No version control please
(setq vc-handled-backends ())

;; Module
(provide 'packages)
