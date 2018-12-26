;;; slim-configurator.el --- Slim configurator
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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
(package-initialize)

(require 'eieio)
(require 'package)

;; FIXME: Automatic discovery of providers.
;; for now let's just hard code the providers
(require 'slim-pkg-provider)

(defclass slim-configurator ()
  ((archives
    :type cons
    :initarg :archives
    :documentation "Archives to be add package-archives")

   (providers
    :type list
    :initarg :providers
    :initform (lambda () (slim--init-providers))
    :documentation "List of package providers"))
  "Slim emacs configurator / setup")

(cl-defmethod slim--ensure-pkg-installed ((spkg slim-pkg))
  "Ensure the given pkg is installed"
  (let ((pkg (oref spkg name)))
    (message "Installing.... : [%s]" pkg)
    (unless (package-installed-p pkg)
      (package-refresh-contents)
      (package-install pkg))))

(defun slim--init-providers ()
  `(,(make-slim-pkg-provider)))

(cl-defmethod slim--add-install-repo ((c slim-configurator))
  ;; add melpa to repository list
  (add-to-list 'package-archives (oref c archives)))

(cl-defmethod slim--install-pkgs ((c slim-configurator))
  (dolist (provider (slim--init-providers))
    (mapc #'slim--ensure-pkg-installed (provider-pkg-list provider))))

(cl-defmethod slim-configure ((c slim-configurator))
  "setup the emacs editor"
  (slim--add-install-repo c)
  (slim--install-pkgs c))

(provide 'slim-configurator)

;;; slim-configurator.el ends here
