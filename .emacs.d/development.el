;; development.el - emacs is a programmer's editor too

;; Grand Unified Debugger (allows you to do M-x gdb)
(require 'gud)

;; Templates and snippets
(defun snippet-copyright-cpp-comment ()
  "Insert C/C++ style copyright comment"
  (interactive)
  (insert "//") (newline)
  (insert (format "// Copyright (c) %s %s <%s>"
           (format-time-string "%Y") user-name-long user-mail-address)) (newline)
  (insert "//") (newline)
  (previous-line 1)(end-of-line))

(defun my-c-c++-mode-hook()
    (define-key c-mode-base-map [f9] 'snippet-copyright-cpp-comment))

(add-hook 'c++-mode-hook 'my-c-c++-mode-hook)
(add-hook 'c-mode-hook   'my-c-c++-mode-hook)

;; Module
(provide 'development)
