;;
;; Copyright (c) 2011 Oleg Kertanov <okertanov@gmail.com>
;;
;; development.el - emacs is a programmer's editor too

;; Grand Unified Debugger (allows you to do M-x gdb)
(require 'gud)

;; Templates and snippets - common functions
(defun copyright-comment (csym)
  "Inserts copyright comment"
    (interactive)
    (insert csym) (newline)
    (insert (format "%s Copyright (c) %s %s <%s>"
                csym (format-time-string "%Y") user-name-long user-mail-address))
    (newline)
    (insert csym) (newline)
    (previous-line 1)(end-of-line))

;; Templates and snippets - C/C++
(defun my-c-c++-mode-hook(mmap)
    (define-key mmap [f9]
        (lambda()(interactive)(copyright-comment "//"))))

(add-hook 'c-mode-hook
    (lambda()(my-c-c++-mode-hook c-mode-map)))
(add-hook 'c++-mode-hook
    (lambda()(my-c-c++-mode-hook c++-mode-map)))

;; Templates and snippets - lisp, elisp, scheme
(defun my-lisp-mode-hook(mmap)
    (define-key mmap [f9]
        (lambda()(interactive)(copyright-comment ";;"))))

(add-hook 'lisp-mode-hook
    (lambda()(my-lisp-mode-hook lisp-mode-map)))
(add-hook 'emacs-lisp-mode-hook
    (lambda()(my-lisp-mode-hook emacs-lisp-mode-map)))
(add-hook 'scheme-mode-hook
    (lambda()(my-lisp-mode-hook scheme-mode-map)))

;; Module
(provide 'development)