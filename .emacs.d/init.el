(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory))

(tool-bar-mode nil)
(setq inhibit-splash-screen t)

(set-default-font "Inconsolata-9")

(keyboard-translate ?\C-h ?\C-?)

(setq-default tab-width 4)
(setq scroll-step 1)
(set-scroll-bar-mode 'right)

;; c-mode
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (c-set-style "k&r")
	     (setq indent-tabs-mode t)
	     (setq c-basic-offset 4)))

;; バックアップファイル
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))

;; revive.el
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)
;(define-key ctl-x-map "F" 'resume)                        ; C-x F で復元
;(define-key ctl-x-map "K" 'wipe)                          ; C-x K で Kill
(add-hook 'kill-emacs-hook 'save-current-configuration)   ; 終了時に保存
(resume) ; 起動時に復元
