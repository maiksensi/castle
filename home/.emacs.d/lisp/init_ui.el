;UI init

;; set pretty font
(set-face-attribute 'default nil :font "Hack-10")

;; turn off toolbar and the menubar and the scrollbar
(if (functionp 'tool-bar-mode) (tool-bar-mode -1))
(if (functionp 'menu-bar-mode) (menu-bar-mode -1)) 
(if (functionp 'toogle-scroll-bar) (toggle-scroll-bar -1))

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)
;; highlight line where cursor is 
(global-hl-line-mode 1)
;; important custom for commenting regions
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; customize whitespace mode
(require 'whitespace)
(global-whitespace-mode t)

					; make carriage returns blue and tabs green
(custom-set-faces
 '(my-carriage-return-face ((((class color)) (:background "blue"))) t)
 '(my-tab-face ((((class color)) (:background "green"))) t)
 )
					; add custom font locks to all buffers and all files
(add-hook
 'font-lock-mode-hook
 (function
  (lambda ()
    (setq
     font-lock-keywords
     (append
      font-lock-keywords
      '(
	("\r" (0 'my-carriage-return-face t))
	("\t" (0 'my-tab-face t))
	))))))

					; make characters after column 80 purple
(setq whitespace-style
      (quote (face trailing tab-mark lines-tail)))
(add-hook 'find-file-hook 'whitespace-mode)

					; transform literal tabs into a right-pointing triangle
(setq
 whitespace-display-mappings ;http://ergoemacs.org/emacs/whitespace-mode.html
 '(
   (tab-mark 9 [9654 9] [92 9])
					;others substitutions...
   ))

; COLOR THEME init
(load-theme 'zenburn t)

; FILE HANDLING init 
;; do not make backup files
(setq make-backup-files nil)
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/auto-save-list/" t)

; provide, so init.el can load
(provide 'init_ui)
