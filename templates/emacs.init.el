;; FIRST LAUNCH SETUP STUFF:
;; company  ac-js2 js2-mode js2-refactor yasnippet ivy swiper counsel
(setq package-list '(use-package counsel blacken company ivy))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


;; fetch the list of packages available

(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; END OF FIRST LAUNCH SETUP STUFF

;; (use-package python-black
;;   :demand t
;;   :after python
;;   :hook (python-mode . python-black-on-save-mode-enable-dwim))

;; general emacs settings

(setq c-basic-offset 4) ; indents 4 chars
(setq tab-width 4) ; tab is 4 chars
(setq indent-tabs-mode nil) ; force use of spaces
(setq inhibit-startup-screen t) ; inhibit the startup screen
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; open .h files in c++ mode
(delete-selection-mode 1) ; replace selected text if selected 


;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (setq indent-tabs-mode f)
;; 	    (setq tab-width 4)
;; 	    (setq python-indent-offset 4)))

(add-hook 'python-mode-hook 'blacken-mode)

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

(electric-pair-mode 1) ; auto close bracket insertion. New in emacs 24
;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs
      '(
	(?\" . ?\")
	(?\{ . ?\})
	(?\' . ?\')
	))


;; highlights the present line with a very faint glow

;; flycheck
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

;; ivy
;;(ivy-mode)

;;(global-set-key (kbd "C-s") 'swiper)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "C-s") 'counsel)



;; yasnippets

;;(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;;(setq yas/indent-line nil)
;;(yas-global-mode 1)

;; company abbreviation in the window using dabbrev and yasnippets search with company

;;(add-hook 'after-init-hook 'global-company-mode)
;;(with-eval-after-load 'company
;;  (add-to-list 'company-backends '(company-dabbrev-code))
;;  (setq company-tooltip-limit 20) ; bigger popup window
;;  (setq company-idle-delay .3) ; decrease delay before aucompl popup appears
;;  (global-set-key (kbd "C-<down>") 'company-yasnippet)
;;  )

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
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; (setq ac-js2-evaluate-calls t) ; allows ac-js2 to evaluate custom code and try to color
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; ;; Better imenu
;; (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
;; (add-hook 'js2-mode-hook #'js2-refactor-mode)
;; (js2r-add-keybindings-with-prefix "C-c C-r")
;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)

;; (add-hook 'js2-mode-hook (lambda ()
;; 			     (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))


;; Modelica

;; (setq load-path (cons "~/.emacs.d/elisp/" load-path))
;; (autoload 'modelica-mode "modelica-mode" "Modelica Editing Mode" t)
;; (setq auto-mode-alist (cons '("\.mo$" . modelica-mode) auto-mode-alist))

;; Modelica browsing
;; (autoload 'mdc-browse "mdc-browse" "Modelica Class Browsing" t)
;; (autoload 'br-mdc "br-mdc" "Modelica Class Browsing" t)

(defvar br-env-lang-avector
  '[
    ("C++/C"   . "c++-")
    ("Eiffel"  . "eif-")
    ("Info"    . "info-")
    ("Java"    . "java-")
    ("Lisp"    . "clos-")
    ("Modelica" . "mdc-")
    ("Obj-C"   . "objc-")
    ("Python"  . "python-")
    ]
  "Association vector of elements of OO-Browser languages.")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(blacken use-package counsel)))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
