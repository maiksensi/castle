;; adding all neccessary paths we need

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq load-path (append load-path '("~/.emacs.d/lisp" )))

;; PACKAGE System init
(require 'init_elpa)

;; UI settings
(require 'init_ui)

;; yasnippets
(require 'yasnippet)
(yas-global-mode 1)

;; use Ido mode
(require 'ido)
(ido-mode t)

;; use helm mode
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)

;; reveal.js
(require 'ox-reveal)

;; add dockerfile mode
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; add hcl file mode
(require 'hcl-mode)
(add-to-list 'auto-mode-alist '("\\.tf\\'" . hcl-mode))

;; REMOVE stupid autosave files
(setq backup-inhibited t)
(setq make-backup-files nil)

;; set default startup directory
(setq default-directory "~")

;; magit setup
;; setup git to show password prompt on https repos
(setenv "GIT_ASKPASS" "git-gui--askpass")

;; use the magit gitflow plugin
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; python mode
;; https://github.com/jorgenschaefer/elpy
;; install rope jedi flake8 importmagic autopep8 yapf with pip before using
(require 'elpy)
(elpy-enable)

;; make sure to use correct markdown command
(custom-set-variables '(markdown-command "/usr/bin/pandoc"))

;; USE special hook for tex-default-command, as it is a local variable
;; enable a shortcut for nixos options
;; see https://github.com/travisbhartwell/nix-emacs
(global-set-key (kbd "C-c C-s") 'helm-nixos-options)

(add-to-list 'company-backends 'company-nixos-options)
(setq flycheck-command-wrapper-function
        (lambda (command) (apply 'nix-shell-command (nix-current-sandbox) command))
      flycheck-executable-find
      (lambda (cmd) (nix-executable-find (nix-current-sandbox) cmd)))
(setq haskell-process-wrapper-function
        (lambda (args) (apply 'nix-shell-command (nix-current-sandbox) args)))

;; use special hook for tex-default-command, as it is a local variable
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   (quote
    (("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "%(PDF)amstex %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "texexec --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "texexec %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file")
     ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("latexmk" "latexmk -pdf -interaction=nonstopmode %t" TeX-run-command t t :help "Run latexmk"))))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (helm-ag markdown-toc flymd elpy markdown-mode hcl-mode ox-reveal dockerfile-mode helm magit-gitflow magit yasnippet auctex zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-carriage-return-face ((((class color)) (:background "blue"))) t)
 '(my-tab-face ((((class color)) (:background "green"))) t))
