(add-to-list 'load-path "~/.emacs.d/lisp")

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
 '(transient-mark-mode t)
 '(line-number-mode t)
 '(column-number-mode t)
 '(font-user-system-font t))

(add-hook 'server-switch-hook
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
            (when server-buffer-clients
              (local-set-key (kbd "C-x k") 'server-kill-buffer)
              (local-set-key (kbd "C-x C-k") 'server-kill-buffer))))

(defun byte-compile-init-file ()
  (when (equal user-init-file buffer-file-emacs)
    (when (file-exists-p (concat user-init-file ".elc"))
      (delete-file (concat user-init-file ".elc")))
    (byte-compile-file user-init-file)))
(add-hook 'after-save-hook 'byte-compile-init-file)
(server-start)
