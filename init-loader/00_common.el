;;; 00.common.el
;;; Commentary: 테스트

(global-visual-line-mode)
(set-face-attribute 'default nil :height 150)

; flycheck
(global-flycheck-mode)
(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(eval-after-load "flycheck" '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
(with-eval-after-load 'flycheck (flycheck-pos-tip-mode))

; helm 일단 잠깐 쓰지 않기
;(require 'helm-config)
;(global-set-key (kbd "M-x") 'helm-M-x)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)

; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

; which key
(require 'which-key)
(which-key-mode)

; projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching nil)
(setq projectile-require-project-root nil)
;(require 'helm-projectile)
(counsel-projectile-mode)

; ansi-term 설정
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

; buffer
(defalias 'list-buffers 'ibuffer)

; 최근 파일 찾기
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'ivy-recentf)

; window
(windmove-default-keybindings)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
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
(setq auto-save-default nil)

(setq backup-directory-alist `((".*" . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" "~/.saves" t)))

; neotree
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
(setq-default neo-show-hidden-files t)
(global-set-key [f8] 'neotree-toggle)
(neotree-show)

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

; smartparens
(smartparens-global-mode)
(show-smartparens-global-mode t)

; multi cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; https://superuser.com/questions/313398/how-to-prevent-the-symbols-function-definition-is-void-error-when-running-em
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

; company
(add-hook 'after-init-hook 'global-company-mode)

(require 'company)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-minimum-prefix-length 1)
;(setq company-transformers '(company-sort-by-occurrence))
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(setq-default company-backends '((company-yasnippet
                                  company-files)
                                 company-keywords
                                 company-capf
                                 ))



; buffer를 닫으면 윈도우도 닫히도록 처리
(substitute-key-definition 'kill-buffer 'kill-buffer-and-window (current-global-map))

; https://www.johndcook.com/blog/2016/11/30/setting-up-emacs-shell-on-a-mac/
(add-to-list 'exec-path "/usr/local/bin")

; 한글 관련
(set-terminal-coding-system 'utf-8-unie)
(set-default-coding-systems 'utf-8-hfs)
(setq default-process-coding-system '(utf-8-hfs . utf-8-hfs))
;(add-hook 'term-exec-hook
;          (function
;           (lambda ()
;             (set-buffer-process-coding-system 'utf-8-hfs-mac 'utf-8-hfs-mac))))



