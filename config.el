(customize-set-variable 'scroll-bar-mode nil)
(customize-set-variable 'horizontal-scroll-bar-mode nil)
(customize-set-variable 'blink-cursor-mode nil)
(customize-set-variable 'tool-bar-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default inhibit-startup-screen t
              initial-scratch-message ""
	      	  visible-bell nil                               ; No shaking
	          confirm-nonexistent-file-or-buffer nil         ; Remove confirm dialog on new buffers
	          show-paren-delay 0                             ; No delay when showing matching parenthesis
	          confirm-kill-emacs 'y-or-n-p                   ; Confirm exiting Emacs
	          display-time-default-load-average nil          ; Don't display load average
	          indent-tabs-mode nil                           ; No tabs for indentation
	          select-enable-clipboard t                      ; Unite Emacs & system clipboard
	          window-combination-resize t                    ; Create new windows proportionally
	          use-package-always-ensure t)                    ; Install packages if not found on the system

(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)

;; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(setq utf-translate-cjk-mode nil)

(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(global-set-key (kbd "C-+") 'text-scale-increase)        ; Bigger
(global-set-key (kbd "C--") 'text-scale-decrease)        ; Smaller
(global-set-key (kbd "M-n") 'next-multiframe-window)     ; Cycle through frames
(global-set-key (kbd "M-p") 'previous-multiframe-window) ; Cycle through frames

;(setq custom-file (expand-file-name ".custom.el" user-emacs-directory))
;(when (file-exists-p custom-file)
;  (load custom-file))

(use-package monokai-theme
  :init
  (load-theme 'monokai t))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :config
  (setq exec-path-from-shell-variables '("PATH" "GOPATH")
        exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(when (eq system-type 'darwin)
  (setq-default
   exec-path (append exec-path '("/usr/local/bin"))  ; Add Homebrew path
   mac-command-modifier 'meta                        ; Map Meta to Cmd
   mac-option-modifier nil                           ; Don't use Option key 
   mac-right-option-modifier nil                     ; Disable the right Alt key
   ns-pop-up-frames nil                              ; Visit files in same frame
   dired-use-ls-dired nil))                          ; macOS command ls doesn't support --dired option

(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backup"))
      delete-old-versions t
      kept-new-versions 3
      kept-old-versions 2
      version-control t
      create-lockfiles nil
      vc-follow-symlinks t)

(use-package dockerfile-mode
  :mode "Dockerfile\\'" 
  :mode "Dockerfile.test\\'")

(use-package sgml-mode
  :mode "\\.html\\'"
  :config (setq-default sgml-basic-offset 2))

(use-package markdown-mode
  :mode "INSTALL\\'"
  :mode "CONTRIBUTORS\\'"
  :mode "LICENSE\\'"
  :mode "README\\'"
  :mode "\\.markdown\\'"
  :mode "\\.md\\'"
  :config
  (setq-default
   markdown-asymmetric-header t
   markdown-split-window-direction 'right))

(use-package yaml-mode
  :mode "\\.yml\\'"  
  :mode "\\.yaml\\'")

(use-package csv-mode
  :mode "\\.[Cc][Ss][Vv]\\'"
  :init (setq csv-separators '("," ";" "|" " "))
  :config (use-package csv-nav))

(use-package magit
  :config
  (setq-default
   magit-refs-show-commit-count 'all
   magit-section-show-child-count t))

(use-package go-mode
  :mode "\\.go\\'"
  :mode "\\.toml\\'"
  :init
  (add-hook 'before-save-hook #'gofmt-before-save))

(use-package go-eldoc
  :init
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package go-add-tags)

(use-package enh-ruby-mode
  :mode "\\.rb\\'"
  :mode "\\.rake\\'"
  :mode "\\.ru\\'"
  :mode "Gemfile\\'"
  :mode "Rakefile\\'"
  :mode "Capfile\\'" 
  :mode "\\.gemspec\\'"
  :config
  (setq enh-ruby-add-encoding-comment-on-save nil
        enh-ruby-deep-indent-paren nil
        enh-ruby-hanging-brace-indent-level 2
        enh-ruby-use-encoding-map nil
        rspec-autosave-buffer t
        rspec-compilation-buffer-name "*rspec-compilation*"
        rspec-use-opts-file-when-available nil
        rspec-use-rake-flag nil
        ruby-deep-arglist nil
        ruby-deep-indent-paren nil
        ruby-end-insert-newline nil
        ruby-insert-encoding-magic-comment nil
        ruby-indent-level 2
        ruby-indent-tabs-mode nil)
)

(use-package yari
  :after enh-ruby-mode
  :init
  (add-hook 'enh-ruby-mode-hook (lambda () (local-set-key [f1] 'yari))))

(use-package inf-ruby
  :after enh-ruby-mode
  :init
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode))

(use-package rspec-mode
  :after enh-ruby-mode)

(use-package rvm
  :after enh-ruby-mode
  :config
  (rvm-use-default))

(use-package feature-mode
  :commands feature-mode
  :config
  (setq feature-default-language "en"))

(use-package which-key
 :init
 (add-hook 'after-init-hook 'which-key-mode)
 :config
 (which-key-mode)
 (setq which-key-idle-delay 0.25))

(use-package ace-window
  :config
  :bind* ("M-o" . ace-window))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq epg-gpg-program "gpg2")
(setf epa-pinentry-mode 'loopback)
(setq epa-file-inhibit-auto-save t)

(use-package pinentry
  :config
  (pinentry-start))

(dolist (mode
  '(global-prettify-symbols-mode        ; Greek letters should look greek
    global-auto-revert-mode             ; Reload files when change, please
    show-paren-mode                     ; Highlight matching parentheses
    cua-mode                            ; Global Cmd-c, Cmd-x to copy & paste
    global-display-line-numbers-mode    ; Native line numbers
    ))
  (funcall mode 1))

(use-package tramp
  :config
  (tramp-set-completion-function "ssh" '((tramp-parse-sconfig "/etc/ssh_config") (tramp-parse-sconfig "~/.ssh/config"))))

(use-package smartparens
  :ensure t
  :init
    (add-hook 'enh-ruby-mode-hook 'smartparens-strict-mode))

(setq org-directory "/keybase/private/spavi/org/")
(require 'find-lisp)
(setq org-agenda-files
      (find-lisp-find-files org-directory "\.org.gpg$"))
(setq org-default-notes-file "/keybase/private/spavi/org/refile.org.gpg")

(use-package org
  :init
  (setq org-support-shift-select t
        org-return-follows-link t
        org-hide-emphasis-markers t
        org-outline-path-complete-in-steps nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-confirm-babel-evaluate nil
        org-log-done t
        org-refile-targets '((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9))
        org-refile-use-outline-path t
        org-outline-path-complete-in-steps nil
        org-completion-use-ido t
        ido-everywhere t
        ido-max-directory-size 100000
        ido-default-file-method 'selected-window
        ido-default-buffer-method 'selected-window
        org-indirect-buffer-display 'current-window
        org-fast-tag-selection-include-todo t
        org-use-fast-todo-selection t
        org-startup-indented t
        org-agenda-use-tag-inheritance nil
        org-agenda-ignore-drawer-properties '(effort appt category)
        org-agenda-dim-blocked-tasks nil)
  (add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
  (add-to-list 'auto-mode-alist '(".*/[0-9]*$" . org-mode))
  (add-to-list 'org-modules 'org-habit)
  (add-hook 'org-mode-hook 'auto-fill-mode)
  (add-hook 'org-journal-mode-hook 'auto-fill-mode)
  (add-hook 'org-agenda-mode-hook (lambda () (projectile-mode -1)))
  (add-hook 'org-mode-hook (lambda () (projectile-mode -1)))
  :bind (("C-c l" . org-store-link)
         ("C-c n" . org-capture)
         ("C-c a" . org-agenda))
  :config
  (font-lock-add-keywords
   'org-mode `(("^\\*+ \\(TODO\\) "
                (1 (progn (compose-region (match-beginning 1) (match-end 1) "⚑") nil)))
               ("^\\*+ \\(PROGRESSING\\) "
                (1 (progn (compose-region (match-beginning 1) (match-end 1) "⚐") nil)))
               ("^\\*+ \\(CANCELED\\) "
                (1 (progn (compose-region (match-beginning 1) (match-end 1) "✘") nil)))
               ("^\\*+ \\(DONE\\) "
                (1 (progn (compose-region (match-beginning 1) (match-end 1) "✔") nil)))))

  (setq org-tag-alist '((:startgroup) ("@w0rk" . ?w) ("@home" . ?h) (:endgroup))
        org-todo-keywords '((sequence "TODO(t)" "PROGRESSING(p)" "|" "DONE(d)")
                            (sequence "INACTIVE(i@/!)" "|" "CANCELLED(c@/!)"))
        org-todo-keyword-faces
        '(("TODO" :foreground "red" :weight bold)
          ("PROGRESSING" :foreground "blue" :weight bold)
          ("DONE" :foreground "forest green" :weight bold)
          ("INACTIVE" :foreground "magenta" :weight bold)
          ("CANCELLED" :foreground "brown" :weight bold)))
  (setq org-agenda-custom-commands
        '(("w" "Work" tags-todo "@w0rk")
          ("h" "Home" tags-todo "@home")))

  (define-key org-mode-map [remap org-return] (lambda () (interactive)
                                                (if (org-in-src-block-p)
                                                    (org-return) (org-return-indent)))))

(use-package org-journal
  :config
  (setq org-journal-date-format "%A, %d.%m.%Y"
        org-journal-file-format "%Y%m%d"
        org-journal-dir "/keybase/private/spavi/org/diary/"))

(defvar org-capture-templates
  '(
    ("t" "To-do task." 
     entry 
     (file+headline org-default-notes-file "Tasks")
     "* TODO %?\n%u\n%a\n" :clock-in t :clock-resume t)
    ("w" "Work task." 
     entry 
     (file+headline org-default-notes-file "Work Task")
     "* TODO %?\n%u\n%a\n" 
     :clock-in t 
     :clock-resume t)
    ("l" "Link: Something interesting?"
     entry
     (file+headline org-default-notes-file "Links")
     (file "~/.emacs.d/org-templates/links.orgcaptmpl"))
    ("i" "Idea came up." 
     entry 
     (file org-default-notes-file)
     "* %? :IDEA: \n%u" :clock-in t :clock-resume t)))

(defun meeting-notes ()
  "Call this after creating an org-mode heading for where the notes for the meeting
should be. After calling this function, call 'meeting-done' to reset the environment."
  (interactive)
  (outline-mark-subtree)                              ;; Select org-mode section
  (narrow-to-region (region-beginning) (region-end))  ;; Only show that region
  (deactivate-mark)
  (delete-other-windows)                              ;; Get rid of other windows
  (text-scale-set 2)                                  ;; Text is now readable by others
  (fringe-mode 0)
  (message "When finished taking your notes, run meeting-done."))

(defun meeting-done ()
  "Attempt to 'undo' the effects of taking meeting notes."
  (interactive)
  (widen)                                       ;; Opposite of narrow-to-region
  (text-scale-set 0)                            ;; Reset the font size increase
  (fringe-mode 1)
  (winner-undo))                                ;; Put the windows back in place

(use-package org-bullets
  :after org
  :hook
  (org-mode . (lambda () (org-bullets-mode 1))))

(use-package suomalainen-kalenteri
  :after org
  :config
  (setq calendar-date-style 'european
        calendar-latitude 60.1     ; Roughly Helsinki
        calendar-longitude 24.9    ; Roughly Helsinki
        calendar-week-start-day 1  ; Weeks start on Monday
        calendar-today-visible-hook 'calendar-mark-today
        calendar-holidays suomalainen-kalenteri
        org-agenda-include-diary t))

(use-package projectile
  :defer 1
  :init
  (setq-default
   projectile-cache-file (expand-file-name ".projectile-cache" user-emacs-directory)
   projectile-keymap-prefix (kbd "C-c C-p")
   projectile-known-projects-file (expand-file-name
                                   ".projectile-bookmarks" user-emacs-directory))
  :config
  (projectile-global-mode 1)
  (setq-default
   projectile-indexing-method 'alien
   projectile-globally-ignored-modes '("org-mode" "org-agenda-mode")
   projectile-globally-ignored-file-suffixes '(".gpg")
   projectile-completion-system 'ido
   projectile-enable-caching t
   projectile-mode-line '(:eval (projectile-project-name))))

(use-package highlight)

(use-package treemacs
  :config
  (setq treemacs-follow-after-init t
        treemacs-width 35
        treemacs-indentation 1
        treemacs-recenter-after-file-follow nil
        treemacs-silent-refresh t
        treemacs-silent-filewatch t
        treemacs-change-root-without-asking t
        treemacs-sorting 'alphabetic-desc
        treemacs-show-hidden-files t
        treemacs-never-persist nil
        treemacs-is-never-other-window f
        treemacs-indentation-string (propertize " ǀ " 'face 'font-lock-comment-face)
        treemacs-follow-mode t
        treemacs-filewatch-mode t
        treemacs-fringe-indicator-mode t)
  :bind
  (([f8] . treemacs)
   ("C-c f" . treemacs-select-window)))

(use-package treemacs-projectile
  :after treemacs projectile
  :bind 
  (("C-c o p" . treemacs-projectile)))

(use-package yafolding
  :bind 
  (("M-RET" . yafolding-toggle-element)
  ("M-m" . yafolding-toggle-all))
  :init
  (add-hook 'enh-ruby-mode-hook 'yafolding-mode))
