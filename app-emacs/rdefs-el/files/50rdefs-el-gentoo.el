;;; ruby-mode key-bindings (extracted and modified from the original)
;;; Visit a ruby source code file and press Meta(ESC)-e, and you get
;;; the output from rdefs command.

(setq ruby-mode-map (make-sparse-keymap))
(define-key ruby-mode-map "\ee" 'ruby-defs)
;; (define-key ruby-mode-map "{" 'ruby-electric-brace)
;; (define-key ruby-mode-map "}" 'ruby-electric-brace)
;; (define-key ruby-mode-map "\e\C-a" 'ruby-beginning-of-defun)
;; (define-key ruby-mode-map "\e\C-e" 'ruby-end-of-defun)
;; (define-key ruby-mode-map "\e\C-b" 'ruby-backward-sexp)
;; (define-key ruby-mode-map "\e\C-f" 'ruby-forward-sexp)
;; (define-key ruby-mode-map "\e\C-p" 'ruby-beginning-of-block)
;; (define-key ruby-mode-map "\e\C-n" 'ruby-end-of-block)
;; (define-key ruby-mode-map "\e\C-h" 'ruby-mark-defun)
;; (define-key ruby-mode-map "\e\C-q" 'ruby-indent-exp)
;; (define-key ruby-mode-map "\t" 'ruby-indent-command)
;; (define-key ruby-mode-map "\C-c\C-e" 'ruby-insert-end)
;; (define-key ruby-mode-map "\C-j" 'ruby-reindent-then-newline-and-indent)
;; (define-key ruby-mode-map "\C-m" 'newline)

(provide 'rdefs)
