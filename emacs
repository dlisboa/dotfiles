(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(setq custom-file "~/.emacs.d/custom.el")

(custom-set-variables
 '(fill-column 80)
 '(line-spacing 0.12)
 '(indent-tabs-mode nil)
 '(column-number-mode t)
 '(confirm-kill-processes nil)
 '(frame-title-format "%f" t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(auto-save-default nil)
 '(require-final-newline nil)
 '(ring-bell-function (quote ignore))
 '(truncate-lines t))

(tool-bar-mode -1) ; no tool bar above
(scroll-bar-mode -1) ; no scroll bar
(global-display-line-numbers-mode +1)
(fringe-mode 0) ; remove gray line before numbers
(column-number-mode +1) ; show column number on mode line
(show-paren-mode +1) ; show matches
(setq-default auto-fill-function 'do-auto-fill)
(blink-cursor-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode +1)

;; Evil
(setq evil-want-keybinding nil)

(use-package evil-leader
  :custom
  (evil-leader/leader ",")
  :config
  (global-evil-leader-mode))

(evil-leader/set-key-for-mode 'emacs-lisp-mode
    "el" 'eval-last-sexp
    "ep" 'eval-print-last-sexp
    "ed" 'eval-defun
    "er" 'eval-region
    "eb" 'eval-buffer)

(use-package evil
  :custom
  (evil-want-C-u-scroll t)
  (evil-want-Y-yank-to-eol t)
  (evil-cross-lines t)
  (evil-split-window-below t)
  (evil-vsplit-window-right t)
  :config
  (evil-mode +1)
  (define-key evil-normal-state-map "gt" 'mac-next-tab-or-toggle-tab-bar)
  (define-key evil-normal-state-map "gT" 'mac-previous-tab-or-toggle-tab-bar))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package evil-numbers
  :config
  (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt))

(use-package evil-surround
  :config
  (global-evil-surround-mode +1))

(use-package evil-matchit
  :config
  (global-evil-matchit-mode +1))

(use-package evil-vimish-fold
  :config
  (global-evil-vimish-fold-mode +1))

(use-package evil-collection)

;; Projectile / Helm
(use-package projectile
  :after
  (evil-leader)
  :init
  (setq
   projectile-project-search-path '("~/code/")
   projectile-sort-order 'recently-active)
  :bind
  (:map evil-leader--default-map
        ("p" . 'projectile-command-map))
  :config
  (projectile-mode +1))

(use-package helm
  :bind
  (:map evil-leader--default-map
        ("b" . 'helm-buffers-list)))

(use-package helm-ag)

(use-package helm-projectile
  :config
  (helm-projectile-on))

;; Git
(use-package git-gutter
  :config
  (setq git-gutter:modified-sign "~")
  (set-face-foreground 'git-gutter:modified "cyan")
  (global-git-gutter-mode +1))

(use-package magit
  :bind
  (:map evil-leader--default-map
        ("g" . 'magit-status)))

(use-package evil-magit)

(use-package parinfer
  :defer t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (add-hook 'clojure-mode-hook #'parinfer-mode)
  (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
  :custom
  (parinfer-extensions '(defaults evil smart-tab)))

(use-package clojure-mode
  :defer t
  :bind
  (:map evil-leader--default-map
        ("ji" . 'cider-jack-in))
  :config
  (eldoc-mode)
  (evil-leader/set-key-for-mode 'clojure-mode
    "ee" 'cider-eval-sexp-at-point
    "el" 'cider-eval-last-sexp
    "ep" 'cider-eval-print-last-sexp
    "ed" 'cider-eval-defun-at-point
    "er" 'cider-eval-region
    "rt" 'cider-test-run-test
    "rr" 'cider-test-rerun-test
    "rf" 'cider-test-rerun-failed-tests
    "rn" 'cider-test-run-ns-tests
    "rp" 'cider-test-run-project-tests))  

(use-package cider
  :defer t)

(use-package paren-face
  :config
  (global-paren-face-mode))

(use-package robe
  :defer t)

(use-package ruby-end
  :defer t)

(use-package rspec-mode
  :defer t
  :bind
  (:map evil-leader--default-map
        ("rt" . 'rspec-verify-single)
        ("rr" . 'rspec-run-last-failed)
        ("rb" . 'rspec-verify)))

(use-package neotree
  :custom
  (neo-window-fixed-size nil)
  (neo-theme 'icons)
  (neo-vc-integration nil)
  (neo-smart-open t)
  (neo-window-width 40)
  :config
  (evil-leader/set-key "t" 'neotree-toggle))

(use-package doom-themes
    :config 
    (setq doom-themes-enable-bold t
          doom-themes-enable-italic t)
    (load-theme 'doom-one t))

(use-package doom-modeline
  :init (doom-modeline-mode))

(custom-set-faces
 '(doom-modeline-buffer-file ((t (:foreground "#bbc2cf" :weight bold))))
 '(line-number ((t (:background "default" :foreground "#5b6268"))))
 '(line-number-current-line ((t (:background "default" :foreground "#5b6268"))))
 '(minibuffer-prompt ((t (:background "#282c34" :foreground "#51afef" :weight bold)))))
