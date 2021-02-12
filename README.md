# DEPRECATED!

let's use [eglot](https://github.com/joaotavora/eglot) or [lsp-mode](https://github.com/emacs-lsp/lsp-mode)

# emacs-solargraph

Ruby setup

install solargraph via:
```bash
gem install solargraph
```

or add 'solargraph' in you Gemfile.

start solargraph server:
```bash
solargraph server
```

Emacs setup

Clone this repository somewhere and add this directory to your load-path.

basic setup:

```elisp
(require 'solargraph)
(define-key ruby-mode-map (kbd "M-i") 'solargraph:complete)
```

Autocomplete setup

```elisp
(require 'ac-solargraph)
(define-key ruby-mode-map (kbd "M-i") 'ac-solargraph:complete)
```

Solargraph project: https://github.com/castwide/solargraph
