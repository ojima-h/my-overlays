(add-to-list 'load-path "@SITELISP@")
(autoload 'ruby-defs "rdefs-el")
;(autoload 'rdefs-mode "rdefs-el"
;            "Minor mode for ruby defs" t)

;;; ruby-mode key-bindings (extracted and modified from the original)
;;; Visit a ruby source code file and press Meta(ESC)-e, and you get
;;; the output from rdefs command.

;;(setq ruby-mode-map (make-sparse-keymap))
(defvar ruby-mode-map (make-sparse-keymap))
(define-key ruby-mode-map "\ee" 'ruby-defs)
