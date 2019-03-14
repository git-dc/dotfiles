;; FIRST LAUNCH SETUP STUFF:
(setq package-list '(company yasnippet ivy swiper counsel nlinum ac-js2 js2-mode js2-refactor));; use-package))
;; load emacs 24's package system. Add melpa repo.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/") ; many packages won't show under melpa stable
   t))
(package-initialize) ; load and activate packages


;; fetch the list of packages available

(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; END OF FIRST LAUNCH SETUP STUFF



;; general emacs settings

(setq c-basic-offset 4) ; indents 4 chars
(setq tab-width 4) ; tab is 4 chars
(setq indent-tabs-mode nil) ; force use of spaces
(setq inhibit-startup-screen t) ; inhibit the startup screen
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; open .h files in c++ mode
(delete-selection-mode 1) ; replace selected text if selected 


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
(global-unset-key (kbd "ESC <right>"))
(global-unset-key (kbd "ESC <left>"))
(global-unset-key (kbd "ESC <up>"))
(global-unset-key (kbd "ESC <down>"))
(global-unset-key (kbd "M-<right>"))
(global-unset-key (kbd "M-<left>"))
(global-unset-key (kbd "M-<right>"))
(global-unset-key (kbd "M-<left>"))
(global-unset-key (kbd "C-k"))
(global-unset-key (kbd "C-c C-c"))
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "C-x C-u"))
;; (global-unset-key (kbd "C-w"))


(global-set-key (kbd "C-k") 'kill-line-from-anywhere)
(global-set-key (kbd "C-<left>") 'left-word)
(global-set-key (kbd "C-<right>") 'right-word)
(global-set-key (kbd "M-[ h") 'move-beginning-of-line)
(global-set-key (kbd "M-[ f") 'move-end-of-line)
(global-set-key (kbd "M-[ d") 'left-word)
(global-set-key (kbd "M-[ c") 'right-word)
(global-set-key [(control ?h)] 'backward-kill-word)
;; (global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-a") 'help-command) ; help
(global-set-key (kbd "<ESC><left>") 'windmove-left)
(global-set-key (kbd "<ESC><right>") 'windmove-right)
(global-set-key (kbd "<ESC><up>") 'windmove-up)
(global-set-key (kbd "<ESC><down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "C-c C-c") 'compile)
(global-set-key (kbd "C-_") 'comment-or-uncomment-region-or-line)


(add-hook 'c++-mode-hook 'bind-compile-for-cpp )

;;(bind-key* "<C-c C-c>" 'compile)

(global-set-key (kbd "C-c c") 'comment-line)

;;(global-hl-line-mode t) ; highline current line

(show-paren-mode 1) ; highlight matching parens

(global-linum-mode t) ; always show line numbers

(setq linum-format "%-3d\u2502") ; 4 digits accounted for with left justification

(global-visual-line-mode 1) ; text wrapping

;; highlights the present line with a very faint glow

;; (set-face-attribute 'hl-line nil :background "#4C4C4C")
;; (set-face-attribute 'linum-highlight-face nil :weight 'bold :background "#4C4C4C" :foreground "#9FC59F")
;; (set-face-attribute 'linum nil :foreground "#537953")


;; flycheck
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

;; ivy
(ivy-mode)

;;(global-set-key (kbd "C-s") 'swiper)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "C-s") 'counsel)



;; yasnippets

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(setq yas/indent-line nil)
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
;;; javascript stuff

;; javascript coloring
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t) ; allows ac-js2 to evaluate custom code and try to color
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)

;; (add-hook 'js2-mode-hook (lambda ()
;; 			     (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))






