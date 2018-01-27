;;; package ---- solargraph
;;; Commentary:
;;; 

;;; Code:


(require 'request)

(defvar solargraph:port 7657)
(defvar solargraph:complete-callback-function 'solargraph:complete-callback)

(defun solargraph:complete-callback (collection)
  "Solargraph complette callback (COLLECTION)."
  (let* ((bounds (bounds-of-thing-at-point 'symbol))
         (start (or (car bounds) (point)))
         (stop (or (cdr bounds) (point))))
    (completion-in-region start stop collection)
    ))

(defun solargraph:complete-request (text filename line column)
  "Get completions (TEXT, FILENAME, LINE, COLUMN)."
  (request
   (format "http://localhost:%s/suggest" solargraph:port)
   :type "POST"
   :data `(
	   ("text" . ,text)
	   ("filename" . ,filename)
	   ("line" . ,line)
	   ("column" . ,column)
	   ("workspace" . "solargraph")
	   )
   :parser 'json-read
   :success (cl-function
             (lambda (&key data &allow-other-keys)
               (let* ((sugg-data (assoc-default 'suggestions data))
		      (cmpls (mapcar (lambda (x) (cdr (elt x 2))) sugg-data))) ;
		 (funcall solargraph:complete-callback-function cmpls)
		 ))))
  )

(defun solargraph:complete ()
  "Show completions."
  (interactive)
  (solargraph:complete-request
   (buffer-substring (point-min) (point-max))
   buffer-file-name
   (- (count-lines 1 (point)) 1)
   (current-column)
   )
  )

(provide 'solargraph)

;;; solargraph.el ends here
