;;; package ---- solargraph
;;; Commentary:
;;; 

;;; Code:


(require 'request)

(defvar solargraph:port 7657)
(defvar solargraph:active-callback nil)
(defvar solargraph:complete-callback-function 'solargraph:complete-callback)

(defun solargraph:complete-callback (collection)
  "Solargraph complette callback (COLLECTION)."
  (let* ((bounds (bounds-of-thing-at-point 'symbol))
         (start (or (car bounds) (point)))
         (stop (or (cdr bounds) (point))))
    (completion-in-region start stop collection)
    ))

(defun solargraph:complete-request (callback)
  "Get completions (CALLBACK)."
  (let ((text (buffer-substring (point-min) (point-max)))
	(filename buffer-file-name)
	(line (- (count-lines 1 (point)) 1))
	(column (current-column))
	(callback callback)
	)
    (setq solargraph:active-callback callback)
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
  		   (funcall solargraph:active-callback cmpls)
  		   ))))))


(defun solargraph:complete ()
  "Show completions."
  (interactive)
  (solargraph:complete-request solargraph:complete-callback-function))

  (provide 'solargraph)

;;; solargraph.el ends here
