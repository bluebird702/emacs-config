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
(put 'set-goal-column 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-jira elpy 0blayout company-go all-the-icons flycheck-golangci-lint go-tag htmlize ansible feature-mode flycheck-color-mode-line flycheck-pos-tip hydra json-mode json-reformat json-snatcher magit magit-popup markdown-preview-eww markdown-preview-mode pos-tip with-editor yaml-mode web-mode spaceline smartparens rspec-mode robe restclient-helm projectile-rails pallet org2jekyll neotree multiple-cursors monokai-theme markdown-mode js2-mode init-loader highlight-indentation helm-projectile go-mode exec-path-from-shell ensime enh-ruby-mode cider bundler auto-complete anzu ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
