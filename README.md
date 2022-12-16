# emacs.d

n-th re-write of emacs configs. This time as literate code.

The configurations available in the `config.org` itself.

## Notes

- `init.el` should only contain the following, enabling config.org to be loaded into `config.el`

```lisp
;;; init.el --- Setting up the basics
;;; Commentary:
;;; This template init.el setups the basic config that enable
;;; Tangling config.org file into config.el
;; Set repositories
(require 'package)
;;; Code:
(setq-default
load-prefer-newer t
package-enable-at-startup nil)
(setq-default gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
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
```

Thus, `init.el` should be ignored from the repo:

`git update-index --assume-unchanged init.el`

Adding new packages would mean:

  - Editing the block in `config.org` where packages are requried.
  - Remove config.el generated.
  - Stop and start emacs server, letting Org-babel load the new packages/functions.
