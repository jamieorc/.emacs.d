(add-to-list 'load-path "/Users/jamieorc/.emacs.d/local/")

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
 '(slime-net-coding-system (quote utf-8-unix)))


(global-auto-revert-mode 1)

(setq linum-format "%5d ")
(setq mac-option-modifier 'meta
      scroll-conservatively 1001)

(setq exec-path (append exec-path '("/usr/local/bin")) )

;; coffeescript
(setq coffee-tab-width 2)

(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)
;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n " "" "\n " "\n ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

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
(add-hook 'html-mode-hook 'textmate-mode)
(add-hook 'ruby-mode-hook 'textmate-mode)
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

;; Use node for js-comint
(require 'js-comint)
;; Use node as our repl
(setq inferior-js-program-command "node")
(setq inferior-js-mode-hook
  (lambda ()
    ;; We like nice colors
    (ansi-color-for-comint-mode-filter)
    ;; Deal with some prompt nonsense
    (add-to-list 'comint-preoutput-filter-functions
                 (lambda (output)
                   (replace-regexp-in-string 
                    ".*1G\.\.\..*5G" "..."
                    (replace-regexp-in-string ".*1G.*3G" "> " output))))))

;; emacs-project-mode
(require 'project-mode)
(project-load-all)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco"))))
 '(isearch ((t (:background "yellow" :foreground "black")))))

