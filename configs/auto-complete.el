;; Loading auto-complete config
;; and dictionaries
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories 
"~/.emacs.d/.cask/26.0/elpa/auto-complete-20160827.649/dict")
(ac-config-default)
(setq ac-ignore-case nil)

;; Load auto-complete for minibufferp
;(defun auto-complete-mode-maybe ()
;  "Only AC!"
;  (unless (minibufferp (current-buffer))
;    (auto-complete-mode 1)))

(defun auto-complete-mode-maybe ()
  "What buffer `auto-complete-mode' prefers."
  (if (and (not (minibufferp (current-buffer)))
           (memq major-mode ac-modes))
      (auto-complete-mode 1)))

;; Company-mode
;(with-eval-after-load 'company 
;  '(push 'company-robe company-backends))

