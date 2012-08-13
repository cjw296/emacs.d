;; Flymake handler for python code
;;
;; Author: Menno Smits
;;
;; Inspired by flymake-ruby.el by Steve Purcell
;; http://github.com/purcell/emacs.d/blob/master/site-lisp/flymake-ruby/flymake-ruby.el
;;
;; Usage:
;; (require 'flymake-pyflakes)

;; Flymake handler for python code
;;
;; Author: Menno Smits
;; Flymake handler for python code
;;
;; Author: Menno Smits
;;
;; Inspired by flymake-ruby.el by Steve Purcell (which has since gone
;; away). This has been heavily modified since.
;;
;; Usage:
;; (require 'flymake-pyflakes)

(require 'cl)

(defun flymake-pyflakes-create-tempfile (filename prefix)
  (make-temp-file (or prefix "flymake-pyflakes")))

(defun flymake-pyflakes-init ()
  (let ((temp-file (flymake-init-create-temp-buffer-copy
                    'flymake-pyflakes-create-tempfile)))
    (list "pyflakes" (list temp-file))))

(defun flymake-pyflakes-load ()
  ;; Prevent the "buffer has a process running - kill it?" message by always answering yes.
  (flet ((yes-or-no-p (&rest args) t)
         (y-or-n-p (&rest args) t))
    ;; flymake-pyflakes-load will be called for all files that trigger
    ;; python-mode so don't be specific about the file name mask.
    (set (make-local-variable 'flymake-allowed-file-name-masks) '((".+" flymake-pyflakes-init)))
    (flymake-mode t)))

(add-hook 'python-mode-hook 'flymake-pyflakes-load)

(provide 'flymake-pyflakes)
