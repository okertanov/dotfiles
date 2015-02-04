;;
;; Copyright (c) 2011 Oleg Kertanov <okertanov@gmail.com>
;;
;; packages.el - ux configuration
;;
;; M-x eval-buffer
;; M-x package-refresh-contents
;; M-x package-install pkg-name

(require 'package)

(add-to-list 'package-archives
    '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

;; Module
(provide 'packages)
