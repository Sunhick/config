;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Author : Sunil
;; Email : sunhick@gmail.com
;;
;; copyright (c) 2018. All rights reserved.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
(package-initialize)

(setq user-full-name "Sunil"
      user-mail-address "sunhick@gmail.com")

;; start package.el with emacs
(require 'package)

;; Emacs title bar customizations
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

;; add MELPA to repository list
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(setq vc-follow-symlinks t)
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))

;; (use-package arjen-grey-theme
;;   :ensure t)

;; (use-package solarized-theme
;;   :ensure t)

(use-package nova-theme
  :ensure t)

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (load-theme 'nova t))))
  (load-theme 'nova t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (yaml-mode haskell-mode expand-region plantuml-mode markdown-mode diminish multiple-cursors gradle-mode groovy-mode multi-term cmake-mode google-c-style smooth-scrolling auto-complete-clang auto-complete-c-headers auto-complete ggtags yasnippet-snippets yasnippet org-bullets clang-format switch-window iedit autopair which-key counsel-projectile counsel magit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
