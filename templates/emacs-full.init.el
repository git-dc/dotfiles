;; .emacs.d/init.el

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; Initializes the package infrastructure
(package-initialize)
;; If there are no archived package contents, refresh them
(unless package-archive-contents
  (package-refresh-contents))

;; Installs packages

;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults material-theme company yasnippet ivy swiper counsel) )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

(setq c-basic-offset 4) ; indents 4 chars
(setq tab-width 4) ; tab is 4 chars
(setq indent-tabs-mode nil) ; force use of spaces
(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally
(setq linum-format "%-3d\u2502") ; 4 digits accounted for with left justification
(global-visual-line-mode 1) ; text wrapping
(show-paren-mode 1)                 ;; highlight matching parens
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; open .h files in c++ mode
(delete-selection-mode 1) ; replace selected text if selected
(electric-pair-mode 1) ; auto close bracket insertion. New in emacs 24
;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs
      '(
	(?\" . ?\")
	(?\{ . ?\})
	(?\' . ?\')
	))


;; Python config
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode f)
	    (setq tab-width 4)
	    (setq python-indent-offset 4)))

;; custom functions:

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
        (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun kill-line-from-anywhere ()
  "Run `beginning-of-visual-line' and `kill-line' in sequence."
  (interactive)
  (beginning-of-visual-line)
  (kill-line))

(defun bind-compile-for-cpp ()
  "Unbinds `comment-region' and instead binds `compile' to C-c C-c in c++-mode."
  (local-unset-key (kbd "C-c C-c"))
  (locacl-set-key (kbd "C-c C-c") 'compile))


;; key bindings (use M-x describe-key RET <your key sequence>)

(global-unset-key (kbd "<f1>"))
(global-unset-key (kbd "M-c"))
;(global-unset-key (kbd "ESC <right>"))
;(global-unset-key (kbd "ESC <left>"))
;(global-unset-key (kbd "ESC <up>"))
;(global-unset-key (kbd "ESC <down>"))
;(global-unset-key (kbd "M-<right>"))
;(global-unset-key (kbd "M-<left>"))
;(global-unset-key (kbd "M-<right>"))
;(global-unset-key (kbd "M-<left>"))
;(global-unset-key (kbd "C-k"))
;(global-unset-key (kbd "C-c C-c"))
;(global-unset-key (kbd "C-/"))
;(global-unset-key (kbd "C-x C-u"))

;; key bindings 
;; (global-set-key (kbd "C-k") 'kill-line-from-anywhere)
;; (global-set-key (kbd "C-<left>") 'left-word)
;; (global-set-key (kbd "C-<right>") 'right-word)
;; (global-set-key (kbd "M-[ h") 'move-beginning-of-line)
;; (global-set-key (kbd "M-[ f") 'move-end-of-line)
;; (global-set-key (kbd "M-[ d") 'left-word)
;; (global-set-key (kbd "M-[ c") 'right-word)
;; (global-set-key [(control ?h)] 'backward-kill-word)
;; (global-set-key (kbd "C-w") 'backward-kill-word)
;; (global-set-key (kbd "C-a") 'help-command) ; help
;; (global-set-key (kbd "<ESC><left>") 'windmove-left)
;; (global-set-key (kbd "<ESC><right>") 'windmove-right)
;; (global-set-key (kbd "<ESC><up>") 'windmove-up)
;; (global-set-key (kbd "<ESC><down>") 'windmove-down)
;; (global-set-key (kbd "M-<left>") 'windmove-left)
;; (global-set-key (kbd "M-<right>") 'windmove-right)
;; (global-set-key (kbd "M-<up>") 'windmove-up)
;; (global-set-key (kbd "M-<down>") 'windmove-down)
;; (global-set-key (kbd "C-c C-c") 'compile)
(global-set-key (kbd "M-c") 'comment-or-uncomment-region-or-line)



;; c++ config
;; flycheck
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

;; ivy
(ivy-mode)



(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(setq yas-indent-line nil)
(yas-global-mode 1)

;; company abbreviation in the window using dabbrev and yasnippets search with company

(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (add-to-list 'company-backends '(company-dabbrev-code))
  (setq company-tooltip-limit 20) ; bigger popup window
  (setq company-idle-delay .3) ; decrease delay before aucompl popup appears
  (global-set-key (kbd "C-<down>") 'company-yasnippet)
  )

(set-face-attribute 'mode-line
                    nil
                    :foreground "gray80"
                    :background "gray20"
                    :box '(:line-width 1 :style released-button)
                    )
(set-face-attribute 'mode-line-inactive
                    nil
                    :foreground "gray80"
                    :background "gray50"
                    :box '(:line-width 1 :style releasedbutton)
                    )


;; User-Defined init.el ends here


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(material-theme company better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
