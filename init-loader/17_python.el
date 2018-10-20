(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-backend "jedi")

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(elpy-use-ipython)
