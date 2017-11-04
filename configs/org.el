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

;; Org mode
;;
(setq org-log-done t)
;; org folder
(setq org-directory "/keybase/private/spavi/org")
;; org-agenda-files
(load-library "find-lisp")
(setq org-agenda-files
   (find-lisp-find-files "/keybase/private/spavi/org" "\.org.gpg$"))
;; notes
(setq org-default-notes-file "/keybase/private/spavi/org/refile.org.gpg")
