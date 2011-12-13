;; editor.el - main emacs editor configuration

;; User configuration

(setq user-mail-address "okertanov@gmail.com")

;; Darwin
(if (eq system-type 'darwin)
    (push "/usr/local/bin" exec-path))

;; Encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

;; Editor
(cua-mode 1)
(setq cua-keep-region-after-copy t)

(setq default-tab-width 4)
(setq-default tab-width 4)

;; Search and Replace
(setq search-highlight           t)
(setq query-replace-highlight    t)
(setq mouse-sel-retain-highlight t)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Backups
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

; Native-Windows Keybindings
   (global-set-key [C-tab] 'other-window)
   (global-set-key [M-f4] 'save-buffers-kill-emacs)
   (global-set-key "\C-a" 'mark-whole-buffer)
   (global-set-key "\C-f" 'isearch-forward)
   (global-set-key "\C-o" 'find-file)
   (global-set-key "\C-s" 'save-buffer)
   (global-set-key "\C-w" 'kill-this-buffer)
   (global-set-key (kbd "C-S-o") 'open-line)
   (global-set-key (kbd "C-S-w") 'kill-region)
   (define-key global-map (kbd "RET") 'newline-and-indent) ; For programming language modes
   (define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

;; Other Keybindings
(cond ((window-system)
       (global-set-key (kbd "<C-tab>") 'bury-buffer)
       (global-set-key (kbd "<C-S-iso-lefttab>") 'unbury-buffer)))

(auto-compression-mode t)
(setq message-log-max 100)

;; smart indenting and pairing for all
(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

;; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings 'super)

;; show-paren-mode: subtle highlighting of matching parens
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
;; (defface hl-line '((t (:background "yellow")))
;;   "Face to use for `hl-line-face'." :group 'hl-line)
;; (setq hl-line-face 'hl-line)
(global-hl-line-mode +1) ; turn it on for all modes by default

;; Uncomment this to disable the Insert key, which I find annoying
(global-set-key [insert] (lambda () (interactive)))
(global-set-key [insertchar] (lambda () (interactive)))

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

; readline compatibility
(global-set-key (kbd "C-M-h") 'backward-kill-word)

; Fn-Delete is delete
(global-set-key [kp-delete] 'delete-char)

; Undo is Ctrl-Z (better than hidding the Dock...
(global-set-key (kbd "C-z") 'undo)

;; OSX Keybindings
(when (eq system-type 'darwin)
    (setq mac-right-control-modifier 'meta)
    (setq mac-option-modifier 'nil))

; when fullscreen patch is present
(when (eq system-type 'darwin)
    (global-set-key (kbd "M-RET") 'ns-toggle-fullscreen))

;; Make certain that Home and End do the right thing
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)

;; Prompt for a line and go to it when hitting C-x g
(global-set-key "\C-xg" 'goto-line)

;; Module
(provide 'editor)
