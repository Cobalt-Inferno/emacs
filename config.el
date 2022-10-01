;; Require blocks
(require 'evil)
(require 'general)
(require 'beacon)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
(load-theme 'doom-one t)
(add-to-list 'default-frame-alist '(font . "Inconsolata-16"))
;; load with emacsclient
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
;; disable all menu bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(tab-bar-mode -1)
(scroll-bar-mode -1) 

; line numbers
(setq display-line-numbers-type 'relative)
;; Map "C-c to C-g
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-c") 'evil-normal-state)
(define-key key-translation-map (kbd "C-c C-c") (kbd "C-g"))


;; Save quit with evil, dont actually quit
(defun save-and-kill-this-buffer()
  (interactive)
  (save-buffer)
  (kill-current-buffer))
(defun quit-buffer()
  (interactive)
  (kill-current-buffer))
; > the actual mappings
(evil-ex-define-cmd "wq" 'save-and-kill-this-buffer)
(evil-ex-define-cmd "q" 'quit-buffer)
;; Set the title
;; Set the banner
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer

;; Content is not centered by default. To center, set

;; To disable shortcut "jump" indicators for each section, set

