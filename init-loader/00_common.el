; 00_Common.el
(fset 'yes-or-no-p 'y-or-n-p)

; helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

; 한글 관련
(setq-default coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-hfs . utf-8-hfs))

; ansi-term 설정
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

; buffer
(defalias 'list-buffers 'ibuffer)
(ido-mode 1)

; 최근 파일 찾기
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'helm-recentf)

; window
(windmove-default-keybindings)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

; ui
(load-theme 'monokai t)
(global-hl-line-mode t)
(set-face-background 'hl-line "#330")

; backup files
(setq make-backup-files nil)
(setq backup-directory-alist
    `((".*" . "~/.saves")))	
(setq auto-save-file-name-transforms
    `((".*" "~/.saves" t)))	

; neotree
(require 'neotree)
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
(global-set-key [f8] 'neotree-toggle)

(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))

; spaceline
(require 'spaceline-config)
(spaceline-spacemacs-theme)

; search
(require 'anzu)
(global-anzu-mode +1)

(set-face-attribute 'anzu-mode-line nil
                    :foreground "yellow" :weight 'bold)

; linum
(require 'linum)
(global-linum-mode t)
(setq linum-format "%d ")

; projectile
(projectile-global-mode)
(setq projectile-enable-caching nil)
(setq projectile-require-project-root nil)
(require 'helm-projectile)
(helm-projectile-on)

; smartparens
(smartparens-global-mode)
(show-smartparens-global-mode t)

; multi cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

; company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-minimum-prefix-length 1)
;(setq company-transformers '(company-sort-by-occurrence))
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(setq-default company-backends '((company-yasnippet
                                  company-files
                                  )
                                 company-keywords
                                 company-capf
                                 ))
