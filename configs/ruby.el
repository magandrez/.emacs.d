;; Hook for robe to play with Enhanced Ruby Mode
(add-hook 'enh-ruby-mode-hook 'robe-mode)

;; Major mode for Ruby
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; Ruby shell shortcut
(global-set-key (kbd "C-c r r") 'inf-ruby)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

(autoload 'auto-make-header "header2")
(add-hook 'enh-ruby-mode-hook 'auto-make-header)

(custom-set-variables 
 '(make-header-hook
   (quote
    (header-title
     header-blank
     header-author
     header-creation-date
     header-blank
     header-description))))
