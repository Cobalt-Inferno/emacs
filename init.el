;; Usepackage!
(require 'package)
;; disable backups
(setq make-backup-files nil) 
;; Repos
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; Ensure its installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; Package file

(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/config.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(yasnippet flycheck auto-complete sublimity-scroll nord-theme catppuccin-theme dracula-theme dracula which-key dap-mode lsp-treemacs lsp-ivy helm-lsp lsp-ui lsp-mode tree-sitter-langs tree-sitter neotree projectile all-the-icons beacon dirvish use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
