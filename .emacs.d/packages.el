;;
;; Copyright (c) 2011 Oleg Kertanov <okertanov@gmail.com>
;;
;; packages.el - ux configuration
;;
;; M-x eval-buffer
;; M-x package-refresh-contents
;; M-x package-install pkg-name
;;

(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Clojure
;; https://github.com/technomancy/clojure-mode
;; (require 'clojure-mode)
;; (defun turn-on-paredit () (paredit-mode 1))
;; (add-hook 'clojure-mode-hook 'turn-on-paredit)

;; Markdown
;; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; Rainbow delimiters
(when (require 'rainbow-delimiters nil 'noerror)
  (add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode))

(global-rainbow-delimiters-mode)

;; No version control please
(setq vc-handled-backends ())

;; Module
(provide 'packages)
