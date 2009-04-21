; Config/.emacs						-*- emacs-lisp -*-
;; Ruby Mode
(add-to-list 'load-path "~/.emacs.d/ruby-includes/")


(require 'ruby-mode)
;(require 'ruby-electric)
(require 'autotest)


; Inhibit logon message that explains how to use EMACS
;(setq inhibit-startup-message t)

; I don't know what this does.
(setq text-mode-hook 'turn-on-auto-fill)

; Eliminate backup files
(setq make-backup-files nil)

; Enable single lisp expression evaluation.
(put 'eval-expression 'disabled nil)


; Define some extra file extensions and their modes.
(setq auto-mode-alist (mapcar 'purecopy
			      '(("\\.c$" . c-mode)
				("\\.cxx$" . c++-mode)
				("\\.cc$" . c++-mode)
				("\\.cpp$" . c++-mode)
				("\\.h$" . c-mode)
				("\\.tex$" . TeX-mode)
				("\\.txi$" . Texinfo-mode)
				("\\.el$" . emacs-lisp-mode)
				("\\.java$" . java-mode)
				("\\.sql$" . sql-mode)
				("\\.pm$" . perl-mode)
				("\\.pl$" . perl-mode)
				("[Mm]akefile$" . makefile-mode)
				("\\.m$" . objc-mode)
				("\\.mm$" . objc-mode)
				("x[ms]l$" . sgml-mode)
				("\\.a$" . c-mode)
				("\\.rb$" . ruby-mode)
				("\\.erb$" . html-mode)
				("\\.rhtml$" . html-mode))))

(defun c-mode-elf-hook ()
  "Add our special C feature"
  (interactive)
  (setq show-trailing-whitespace t)
  (setq c-basic-offset 4))


;(add-hook 'ruby-mode-hook
;;           (lambda()
;;             (add-hook 'local-write-file-hooks
;;                       '(lambda()
;;                          (save-excursion
;;                            (untabify (point-min) (point-max))
;;                            (delete-trailing-whitespace)
;;                            )))
;;             (set (make-local-variable 'indent-tabs-mode) 'nil)
;;             (set (make-local-variable 'tab-width) 2)
;;             (imenu-add-to-menubar "IMENU")
;;            ; (define-key ruby-mode-map "Ctl-m" 'newline-and-indent) ;Not sure if this line is 100% right but it works!
;            (require 'ruby-electric)
;            (ruby-electric-mode t)
 ;           ))


(add-hook 'c-mode-hook 'c-mode-elf-hook)
(add-hook 'c++-mode-hook 'c-mode-elf-hook)
(add-hook 'objc-mode-hook 'c-mode-elf-hook)


(defun math-ruby-hook ()
  "Add whitespace viewing"
  (interactive)
  (setq show-trailing-whitespace t)
  (setq column-number-mode t))

(add-hook 'ruby-mode-hook 'math-ruby-hook)


(defun c-mode-linux ()
  "C mode the Linus way--good but for the stupid 8 character indents"
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq c-basic-offset 8))

(setq auto-mode-alist (cons '("/u-boot.*/.*\\.[ch]$" . c-mode-linux)
		       auto-mode-alist))
(setq auto-mode-alist (cons '("/linux.*/.*\\.[ch]$" . c-mode-linux)
		       auto-mode-alist))
(setq auto-mode-alist (cons '("/lolo/src/.*/.*\\.[ch]$" . c-mode-linux)
		       auto-mode-alist))


 (autoload 'run-ruby "inf-ruby"
     "Run an inferior Ruby process")
 (autoload 'inf-ruby-keys "inf-ruby"
     "Set local key defs for inf-ruby in ruby-mode")


 (add-hook 'ruby-mode-hook
     '(lambda ()
	 (inf-ruby-keys)))

 ;; If you have Emacs 19.2x or older, use rubydb2x
 (autoload 'rubydb "rubydb3x" "Ruby debugger" t)
 ;; uncomment the next line if you want syntax highlighting
 ;;(add-hook 'ruby-mode-hook 'turn-on-font-lock)



(defun sql-mode-elf-hook ()
  "Elf's specific sql mode"
  (interactive)
  (setq indent-tabs-mode nil)
)
(add-hook 'sql-mode-hook 'sql-mode-elf-hook)

;; begin subversion hooks

(defun svn-find-file-hook ()
  (if (string-match "/subversion/" buffer-file-name)
      (load "~/z/subversion/subversion/tools/dev/svn-dev"))
  (if (string-match "/subversion/doc/book" buffer-file-name)
      (load "~/z/subversion/subversion/doc/book/tools/svnbook")))

(add-hook 'find-file-hooks 'svn-find-file-hook)

;;; End Subversion development section



;; end subversion hooks

; I don't know what this does.
;(defvar cursor-map-2 (make-keymap)
;"for ESC-[")
;(fset 'Cursor-Map-2 cursor-map-2)
;(define-key esc-map "[" 'Cursor-Map-2)


;(define-key esc-map "[A" 'previous-line)
;(define-key esc-map "[B" 'next-line)
;(define-key esc-map "[C" 'forward-char)
;(define-key esc-map "[D" 'backward-char)
;(define-key esc-map "[H" 'beginning-of-line)
;(define-key esc-map "[Y" 'end-of-line)
;(define-key esc-map "[5^" 'scroll-down)
;(define-key esc-map "[6^" 'scroll-up)
;(define-key esc-map "[[A" 'help-for-help)
;(define-key esc-map "[[B" 'byte-compile-file)
;(define-key esc-map "[[C" 'isearch-forward)
;(define-key esc-map "[[D" 'query-replace-regexp)
;(define-key esc-map "[[E" 'eval-defun)
;(define-key esc-map "[[F" 'eval-current-buffer)
;(define-key esc-map "[[G" 'buffer-menu)
;(define-key esc-map "[[H" 'global-set-key)
;(define-key esc-map "[[I" 'save-buffer)
;(define-key esc-map "[[J" 'save-buffers-kill-emacs)
;(define-key esc-map "[2^" 'set-mark-command)
;(define-key esc-map "[3^" 'delete-char)

;(setq load-path (cons (expand-file-name "PATH_FOR_AUC-TEX") load-path))
;(autoload 'tex-mode "auc-tex" "Automatic select TeX or LaTeX mode" t)
;(autoload 'plain-tex-mode "auc-tex" "Mode for Plain TeX" t)
;(autoload 'latex-mode "auc-tex" "Mode for LaTeX" t)
;(autoload 'LaTeX-math-mode    "tex-math"      "Math mode for TeX." t)
;(autoload 'outline-minor-mode "outline-m" "Minor Outline Mode." t)

;(defun Ctl-C-prefix ()
;  Ctl-C-keymap)
;(setq Ctl-C-keymap (make-keymap))
;(global-set-key "\C-c" (Ctl-C-prefix))

;(define-key Ctl-C-keymap "m" 'LaTeX-math-mode)
;(define-key Ctl-C-keymap "o" 'outline-minor-mode)

(make-variable-buffer-local 'outline-prefix-char)
;(setq-default outline-prefix-char "\C-l")
;(make-variable-buffer-local 'outline-regexp)
;(setq-default outline-regexp "[*\l]+")
;(make-variable-buffer-local 'outline-level-function)
;(setq-default outline-level-function 'outline-level-default)
;(autoload 'ispell-word "ispell"
;  "Check the spelling of word in buffer." t)
;(global-set-key "\e$" 'ispell-word)
;(autoload 'ispell-region "ispell"
;  "Check the spelling of region." t)
;(autoload 'ispell-buffer "ispell"
;  "Check the spelling of buffer." t)
;(autoload 'ispell-complete-word "ispell"
;  "Look up current word in dictionary and try to complete it." t)
;(autoload 'ispell-change-dictionary "ispell"
;  "Change ispell dictionary." t)

;(setq auto-mode-alist
;   (append  '(("\\.st$" . smalltalk-mode))
;       auto-mode-alist))

;(autoload 'smalltalk-mode "/usr/emacs/lisp/st.el" "" t)

; This is an evil command to enable the downcase-region command.  We
; don't like this command, never use it, and hate it when it is
; invoked and we don't realize what has happened.
;(put 'downcase-region 'disabled nil)

;
; Elf enhancements
;

(setq gc-cons-threshold 1000000)	; Improve emacs execution throughput
(display-time)				; Add time to modeline
; (menu-bar-mode 0)			; Disable menu bar
(setq find-file-existing-other-name 1)	; find-file finds existing buffer, too

; Enable color highlighting when available
;(cond (window-system
;       (setq hilit-mode-enable-list  '(not text-mode)
;             hilit-background-mode   'light
;	     hilit-inhibit-hooks     nil
;             hilit-inhibit-rebinding nil)
;       (require 'hilit19)))

; Prepare for autoinsert things.
(defvar autoinsert-copyright "Marc Singer"
  "Copyright holder inserted into appropriate source files using auto-insert
templates.")

;; Automatic headers for new files from the ~/hdr directory
;
(load "autoinsert" nil t)
(load "time-stamp" nil t)
(if (boundp 'auto-insert)
    (add-hook 'find-file-hooks 'auto-insert))
(setq auto-insert-directory "~/.Headers/")
(setq auto-insert-alist '(

    (("\\.\\(cxx\\|c\\|cc\\)$" . "C++")
     nil "/* "
     (file-name-nondirectory buffer-file-name)
     "\n\n   written by " (getenv "AUTHOR") \n
     (substring (current-time-string) 8 10) " "
     (substring (current-time-string) 4 7) " "
     (substring (current-time-string) 20 24) >
     "\n\n   Copyright (C) " (format-time-string "%Y") " " autoinsert-copyright "\n"
     "\n   -----------\n   DESCRIPTION\n   -----------\n\n*/\n" _)

    (("\\.\\(java\\)$" . "Java Source")
     nil "/* "
     (file-name-nondirectory buffer-file-name)
     "\n\n   written by " (getenv "AUTHOR") \n
     (substring (current-time-string) 8 10) " "
     (substring (current-time-string) 4 7) " "
     (substring (current-time-string) 20 24) >
     "\n\n   Copyright (C) " (format-time-string "%Y") " " autoinsert-copyright "\n"
     "\n   -----------\n   DESCRIPTION\n   -----------\n\n*/\n" _)

    (("\\.\\(h\\)$" . "C Header")
     (upcase (concat "__"
		     (file-name-nondirectory
		      (substring buffer-file-name 0 (match-beginning 0)))
		     "_"
		     (substring buffer-file-name (1+ (match-beginning 0)))
		     "__"))
     "#if !defined (" str ")\n"
     "#    define   " str "\n\n"
     "/* ----- Includes */\n\n"
     "/* ----- Types */\n\n"
     "/* ----- Globals */\n\n"
     "/* ----- Prototypes */\n\n"
     "\n\n#endif  /* " str " */\n"
     '(goto-char (point-min))
     "/* " (file-name-nondirectory buffer-file-name)
     "\n\n   "
     "written by " (getenv "AUTHOR") \n
     (substring (current-time-string) 8 10) " "
     (substring (current-time-string) 4 7) " "
     (substring (current-time-string) 20 24) >
     "\n\n   Copyright (C) " (format-time-string "%Y") " " autoinsert-copyright "\n"
     "\n   -----------\n   DESCRIPTION\n   -----------\n\n"
     "*/\n"
     )

    ))

;
;			  ("\\.h$" . "header.h")
;			  ("\\.cpp$" . "header.cxx")
;			  ("\\.cxx$" . "header.cxx")
;			  ("\\.hpp$" . "header.cxx")
;			  ("\\.el$" . "header.el")
;			  ("[Mm]akefile" . "makefile")))

; -- New sort command to sort at a given column

(defun sort-at-column (column beg end)
  "Sort lines in region alphabetically where key starts at the given column
number.  The sort order is reversed if the column number is
negative. Called from a program, there are three arguments:
COLUMN (non-nil reads key at specified column), BEG and END (region to sort)."
  (interactive "p\nr")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ((reverse (< column 0)) (column (abs column)))
	(sort-subr reverse 'forward-line 'end-of-line
		   (function (lambda () (move-to-column column) nil))
		   )))))


; -- New Shell-command function

(defvar shell-command-default ""
  "Last shell command; default for next shell command")

(defun shell-command-ex (command)
  "Execute the program synchronously.
Runs COMMAND in a synchronous shell with output going to
*Shell Command Output*."
  (interactive
   (list (read-from-minibuffer "Shell Command: "
;			       (cons shell-command-default 1)
			       shell-command-default
			       nil nil )))
  (setq shell-command-default command)
  (shell-command command))

; Hook procedure for erasing the stupid .saves*~ files


(defun unlink-saves ()
   (save-excursion
     (let ((buffer (generate-new-buffer "*Unlink*"))
	   (home   (concat (getenv "HOME") "/")))
       (set-buffer buffer)
       (insert-directory (concat home ".saves*") "" t)
       (defun _parse (s) ""
	 (let ((org (point)))
	   (forward-line -1)
	   (if (= org (point)) s
	     (_parse
	      (if (/= (char-after (point)) 46) s ; Check for '.' as first char
		(cons (buffer-substring (point) (- org 1)) s))))))
       (defun _remove (s v) ""
	 (if (null s) v
	   (delete-file (concat home (car s)))
	   (_remove (cdr s) (+ v 1))
	   ))
       (_remove (_parse ()) 0)		;The zero parameter is vestigal
       (kill-buffer buffer))))
;(add-hook 'kill-emacs-hook 'unlink-saves) ;Call this every time we exit

;; Make Java indent correctly
;
;(defun my-java-mode-hook ()
;  ;; my customizations for all of c-mode and related modes
;  (setq c-basic-offset 2)
;  )
;(add-hook 'java-mode-hook 'my-java-mode-hook)

; -- New bindings

(global-set-key [f6] 'global-set-key)	;F6 to undo
(global-set-key [f7] 'man)		;F7 to read a man page
(global-set-key [f8] 'call-last-kbd-macro) ;F8 to execute kbd macro
(global-set-key [f9] 'undo)		;F9 to undo
(global-set-key [f12] 'command-apropos)	;F12 to get help from keyword
;(global-set-key "\C-x\C-m" 'shell)	;C-xC-m to execute inferior shell
(global-set-key "\C-xm" 'compile)	;C-xm to compile in current directory
(global-set-key "\C-xc" 'shell-command-ex) ;C-xc to push shell command
(global-set-key "\e\C-m" 'eval-last-sexp) ;M-ENTER to evaluate lisp expression
(global-set-key "\er" 'auto-fill-mode)	;M-r toggles line wrapping
(global-set-key "\e\t" 'indent-relative) ;M-TAB indents beneath previous line
(global-set-key "\C-X\\" 'recenter)     ;C-x\ recenters point in the window
(global-set-key "\C-L" 'recenter)       ;C-l recenters point in the window
;(global-set-key "\C-X\C-L" 'hilit-recenter) ;C-x\ recenters point in the window

;(load "w3-init")

; Fixup our mail address if we're on florence
;(if (and (boundp 'mail-host-address)
;	 (equal mail-host-address "netcom.netcom.com"))
;    (setq mail-host-address "netcom.com"))

; Move the scroll-bar
;(if (boundp 'custom-set-variables)
;    (custom-set-variables
;     '(scroll-bar-mode (quote right))))

(global-font-lock-mode t)
(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(auto-raise-tool-bar-buttons t t)
 '(auto-resize-tool-bars t t)
 '(scroll-bar-mode (quote right))
 '(tool-bar-button-margin 1 t)
 '(tool-bar-mode nil nil (tool-bar))
 '(tooltip-mode t nil (tooltip)))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(menu ((t (:height 1.0)))))

;; setup scroll mouse settings
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)
(whitespace-global-mode)

; Fix backspace in console windows.   It isn't clear why this is
; necessary and it would be nice if we could make this work all of the
; time without the hack.
(normal-erase-is-backspace-mode 0)
