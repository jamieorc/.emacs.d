(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(slime-net-coding-system (quote utf-8-unix))
 '(global-auto-revert-mode t))

(setq linum-format "%5d ")
(setq mac-option-modifier 'meta
      scroll-conservatively 1001)

(setq exec-path (append exec-path '("/usr/local/bin")) )

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(global-set-key (kbd "s-o") 'ido-find-file)
(global-set-key (kbd "s-b") 'ido-switch-buffer)
(global-set-key (kbd "s-R") 'eval-last-sexp)
(global-set-key [s-right] 'move-end-of-line)
(global-set-key [s-left] 'move-beginning-of-line)
(global-set-key [s-up] 'beginning-of-buffer)
(global-set-key [s-down] 'end-of-buffer)
(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-2") 'split-window-below)
(global-set-key (kbd "s-3") 'split-window-right)
(global-set-key (kbd "s->") 'other-window)
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-{") 'previous-buffer)

(global-set-key (kbd "C-Z") 'magit-status)

(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map (kbd "s-r") 'slime-eval-defun)))
(add-hook 'clojure-mode-hook 'textmate-mode)
(add-hook 'midje-mode-hook
          '(lambda ()
             (define-key midje-mode-map (kbd "s-=") '(insert " => "))))

;; Auto-Complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; AC-Slime (auto-complete for slime)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco"))))
 '(isearch ((t (:background "yellow" :foreground "black")))))

