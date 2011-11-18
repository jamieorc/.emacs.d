(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)


(custom-set-variables
 '(global-linum-mode t))

(setq linum-format "%5d ")
(setq mac-option-modifier 'meta
      scroll-conservatively 101)

(global-set-key (kbd "s-o") 'ido-find-file)
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
(global-set-key (kbd "s-{") 'prv-buffer)


