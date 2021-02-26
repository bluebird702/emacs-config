; orgmode

(setq org-agenda-files (list "~/Google Drive File Stream/내 드라이브/개인문서/업무일지/2018_Work.org"))
(setq org-src-fontify-natively t)
(setq org-log-done t
      org-use-fast-todo-selection t)

(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "red" :weight bold))
      ("IN_PROGRESS"  . (:foreground "red" :weight bold))
      ("DONE"  . (:foreground "forest green" :weight bold))
      ("WAITING"  . (:foreground "orange" :weight bold))
      ("CANCELLED"  . (:foreground "forest green" :weight bold))
      ("SOMEDAY"  . (:foreground "orange" :weight bold))
      ("OPEN"  . (:foreground "red" :weight bold))
      ("CLOSED"  . (:foreground "forest green" :weight bold))
      ("ONGOING"  . (:foreground "orange" :weight bold))))

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN_PROGRESS(n)" "|" "DONE(d!/!)")
      (sequence "WAITING(w@/!)" "|" "CANCELLED(c!/!)")
      (sequence "SOMEDAY(s!/!)" "|")
      (sequence "OPEN(O!)" "|" "CLOSED(C!)")
      (sequence "ONGOING(o)" "|")))
