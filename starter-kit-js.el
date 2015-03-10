
(font-lock-add-keywords
 'espresso-mode `(("\\(function *\\)("
                   (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                             "ƒ")
                             nil)))))

(font-lock-add-keywords 'espresso-mode
                        '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
                           1 font-lock-warning-face t)))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(defun starter-kit-pp-json ()
  "Pretty-print the json object following point."
  (interactive)
  (require 'json)
  (let ((json-object (save-excursion (json-read))))
    (switch-to-buffer "*json*")
    (delete-region (point-min) (point-max))
    (insert (pp json-object))
    (goto-char (point-min))))
