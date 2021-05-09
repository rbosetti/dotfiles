(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'rustdev)
(use-package google-c-style)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(setq-default
 visible-bell t
 default-major-mode 'text-mode
 inhibit-startup-messages t
 require-final-newline 'ask
 sentence-end-double-space nil
 indent-tabs-mode nil
 python-indent-offset 2
 )
(setq
 make-backup-files nil
 auto-save-default nil)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("BUILD\\'" . python-mode))
(add-to-list 'auto-mode-alist '("WORKSPACE\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.bzl\\'" . python-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(c++-mode-hook '((lambda nil google-set-c-style)))
 '(c-mode-common-hook '((lambda nil google-set-c-style)))
 '(column-number-mode t)
 '(custom-enabled-themes '(tango-dark))
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" default))
 '(font-user-system-font t)
 '(line-number-mode t)
 '(package-selected-packages
   '(gn-mode google-c-style solarized-theme zenburn-theme yasnippet use-package toml-mode rustic lsp-ui flycheck exec-path-from-shell company))
 '(transient-mark-mode t))

(add-hook 'c-mode-common-hook google-set-c-style)
(add-hook 'server-switch-hook
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
            (when server-buffer-clients
              (local-set-key (kbd "C-x k") 'kill-buffer)
              (local-set-key (kbd "C-x C-k") 'kill-buffer))))

;; (defun byte-compile-init-file ()
;;   (when (equal user-init-file (or buffer-file-emacs ""))
;;     (when (file-exists-p (concat user-init-file ".elc"))
;;       (delete-file (concat user-init-file ".elc")))
;;     (byte-compile-file user-init-file)))
;; (add-hook 'after-save-hook 'byte-compile-init-file)
(server-start)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
