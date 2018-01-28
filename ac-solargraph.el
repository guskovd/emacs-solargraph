;;; package ---- ac-solargraph
;;; Commentary:
;;;

(require 'solargraph)
(require 'auto-complete)

;;; Code:

(defun ac-solargraph:complete-callback (collection)
  "Solargraph complette callback (COLLECTION)."
  (let* ((ac-source-solargraph `((candidates . ',collection))))
    (auto-complete '(ac-source-solargraph))))

(defun ac-solargraph:candidates ()
  "Send `solargraph' complete request."
  (solargraph:complete-request 'ac-solargraph:complete-callback)
  nil)

(ac-define-source solargraph
  '((candidates . ac-solargraph:candidates)))

(defun ac-solargraph:complete ()
  "Show completions."
  (interactive)
  (solargraph:complete-request 'ac-solargraph:complete-callback))

(defun ac-solargraph:setup ()
  "Setup."
  (push 'ac-source-solargraph ac-sources)
  (unless auto-complete-mode
    (auto-complete-mode)))

(provide 'ac-solargraph)

;;; ac-solargraph.el ends here
