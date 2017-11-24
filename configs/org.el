;; General
;;
(setq org-support-shift-select t)

;; Calendar
;;
(setq calendar-date-style (quote european))
;; Helsinki
(setq calendar-latitude 60.1)
(setq calendar-longitude 24.9)
;; Show time and CPU load average
(setq display-time-24hr-format t)
(setq display-time-load-average 1)
;; Week starts on Monday
(setq calendar-week-start-day 1)
;; highlight today
(setq calendar-today-visible-hook (quote (calendar-mark-today)))

;; Journal
;;
(setq org-journal-date-format "%A, %d.%m.%Y")
;; Journal folder files
(setq org-journal-dir "/keybase/private/spavi/org/diary/")
;; automatic text width with auto-fill-mode
(add-hook 'org-journal-mode-hook 'auto-fill-mode)
(auto-complete-mode nil)
;; Org mode
;;
;; Automatic text width for org-mode
(add-hook 'org-mode-hook 'auto-fill-mode)
(setq org-log-done t)
;; org folder
(setq org-directory "/keybase/private/spavi/org")
;; org-agenda-files
(load-library "find-lisp")
(setq org-agenda-files
   (find-lisp-find-files "/keybase/private/spavi/org" "\.org.gpg$"))
;; notes
(setq org-default-notes-file "/keybase/private/spavi/org/refile.org.gpg")
;; tag lists
(setq org-tag-alist '((:startgroup)
		      ("@w0rk" . ?w)
		      ("@home" . ?h)
		      (:endgroup)
		      ("PERSONAL" . ?p)
		      ("NOTE" . ?n)
		      ))
;; ;; Include the todo keywords
(setq org-fast-tag-selection-include-todo t)
(setq org-use-fast-todo-selection t)
;; ;; keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "PROGRESSING(p)" "|" "DONE(d)")
	(sequence "WAITING(w@/!)" "INACTIVE(i@/!)" "|" "CANCELLED(c@/!)")))
;; ;; colours for keywords
(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight bold)
	("PROGRESSING" :foreground "blue" :weight bold)
	("DONE" :foreground "forest green" :weight bold)
	("WAITING" :foreground "orange" :weight bold)
	("INACTIVE" :foreground "magenta" :weight bold)
	("CANCELLED" :foreground "brown" :weight bold)))
;; ;; Auto-update tags whenever the state is changed
(setq org-todo-state-tags-triggers
      '(("CANCELLED" ("CANCELLED" . t))
	("WAITING" ("WAITING" . t))
	("INACTIVE" ("WAITING") ("INACTIVE" . t))
	("PROGRESSING" ("PROGRESSING" . t))
	(done ("WAITING") ("INACTIVE") ("PROGRESSING") )
	("TODO" ("WAITING") ("CANCELLED") ("INACTIVE") ("PROGRESSING"))
	("DONE" ("WAITING") ("CANCELLED") ("INACTIVE"))
	("PROGRESSING" ("WAITING") ("CANCELLED") ("INACTIVE"))))

;; org-capture
;;
;; Use C-c n to call it globally 
(global-set-key (kbd "C-c n") 'org-capture)

;; Hack to work around %A having different meaning
;; for capture mode vs. format-time-string
(defun sp/my-timestamp ()
  (format-time-string "%A, %d.%m.%Y"))

;; Templates
(defvar org-capture-templates
       '(("t" "To-do task." entry (file+headline org-default-notes-file "Tasks")
	  "* TODO %?\n%u\n%a\n" :clock-in t :clock-resume t)
	 ("w" "Work task." entry (file+headline org-default-notes-file "Work Task")
	  "* TODO %?\n%u\n%a\n" :clock-in t :clock-resume t)
	 ("l" "Link: Something interesting?"
	  entry
	  (file+headline org-default-notes-file "Links")
	  (file "~/.emacs.d/configs/org-templates/links.orgcaptmpl"))
	 ("j" "Journal daily." entry (file
			       (expand-file-name (format-time-string "%Y%m%d")
						 org-journal-dir))
	  "*%(sp/my-timestamp)\n\n**%(format-time-string \"%H:%M\")%?" :kill-buffer t)
	 ("i" "Idea came up." entry (file org-default-notes-file)
	  "* %? :IDEA: \n%u" :clock-in t :clock-resume t) ))

;; Refile
(setq org-refile-targets '((nil :maxlevel . 9)
                                (org-agenda-files :maxlevel . 9)))
; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)
