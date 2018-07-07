; 10_ruby.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(projectile-rails-global-mode)
(define-key projectile-rails-mode-map (kbd "s-r") 'hydra-projectile-rails/body)
;(add-hook 'projectile-mode-hook 'projectile-rails-on)

(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))

(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(setq robe-turn-on-eldoc nil)

(eval-after-load 'company
/  '(push 'company-robe company-backends))

(add-hook 'enh-ruby-mode-hook
         (lambda () (highlight-indentation-current-column-mode)))
