;;; base-ui.el --- base ui configurations
;;
;; Copyright (c) 2018-2019 Sunil
;;
;; Author: Sunil <sunhick@gmail.com>

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Emacs configuration file

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; Emacs title bar customizations
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; remove all alarms from emacs
(setq ring-bell-function 'ignore)

;; no start up screen please
(setq inhibit-startup-screen t)

;; no title on the title bar
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)
(setq frame-resize-pixelwise t)

;; Emacs font and themes
(set-default-font "Menlo:pixelsize=12")

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

;; Show empty lines indicator
(set-default 'indicate-empty-lines t)

;; ibuffer is a better choice
(defalias 'list-buffers 'ibuffer)

;; Works only with emacs >= 26
;; use native relative line numbering(faster than linum-relative package)
;; Builtin package also fixes the issues with code folding.
(global-display-line-numbers-mode)
(setq-default display-line-numbers-type 'visual
              display-line-numbers-current-absolute nil)

;; save the previous locations of opened files
(save-place-mode 1)

;; show matching parens
(show-paren-mode 1)

(setq dired-use-ls-dired nil)
(provide 'base-ui)

;;; base-ui.el ends here
