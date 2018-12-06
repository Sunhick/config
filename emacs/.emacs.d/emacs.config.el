(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;; Emacs title bar customizations
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)
(setq frame-resize-pixelwise t)

;; Emacs font and themes
(set-default-font "Monaco 12")
(use-package twilight-theme
  :ensure t)

;; Get rid of tool bar and menu bar
(menu-bar-mode 0)

;; Yeah, I'm keeping the text menu at the top. It doesn't
;; bother me. Whereas the toolbar i never use it and just
;; occupies space.
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; I hate typing. Especially when emacs prompts
;; me with yes/no and i type 'y' or 'n' in a hurry
;; remap yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable visual line mode
(global-visual-line-mode 1)

;; change the fringe
(set-fringe-mode '(nil . 0))

;; Trash can support
(setq delete-by-moving-to-trash t)

;; 80 chars is a good width.
(set-default 'fill-column 80)

;; Display line & column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; use whitespaces instead of tabs
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package org
  :ensure t)
(use-package org-bullets
  :ensure nil
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(defalias 'list-buffers 'ibuffer)

(use-package magit
  :ensure t
  :config
  (global-set-key(kbd "C-x g") 'magit-status)
  ;; set the magit repository
  (setq magit-repository-directories '( "~/prv/github/")))
