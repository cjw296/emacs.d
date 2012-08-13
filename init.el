(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(aquamacs-auto-face-mode t)
;; '(auto-save-default nil)
;; '(auto-save-interval 1000000)
;; '(auto-save-timeout 100000)
 '(backup-by-copying-when-mismatch t)
 '(column-number-mode t)
 '(delete-auto-save-files t)
 '(make-backup-files nil)
 '(next-screen-context-lines 10)
 '(tool-bar-mode nil))

 ;; IDO stuff
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-builtin-face ((((class color) (background light)) (:foreground "blue"))))
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "Dark Green"))))
 '(font-lock-constant-face ((((class color) (background light)) (:foreground "darkred"))))
 '(font-lock-function-name-face ((((class color) (background light)) (:foreground "black"))))
 '(font-lock-keyword-face ((((class color) (background light)) (:foreground "dark blue"))))
 '(font-lock-string-face ((((class color) (background light)) (:foreground "dark red"))))
 '(font-lock-type-face ((((class color) (background light)) (:foreground "black"))))
 '(font-lock-variable-name-face ((((class color) (background light)) (:foreground "black")))))
(global-font-lock-mode t)

(add-to-list 'load-path "~/.emacs.d")

; no toolbar
(tool-bar-mode -1)

; python.el re-configure
(require 'python)
(define-key python-mode-map "\C-m" 'newline-and-indent)
(define-key python-mode-map [S-return] 'newline)

; NO BELL!
(setq ring-bell-function 'ignore)

; try and make file opening faster on mounted network drives
(setq vc-handled-backends nil)

;; tabs
(add-hook 'html-mode-hook (lambda () (setq tab-width 4 indent-tabs-mode nil) (setq indent-line-function 'indent-relative)))
(add-hook 'fundamental-mode-hook (lambda () (setq tab-width 4 indent-tabs-mode nil)))

;; handy mode changers
    (defun unix-file ()
      "Change the current buffer to Latin 1 with Unix line-ends."
      (interactive)
      (set-buffer-file-coding-system 'iso-latin-1-unix t))

    (defun dos-file ()
      "Change the current buffer to Latin 1 with DOS line-ends."
      (interactive)
      (set-buffer-file-coding-system 'iso-latin-1-dos t))

;; shell-prompt-pattern stuff
;(require 'tramp)

;(add-to-list 'tramp-default-proxies-alist
;             '(nil "\\`root\\'" "/ssh:%h:"))
;(add-to-list 'tramp-default-proxies-alist
;             '((regexp-quote (system-name)) nil nil))

;;(add-to-list 'tramp-default-proxies-alist
;;	     '(nil "\\`root\\'" "/ssh:%h:"))

;; for debugging
(setq tramp-verbose 10)
(setq tramp-debug-buffer t)

(setq password-cache-expiry nil)

(server-start)

(ido-mode 1)
(cua-mode t)
(recentf-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; scroll bars right
(setq scroll-bar-mode-explicit t) 
(set-scroll-bar-mode `right) 

(require 'crontab)
(require 'flymake-pyflakes)
(require 'flymake-cursor)
(require 'puppet-mode)
(put 'upcase-region 'disabled nil)

;; The following key-binding iconifies a window -- we disable it:
(global-unset-key "\C-x\C-z")
;; The following key-binding quits emacs -- we disable it too:
(global-unset-key "\C-x\C-c")
;; C-x j, which is bound to kanji entering, is too close to dired's C-x C-j
(global-unset-key "\C-xj")

;; Disable binding of C-z to iconify a window.
(global-unset-key "\C-z")

;; M-` invokes tmm-menubar; disable it.
(global-unset-key "\M-`")

;; C-x C-n invokes set-goal-column; disable it.
(global-unset-key "\C-x\C-n")

(require 'org-config)
