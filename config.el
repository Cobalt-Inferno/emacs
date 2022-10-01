;; Require blocks
(require 'evil)
(require 'general)
(require 'beacon)
(require 'tree-sitter)
(require 'tree-sitter-langs)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
(load-theme 'doom-one t)
(add-to-list 'default-frame-alist '(font . "Inconsolata-17"))
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

;; treesitter langs
(tree-sitter-require 'cpp)
(tree-sitter-require 'c)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; lsp
(setq lsp-log-io nil) ; if set to true can cause a performance hit
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2

;; Autopair
(defun electric-pair ()
      "If at end of line, insert character pair without surrounding spaces.
    Otherwise, just insert the typed character."
  (interactive)
  (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))
(add-hook 'c-mode-hook
          (lambda ()
            (define-key c-mode-map "\"" 'electric-pair)
            (define-key c-mode-map "\'" 'electric-pair)
            (define-key c-mode-map "(" 'electric-pair)
            (define-key c-mode-map "[" 'electric-pair)
            (define-key c-mode-map "{" 'electric-pair)))
