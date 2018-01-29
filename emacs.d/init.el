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

;; add MELPA to repository list
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
     (package-install package)))

(use-package org
    :ensure org)

(require 'org)

(setq vc-follow-symlinks t)
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))

(use-package monokai-theme
  :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (monokai)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (gradle-mode neotree company-c-headers org-bullets org-bullets-mode clang-format magit iedit autopair which-key counsel-projectile counsel use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
