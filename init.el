;; Goodbye to hello
(setq inhibit-startup-message t)

(scroll-bar-mode -1) ; No Scrollbar
(tool-bar-mode -1) ; No Toolbar
(tooltip-mode -1) ; No Tooltips
(set-fringe-mode 10) ; More padding
(menu-bar-mode -1) ; No Menu Bar

(setq visible-bell t)

; Nerd Font!
(set-face-attribute 'default nil :font "Fira Code Nerd Font Mono" :height 140)
(load-theme 'deeper-blue)

;; Initialize package sources

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

(use-package swiper
  :diminish
  :ensure t)

(use-package counsel
  :diminish
  :ensure t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package all-the-icons
  :if (display-graphic-p))

;; Buffer Magic
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
