
;;; -*- lexical-binding: t -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-support-shift-select 'always)
 '(package-selected-packages '(go-mode multiple-cursors rust-mode)))


(add-to-list 'default-frame-alist' `(font . "Iosevka-20"))
(global-display-line-numbers-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(ido-mode 1)
(ido-everywhere 1)
(global-whitespace-mode -1)
(whitespace-mode -1)

(setq inhibit-startup-message t)
(setq mc/always-run-for-all 1)


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)





(defun rc/set-up-whitespace-handling ()
  (interactive)
  ;;(whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'tuareg-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c++-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'simpc-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'emacs-lisp-mode 'rc/set-up-whitespace-handling)
(add-hook 'java-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'lua-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'rust-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'scala-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'markdown-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'haskell-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'python-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'erlang-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'asm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'fasm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'go-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'nim-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'yaml-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'porth-mode-hook 'rc/set-up-whitespace-handling)

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (pos-bol)))
    (line (let ((s (thing-at-point 'line t)))
     (if s (string-remove-suffix "\n" s) ""))))
  (move-end-of-line 1)
  (newline)
  (insert line)
  (move-beginning-of-line 1)
  (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)


;; Adding /path/to/simpc to load-path so require can find it
;;(add-to-list 'load-path "/home/rom/.emacs.d/simpc-mode/")
;; Importing simpc-mode
;;(require 'simpc-mode)
;; Automatically enabling simpc-mode on files with extensions like .h, .c, .cpp, .hpp
;;(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))




(require 'multiple-cursors)
;;(where-is-internal (kbd "C-S-c"))
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;;(global-set-key (kbd "C-S-c b") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-c b") 'mc/edit-beginnings-of-lines)
;;(global-set-key (kbd "C-S-c e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-;") 'mc/mark-next-like-this-symbol)
(put 'dired-find-alternate-file 'disabled nil)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(put 'upcase-region 'disabled nil)


;; my theme goes here

(set-face-attribute 'font-lock-keyword-face nil :foreground "#00C292" :weight 'bold)
(set-face-attribute 'line-number nil :foreground "#71CF3A" :weight 'bold)

(set-face-attribute 'font-lock-type-face nil :foreground "#C8E813" :weight 'bold)
(set-face-attribute 'font-lock-doc-face nil :foreground "#FFFFFF" :weight 'extra-light)
(set-face-attribute 'font-lock-string-face nil :foreground "#c7d9d1" :weight 'bold)
(set-face-attribute 'font-lock-function-name-face nil :foreground "#9efa52" :weight 'light)
(set-face-attribute 'font-lock-builtin-face nil :foreground "#52fa90" :weight 'light)
(set-face-attribute 'font-lock-comment-face nil :foreground "#6DB094" :weight 'light :slant 'italic)
(set-face-attribute 'font-lock-preprocessor-face nil :foreground "#1FE090" :weight 'light)

(set-face-attribute 'ido-subdir nil :foreground "#FFFFFF" :weight 'bold)
(set-face-attribute 'default nil :foreground "#fad82d" :weight 'light)

(set-face-attribute 'region nil :background "#32A2A8" :weight 'light)
(set-face-attribute 'region nil :foreground "#FFFFFF" :weight 'bold)

(add-to-list 'default-frame-alist '(background-color . "#054D3D"))
(set-cursor-color "#FFFFFF")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
