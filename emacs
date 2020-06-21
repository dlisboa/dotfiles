;; -*- mode: emacs-lisp -*-
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))

(package-initialize)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(use-package exec-path-from-shell)
(exec-path-from-shell-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(setq default-directory "~/")

(custom-set-variables
 '(auto-save-default nil)
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(confirm-kill-processes nil)
 '(fill-column 80)
 '(frame-title-format "%f" t)
 '(gc-cons-threshold 20000000)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(line-spacing 0.2)
 '(mac-command-modifier 'meta)
 '(make-backup-files nil)
 '(ns-right-alternate-modifier 'none)
 '(read-process-output-max (* 10 1024 1024)) ; 10 MiB
 '(require-final-newline nil)
 '(ring-bell-function (quote ignore))
 '(truncate-lines t))

(set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)

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
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

(defun other-window/scroll-down ()
  (interactive)
  (other-window 1)
  (evil-scroll-line-down 1)
  (other-window 1))

(defun other-window/scroll-up ()
  (interactive)
  (other-window 1)
  (evil-scroll-line-up 1)
  (other-window 1))

(defun other-window/page-down ()
  (interactive)
  (other-window 1)
  (evil-scroll-page-down 1)
  (other-window 1))

(defun other-window/page-up ()
  (interactive)
  (other-window 1)
  (evil-scroll-page-up 1)
  (other-window 1))


(defun other-window/quit ()
  (interactive)
  (other-window 1)
  (quit-window))

(use-package evil
  :custom
  (evil-want-C-u-scroll t)
  (evil-want-Y-yank-to-eol t)
  (evil-cross-lines t)
  (evil-split-window-below t)
  (evil-vsplit-window-right t)
  :config
  (evil-mode +1)
  (define-key evil-window-map (kbd "C-e") 'other-window/scroll-down)
  (define-key evil-window-map (kbd "C-y") 'other-window/scroll-up)
  (define-key evil-window-map (kbd "C-d") 'other-window/page-down)
  (define-key evil-window-map (kbd "C-u") 'other-window/page-up)
  (define-key evil-window-map (kbd "C-q") 'other-window/page-up))

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

;; Projectile / Helm
(use-package projectile
  :after
  (evil-leader)
  :custom
  (projectile-project-search-path '("~/code/"))
  (projectile-sort-order 'recently-active)
  :bind
  (:map evil-leader--default-map
        ("p" . 'projectile-command-map))
  :config
  (projectile-mode +1))

(use-package helm
  :bind
  (:map evil-leader--default-map
        ("b" . 'helm-buffers-list)))

(use-package helm-ag
  :after (helm))

(use-package helm-projectile
  :after (helm projectile)
  :init
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

(use-package bundler
  :defer t)

(use-package projectile-rails
  :defer t)

(use-package rspec-mode
  :defer t
  :bind
  (:map evil-leader--default-map
        ("rt" . 'rspec-verify-single)
        ("rr" . 'rspec-run-last-failed)
        ("rb" . 'rspec-verify)))

(use-package inf-ruby
  :config
  (add-hook 'rspec-compilation-mode-hook 'inf-ruby-switch-from-compilation))

(use-package neotree
  :custom
  (neo-window-fixed-size nil)
  (neo-theme 'icons)
  (neo-vc-integration nil)
  (neo-smart-open t)
  (neo-window-width 40)
  :config
  (evil-leader/set-key "t" 'neotree-toggle))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :init
  (load-theme 'doom-one t))

(use-package markdown-mode
  :defer t)

(use-package dockerfile-mode
  :defer t)

(use-package evil-collection
  :config
  (evil-collection-init))

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package restclient
  :defer t)

(use-package flycheck)
(use-package lsp-mode
  :hook (prog-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :config
  (define-key evil-normal-state-map (kbd "SPC") lsp-command-map))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-lsp)

(use-package lsp-ui
  :custom
  (lsp-ui-peek-enable t)
  (lsp-log-io t)
  (lsp-print-performance t)
  (lsp-prefer-capf t))
