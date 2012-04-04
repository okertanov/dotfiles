;;
;; Copyright (c) 2011 Oleg Kertanov <okertanov@gmail.com>
;;
;; clojure.el - my clojure-related

;; Clojure
;; https://github.com/technomancy/clojure-mode
(when (require 'clojure-mode nil 'noerror)
    (defun turn-on-paredit () (paredit-mode 0))
    (add-hook 'clojure-mode-hook 'turn-on-paredit))

;; Module
(provide 'clojure)
