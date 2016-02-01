;; Emacs directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; Package management
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defun package-install-with-refresh (package)
  (unless (assq package package-alist)
    (package-refresh-contents))
  (unless (package-installed-p package)
    (package-install package)))

;; Install evil
;; (package-install-with-refresh 'evil)
;; (package-install-with-refresh 'seq)

;; Enable evil
;; (require 'evil)
;; (evil-mode 1)

;; map <C-h> to <backspace>
(keyboard-translate ?\C-h ?\C-?)

;; do not make backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; set default font
(add-to-list 'default-frame-alist
             '(font . "Monospace-16"))
