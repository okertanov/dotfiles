;; My personal emacs configuration
;; Oleg Kertanov (c) 2011

;; UI
;; (menu-bar-mode -1)
(tool-bar-mode -1)

(if (eq window-system 'w32)
    (progn
      (setq default-frame-alist
            (append '(
                      (width . 100) (height . 35)

                      (cursor-color . "OrangeRed1")  ;; coral1
                      (background-color . "midnight blue")
                      ;; (background-color . "grey16")
                      (foreground-color . "grey90")
                      (vertical-scroll-bars . right)

                      (font . "-*-Lucida Sans Unicode-normal-normal-normal-sans-*-*-*-*-p-*-iso8859-1")

                      ) default-frame-alist)
            )
   )
)

