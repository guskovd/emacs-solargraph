# emacs-solargraph

Emacs setup

Clone this repository somewhere and add this directory to your load-path.

basic setup:

```elisp
(require 'solargraph)
(define-key ruby-mode-map (kbd "M-i") 'solargraph:complete)
```

