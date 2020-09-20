(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'exec-path "/usr/local/bin/global")
(setq column-number-mode t)
(setq show-paren-mode t)

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(load-theme 'monokai t)
;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" default)))
 '(global-color-identifiers-mode t)
 '(helm-completion-style (quote emacs))
 '(package-selected-packages
   (quote
    (go-autocomplete ox-pukiwiki ox-mediawiki ox-twiki ox-gfm htmlize go-mode spotify default-text-scale color-identifiers-mode monochrome-theme zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))
 '(show-paren-mode t)
 '(speedbar-show-unknown-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(nyan-mode +1)
(global-display-line-numbers-mode +1)

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)
(global-set-key (kbd "C-<tab>") 'helm-projectile-find-other-file)
;(global-set-key (kbd "
(global-set-key (kbd "s-f") 'helm-projectile-find-file-dwim)

(global-set-key (kbd "s-+") 'default-text-scale-increase)
(global-set-key (kbd "s--") 'default-text-scale-decrease)
(global-set-key (kbd "M-s M-r") 'sr-speedbar-toggle)
(global-set-key (kbd "M-s M-p") 'spotify-playpause)
(global-set-key (kbd "M-s M-f") 'spotify-next)
(global-set-key (kbd "M-s M-b") 'spotify-previous)


(setq org-todo-keywords
'((sequence "TODO" "IN-PROGRESS" "BLOCKED" "REVIEW" "|" "DONE")))


;; Setting Colours (faces) for todo states to give clearer view of work
(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("IN-PROGRESS" . "blue")
        ("BLOCKED" . "red")
        ("REVIEW" . "orange")
        ("DONE" . "green")))

;; Display full path for all files
(setq frame-title-format
(list (format "%s %%S: %%j " (system-name))
      '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


;; Prompt before murdering emacs
(setq confirm-kill-emacs 'y-or-n-p)
(setq c-set-style 'stroustrup)


; speedbar show all files



(defun my-go-mode-hook ()
                                        ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
                                        ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)


(with-eval-after-load 'go-mode
  (require 'go-autocomplete))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
