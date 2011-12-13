;;
;; Copyright (c) 2011 Oleg Kertanov <okertanov@gmail.com>
;;
;; org.el - my org-mode
;; see http://orgmode.org/

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files
    (list "~/DropBox/Sync/orgmode/life.org"))

(add-hook 'org-mode-hook
    (lambda ()
        "file-based visibility settings are used instead of (show-all)"))

;; Module
(provide 'orgmode)
