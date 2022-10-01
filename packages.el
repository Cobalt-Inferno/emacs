(require 'use-package)
;; Evil!
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-want-C-u-scroll t)
  (setq evil-split-window-below t)
    (evil-mode))
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
;; projectile
(use-package projectile
  :config
  (projectile-global-mode 1))
;; themes
(use-package dracula-theme
  :ensure t)
(use-package catppuccin-theme
  :ensure t)
(use-package nord-theme
  :ensure t)
;; I like the doom themes
(use-package doom-themes
  :ensure t)
(use-package dirvish
  :ensure t)
(dirvish-override-dired-mode)
(use-package all-the-icons)
;; Or if you use use-package
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))
(use-package general
  :ensure t
  :config
  (general-evil-setup t))
;; Neotree, config is credited to DistroTube
(defcustom neo-window-width 25
  "*Specifies the width of the NeoTree window."
  :type 'integer
  :group 'neotree)

(use-package neotree
  :config
  (setq neo-smart-open t
        neo-window-width 30
        neo-theme (if (display-graphic-p) 'icons 'arrow)
        ;;neo-window-fixed-size nil
        inhibit-compacting-font-caches t
        projectile-switch-project-action 'neotree-projectile-action) 
        ;; truncate long file names in neotree
        (add-hook 'neo-after-create-hook
           #'(lambda (_)
               (with-current-buffer (get-buffer neo-buffer-name)
                 (setq truncate-lines t)
                 (setq word-wrap nil)
                 (make-local-variable 'auto-hscroll-mode)
                 (setq auto-hscroll-mode nil)))))

;; show hidden files
(setq-default neo-show-hidden-files t)

(nvmap :prefix "SPC"
       "t n"   '(neotree-toggle :which-key "Toggle neotree file viewer")
       "d n"   '(neotree-dir :which-key "Open directory in neotree"))

;; Treesitter
(use-package tree-sitter
  :ensure t)
(use-package tree-sitter-langs
  :ensure t)



(nvmap :keymaps 'override :prefix "SPC"
  "SPC"   '(counsel-M-x :which-key "M-x")
  "."     '(find-file :which-key "Find file") 
  "c c"   '(compile :which-key "Compile")
  "f f"   '(dirvish :which-key "Dirvish")
  "c C"   '(recompile :which-key "Recompile")
  "h r r" '((lambda () (interactive) (load-file "~/.emacs.d/init.el")) :which-key "Reload emacs config")
  "t t"   '(toggle-truncate-lines :which-key "Toggle truncate lines"))
(nvmap :prefix "SPC"
       "b b"   '(ibuffer :which-key "Ibuffer")
       "b c"   '(clone-indirect-buffer-other-window :which-key "Clone indirect buffer other window")
       "b k"   '(kill-current-buffer :which-key "Kill current buffer")
       "b n"   '(next-buffer :which-key "Next buffer")
       "b p"   '(previous-buffer :which-key "Previous buffer")
       "b B"   '(ibuffer-list-buffers :which-key "Ibuffer list buffers")
       "b K"   '(kill-buffer :which-key "Kill buffer")
       "r f"   '(dashboard-refresh-buffer :which-key "Refresh buffer"))


(use-package dashboard
  :init      ;; tweak dashboard config before loading it
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "help, emacs stole my family")
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-startup-banner "~/.emacs.d/.local/logo.png")  ;; use custom image as banner
  (setq dashboard-center-content t) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 3)
                          (projects . 3)))
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text")
			      (bookmarks . "book"))))

;; Smex (M-x improvement)
(use-package smex
  :ensure t
  :config
  (smex-initialize))

;; LSP
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (clangd-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))
;; for smooth scrolling
(use-package sublimity
  :ensure t
  :config
  (sublimity-mode 1))
