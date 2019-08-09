(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(package-selected-packages
   (quote
    (yaml-mode ggtags ace-window transpose-frame helm-lsp flycheck dap-mode lsp-ui company-lsp yasnippet projectile use-package lsp-java lsp-treemacs helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; helm start
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(helm-mode 1)
;; helm end

;; lsp-java start
(require 'cc-mode)

(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-java :ensure t :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java :after (lsp-java))

(setq lsp-java-references-code-lens-enabled t)
(setq lsp-java-format-on-type-enabled nil)
(setq lsp-ui-doc-enable nil)
(setq lsp-ui-sideline-enable nil)
;; lsp-java end

;; projectile settings start
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; projectile settings end

;; custom themes start
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme `tron-legacy t)
;; custom themes end

(use-package treemacs
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-width 45))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)))

;; custom key bindings start
;;(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-o") 'ace-window)

(global-set-key (kbd "M-i") 'imenu)

;; custom key bindings start
;;(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-o") 'ace-window)

(global-set-key (kbd "M-i") 'imenu)

;; join region into single line
(defun unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single
    logical line.  This is useful, e.g., for use with
    `visual-line-mode'."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))

;; Handy key definition
(global-set-key (kbd "C-M-S-q") 'unfill-region)

;; Fix xref-find-reference error in lsp-java
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
;; custom key bindings end

;; custom variables start
;; for version control changes, update buffer
(global-auto-revert-mode 1)

;; add line numbers to the side
(global-linum-mode t)

(global-hl-line-mode 1)
(column-number-mode 1)
(delete-selection-mode 1)
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
;; custom variables end



