; PACKAGE-SYSTEM init
;; initializing the package manager of emacs
(require 'package)

;; 3rd party repository (python-mode, ipython, etc)
;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

;; 3rd party repo for themes, ergoemacs, etc
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; initialize everything
(package-initialize)

;; make sure packages get installed when missing
(setq required-pkgs '(zenburn-theme auctex yasnippet ido magit magit-gitflow helm dockerfile-mode ox-reveal hcl-mode markdown-mode elpy flymd markdown-toc flyspell helm-ag nixos-options helm-nixos-options nix-sandbox company-nixos-options))

(require 'cl)

(setq pkgs-to-install
      (let ((uninstalled-pkgs (remove-if 'package-installed-p required-pkgs)))
        (remove-if-not '(lambda (pkg) (y-or-n-p (format "Package %s is missing. Install it? " pkg))) uninstalled-pkgs)))

(when (> (length pkgs-to-install) 0)
  (package-refresh-contents)
  (dolist (pkg pkgs-to-install)
    (package-install pkg)))

; provide it to init.el
(provide 'init_elpa)
