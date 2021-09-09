;; Set repositories
(require 'package)
(setq-default
load-prefer-newer t
package-enable-at-startup nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(package-initialize)

;; Install dependencies
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package t))
(setq-default
use-package-always-defer t
use-package-always-ensure t)

;; Use latest Org
(use-package org :ensure org-contrib)

;; Tangle configuration
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
