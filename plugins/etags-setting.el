(require 'auto-complete-etags)

(setq ac-sources (append '(ac-source-etags) ac-sources))

;; global variables
(defvar etags-src-dir nil)
(defvar etags-saved-tagfile-name nil)
(defvar etags-language-type nil)

(defun etags-update()
  "Make ETAGS incremental update"

  (if (and (null etags-src-dir)
	   (null etags-saved-tagfile-name)
	   (null etags-language-type))
      (message "no tags updated for etags")
    (with-temp-buffer
      (shell-command
       (concat "ctags" " " "--languages=" etags-language-type " " "-e -R -f" " " etags-saved-tagfile-name " " etags-src-dir)
       (buffer-name)))))

(add-hook 'after-save-hook 'etags-update)

;; etags created func
(defun generate-etags()
  "Generate tag tables"
  (interactive)
  (let ((language-type "")
	(src-dir "")
	(saved-tagfile-name ""))
    (setq src-dir (read-from-minibuffer "source directory:")
	  language-type (read-from-minibuffer "language type:")
	  saved-tagfile-name (read-from-minibuffer "tags save path:"))
    (setf etags-src-dir src-dir)
    (setf etags-language-type language-type)
    (setf etags-saved-tagfile-name saved-tagfile-name)

    (with-temp-buffer
      (shell-command
       (concat "ctags" " " "--languages=" etags-language-type " " "-e -R -f" " " etags-saved-tagfile-name " " etags-src-dir)
       (buffer-name)))))

;; load etags
(defalias 'load-etags 'visit-tags-table)
