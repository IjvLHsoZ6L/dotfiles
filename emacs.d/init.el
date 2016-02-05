;; Emacs directory
(when load-file-name (setq user-emacs-directory (file-name-directory load-file-name)))

;; Package management
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defun package-install-with-refresh (package) (unless (assq package package-alist) (package-refresh-contents)) (unless (package-installed-p package) (package-install package)))

;; Install evil
(package-install-with-refresh 'evil)
(package-install-with-refresh 'seq)

;; Enable evil
(require 'evil)
;; (evil-mode 1)

;; do not display startup message
(setq inhibit-startup-message t)

;; do not make backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; use space for tab
(setq-default tab-width 4 indent-tabs-mode nil)

;; set default font
(set-face-attribute 'default nil :family "Ubuntu Mono" :height 120)
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Migu 1M"))

;; show corresponding parentheses
(show-paren-mode 1)

;; line number
(global-linum-mode t)

;; highlight cursor line
(global-hl-line-mode t)

;; map <C-h> to <backspace>
(global-set-key "\C-h" 'delete-backward-char)
