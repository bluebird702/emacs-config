;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)
(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")

(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(require 'pallet)
(pallet-mode t)

(init-loader-load "~/.emacs.d/init-loader/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" default)))
 '(org-agenda-files (quote ("~/Work/Personal/Docs/ProgrammingInScala.org")))
 '(package-selected-packages
   (quote
    (go-mode markdown-preview-mode markdown-preview-eww markdown-mode with-editor json-mode flycheck-pos-tip flycheck-color-mode-line flycheck hydra async cask clojure-mode f git-commit inf-ruby inflections magit-popup package-build powerline restclient s sbt-mode scala-mode seq spinner yasnippet magit feature-mode ansible company dash helm helm-core projectile rake restclient-helm multiple-cursors ruby-guard rspec-mode yaml-mode web-mode spaceline smartparens robe projectile-rails pallet neotree monokai-theme js2-mode init-loader highlight-indentation helm-projectile exec-path-from-shell ensime enh-ruby-mode cider bundler auto-complete anzu ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
