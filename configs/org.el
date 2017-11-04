;; Org mode settings and general tweaks
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
;; org-journal specifics
(setq org-journal-date-format "%A, %d.%m.%Y")
(setq org-journal-dir "/keybase/private/spavi/org/diary")
