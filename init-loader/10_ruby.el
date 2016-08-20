; 10_ruby.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(require 'robe)
(add-hook 'enh-ruby-mode-hook 'robe-mode)

(add-hook 'enh-ruby-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))

(add-hook 'coffee-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))

(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)

(add-hook 'compilation-filter-hook 'inf-ruby-auto-enter)
