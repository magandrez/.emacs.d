;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
;; Org-files encryption
(require 'epa-file)
(epa-file-enable)

;; Enabling package index
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


;; Modular config loading
;; from https://www.emacswiki.org/emacs/DotEmacsModular#toc4
(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))
(load-directory "~/.emacs.d/configs")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-auto-complete t)
 '(company-idle-delay 0.25)
 '(company-quickhelp-delay 0.25)
 '(company-quickhelp-mode t)
 '(company-quickhelp-use-propertized-text t)
 '(company-show-numbers t)
 '(company-tooltip-idle-delay 0.25)
 '(global-company-mode t)
 '(ido-create-new-buffer (quote always))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((vertical-scroll-bars) (fullscreen . maximized))))
 '(initial-scratch-message nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (header2 suomalainen-kalenteri ace-window org-present password-store column-enforce-mode markdown-mode flycheck neotree flymake-go go-autocomplete go-mode yaml-mode multi-term company-quickhelp company magit monokai-theme enh-ruby-mode robe rvm ag pallet auto-complete async)))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote sendmail-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

;; Open files in an existing frame instead of a new frame
(setq ns-pop-up-frames nil)

;; Removes scroll bar
(toggle-scroll-bar -1)

;; Enable CUA mode (C-c, C-x, C-v, C-z)
(cua-mode 1)

;; Tramp mode
;; More info: http://www.emacswiki.org/emacs/TrampMode
(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(setq tramp-default-method "ssh")
(setq tramp-verbose 10)
;; Complete hostnames from ssh config
(tramp-set-completion-function "ssh"
                  '((tramp-parse-sconfig "/etc/ssh_config")
                    (tramp-parse-sconfig "~/.ssh/config")))

(put 'dired-find-alternate-file 'disabled t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
