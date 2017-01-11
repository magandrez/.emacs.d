;; Hook for robe to play with Enhanced Ruby Mode
(add-hook 'enh-ruby-mode-hook 'robe-mode)

;; Major mode for Ruby
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; Ruby shell shortcut
(global-set-key (kbd "C-c r r") 'inf-ruby)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|cap\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
