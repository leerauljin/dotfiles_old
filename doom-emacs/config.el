;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file te plates and snippets.
(setq user-full-name "Seonjin Lee"
      user-mail-address "sjbase@me.com")

(when (eq system-type 'darwin)
  (osx-trash-setup))
(setq delete-by-moving-to-trash t)
;; Raise undo-limit to 80Mb
(setq undo-limit 80000000
      ;; More granular undo
      evil-want-fine-undo t
      auto-save-default t)

;; Show battery status
(unless (string-match-p "^Power N/A" (battery))
  (display-battery-mode 1))

;; Set font family and size
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 18 :style "Retina")
      ;; doom-big-font (font-spec :family "FiraCode Nerd Font Mono" :size 26 :style "Retina")
      doom-variable-pitch-font (font-spec :family "ETbb" :size 18 :slant 'normal :weight 'normal))

;; Enable bold and italic font
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

;; Set default theme
(setq doom-theme 'doom-plain)

(defun apply-system-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'doom-plain t))
    ('dark (load-theme 'doom-city-lights t))))

(add-hook 'ns-system-appearance-change-functions #'apply-system-theme)

;; "Adds a bar with the same color as the fringe as the header-line.Imitates the look of wordprocessors a bit."
(setq-default header-line-format
    (concat
        (propertize " " 'display (list 'space :width 'left-fringe) 'face 'fringe)
        (propertize " " 'display (list 'space :width 'left-margin) 'face (list (list :height 600) 'default))
        (propertize " " 'display (list 'space :width 'text) 'face (list (list :height 600) 'default))
        ;(propertize (format " %dW" (count-words (point-min) (point-max))) 'face 'default)
        (propertize " " 'display (list 'space :width 'left-margin) 'face (list (list :height 600) 'default))
;;(propertize (format " %dW" (count-words (point-min) (point-max))) 'face 'fringe)
;; '("" mode-line-misc-info)
        (propertize " " 'display (list 'space :width 'left-fringe) 'face 'fringe))) ;

(setq frame-resize-pixelwise t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Set splash image
(setq fancy-splash-image "~/.doom.d/misc/NASA_logo.png")

(global-hl-todo-mode 1)

;; (doom/set-frame-opacity 97)

;; Add different colors for VIM state
(setq evil-normal-state-cursor '(box "light blue")
      evil-insert-state-cursor '(bar "medium sea green")
      evil-visual-state-cursor '(hollow "orange"))

;;Modeline remove utf-8
(defun doom-modeline-conditional-buffer-encoding ()
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))
(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; Display time on mode-line
(display-time-mode 1)
(setq-default display-time-default-load-average nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count t)

;; Major modes in which to display word count continuously.
;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; remove the modes from `doom-modeline-continuous-word-count-modes'.
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

(setq-default display-time-default-load-average nil)

(add-hook! 'pdf-view-mode-hook 'hide-mode-line-mode)

(when window-system
  (setq initial-frame-alist
        '((top . 120)
          (left . 50)
          (width . 140)
          (height . 60))))

;; Exclude .venv from lsp watch
(after! lsp-mode
  (push "[/\\\\]\\.venv$" lsp-file-watch-ignored))

(setq mw-thesaurus--api-key "601c421e-3f91-4a69-b8f9-e941735eab55")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (setq org-directory "~/Documents/Org-mode/"))
(setq org-agenda-files '("~/Documents/Org-mode/"))

;; Automatically tangle our Emacs.org config file when we save it
(defun auto-org-babel-tangle ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/.doom.d/config.org"))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'auto-org-babel-tangle)))

;; Pretty Symbol    s
(defun org-icons ()
  "Beautify org mode keywords."
  (setq prettify-symbols-alist '(("[ ]" . "☐")
                                 ("[X]" . "☑")
                                 ("[-]" . "■")
                                 ("#+BEGIN_SRC" . "↦")
                                 ("#+END_SRC" . "⇤")
                                 ("#+begin_src" . "↦")
                                 ("#+end_src" . "⇤")
                                 ("#+BEGIN_EXAMPLE" . "↦")
                                 ("#+END_EXAMPLE" . "⇤")
                                 ("#+TITLE:" . "")
                                 ("#+title:" . "")
                                 ("->" . "→")
                                 ("<-" . "←")
                                 ("=>" . "⮕")
                                 ("#+BEGIN_QUOTE" . "↦")
                                 ("#+END_QUOTE" . "⇤")))
  (prettify-symbols-mode))

(add-hook 'org-mode-hook 'org-icons)

(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))

;; show actually italicized text instead of /italicized text/
(setq org-hide-emphasis-markers t
      org-ellipsis "  " ;; folding symbol
      ;; org-pretty-entities t
      org-startup-indented t
      org-agenda-block-separator "")

(after! git-gutter
  (setq git-gutter:disabled-modes '(org-mode image-mode)))

(defun nicer-org ()
  (progn
    (+org-pretty-mode 1)
    (org-pretty-table-mode 1)
    (abbrev-mode 1)
    (mixed-pitch-mode 1)
    (hl-line-mode -1)
    (display-line-numbers-mode -1)
    (hide-mode-line-mode 1)
    (olivetti-mode 1)
    (org-indent-mode -1)
    ))
(setq save-abbrevs t)
(setq save-abbrevs 'silently)
(setq only-global-abbrevs t)
(setq olivetti-body-width 0.85)
(add-hook! 'org-mode-hook  #'nicer-org)
(add-hook! 'org-mode-hook #'hl-todo-mode)
(remove-hook! 'org-mode-hook  'org-superstar-mode)
(remove-hook! 'org-mode-hook  'org-fancy-priorities-mode)
(remove-hook! 'org-mode-hook  'flycheck-mode)

(defun org-mode-remove-stars ()
  (font-lock-add-keywords
   nil
   '(("^\\*+ "
      (0
       (prog1 nil
         (put-text-property (match-beginning 0) (match-end 0)
                            'invisible t)))))))

(add-hook! 'org-mode-hook #'org-mode-remove-stars)

(add-hook! 'org-mode-hook (setq-local line-spacing 0.1))

(custom-set-faces!
  '(org-level-1
    :foreground (doom-color 'fg)
    :height 1.6
    :weight bold)
  '(org-level-2
    :foreground (doom-color 'fg)
    :height 1.3
    :weight bold
    :slant italic)
  '(org-level-3
    :foreground (doom-color 'fg)
    :height 1.2
    :weight bold)
  '(org-level-4
    :foreground (doom-color 'fg)
    :height 1.1
    :weight bold)
  '(org-ellipsis
    :foreground (doom-color 'grey)
    :background (doom-color 'bg)
    :weight normal
    :slant normal)
  '(org-block
    :background (doom-color 'fg-alt)
  '(org-block-begin-line
    :foreground (doom-color 'fg)
    :background (doom-color 'fg-alt)
    :slant italic)
  '(org-block-end-line
    :background (doom-color 'fg-alt)
    :slant italic)
  '(org-headline-done
    :strike-through nil)
  '(org-agenda-date
    :foreground (doom-color 'grey)
    :weight bold)
  '(org-agenda-date-today
    :foreground (doom-color 'blue)
    :weight bold
    :slant italic
    :height 1.2)
  '(org-agenda-date-weekend
    :foreground (doom-color 'red)
    :weight normal)
  '(org-document-title
    :foreground (doom-color 'fg)
    :weight bold
    :slant italic
    :height 1.9
    )))

;; (after! org
;;   (setq org-todo-keywords
;;         '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
;;           (sequence "IDEA(i)" "READ(r)" "DATA(c)" "ANAL(a)" "WRITE(w)" "PROOF(o)" "U/R(u)" "RETURN(j)" "|" "FIN(f)" "KILL(k)"))
;;         org-todo-keyword-faces
;;         '(("TODO"   . (doom-color 'red))
;;           ("NEXT"  . (doom-color 'orange))
;;           ("DONE"  . (doom-color 'green))
;;           ("IDEA"  . (doom-color 'magenta))
;;           ("READ"  . (doom-color 'yellow))
;;           ("DATA"  . (doom-color 'dark-cyan))
;;           ("ANAL"  . (doom-color 'red))
;;           ("WRITE"  . (doom-color 'blue))
;;           ("PROOF"  . (doom-color 'bright-blue))
;;           ("RETURN" . (doom-color 'red))
;;           ("U/R" . (doom-color 'dark-blue))
;;           ("FIN" . (doom-color 'green))
;;           ("KILL"   . (doom-color 'grey)))))

(setq hl-todo-keyword-faces
      '(("TODO"   . "#D95468")
        ("NEXT"  . "#D98E48")
        ("DONE"  . "#008B94")
        ("IDEA"  . "#E27E8D")
        ("READ"  . "#EBBF83")
        ("DATA"  . "#8BD49C")
        ("ANAL"  . "#33CED8")
        ("WRITE"  . "#5EC4FF")
        ("PROOF"  . "#539AFC")
        ("RETURN" . "#D95468")
        ("U/R" . "#718CA1")
        ("FIN" . "#008B94")
        ("KILL"   . "grey")))

(setq org-agenda-format-date (lambda (date) (concat "\n"
                                                    (make-string (window-width) 9472)
                                                    "\n"
                                                    (org-agenda-format-date-aligned date))))

(define-minor-mode scroll-center-cursor-mode
  "Toggle centred cursor scrolling behavior"
  :init-value nil
  :lighter " S="
  :global nil
  (if scroll-center-cursor-mode
      (setq-local scroll-margin (* (frame-height) 2)
                  scroll-conservatively 0
                  maximum-scroll-margin 0.5)
    (dolist (local '(scroll-preserve-screen-position
                     scroll-conservatively
                     maximum-scroll-margin
                     scroll-margin))
      (kill-local-variable `,local)))
  )

(load! "misc/auto-capitalize")
(setq auto-capitalize-words `("I" "English"))
(add-hook 'org-mode-hook 'auto-capitalize-mode)

(map! :map dired-mode-map
      :n "h" #'dired-up-directory
      :n "l" #'dired-view-file)
(map! :leader
      "o j" #'dired-jump
      "f n" #'dired-create-empty-file)
(after! dired
(setq dired-listing-switches "--group-directories-first -gaGh1v"))

(setq elfeed-goodies/entry-pane-size 0.5)
(setq elfeed-feeds (quote
                    (("https://rss.sciencedirect.com/publication/science/02615177" Journal TM)
                     ("https://rss.sciencedirect.com/publication/science/01607383" Journal ATR))))
(map! :leader
      "o s" #'elfeed)
(map! :map elfeed-show-mode-map
      :n "J" #'elfeed-goodies/split-show-next
      :n "K" #'elfeed-goodies/split-show-prev)

;; (map! :map emacs-everywhere-mode-map
;;       :leader
;;       :desc "Finish Everywhere"
;;       "m s" #'emacs-everywhere-finish
;;       :desc "Abort Everywhere"
;;       "f d" #'emacs-everywhere-abort)

(evilem-default-keybindings "SPC")

(setq evil-snipe-scope 'visible)

(map! :leader
      :desc "Org-mode indent"
      "t i" #'org-indent-mode)

(map! :leader
      :desc "Company autocompletion"
      "t c" #'company-mode)

(map! :leader
      :desc "Auto capitalize"
      "t C" #'auto-capitalize-mode)

(map! :leader
      :desc "Abbrev-mode"
      "t a" #'abbrev-mode)

(map! :leader
      :desc "Scroll center cursor"
      "t s" #'scroll-center-cursor-mode)

(map! :leader
      :desc "Git gutter visual"
      "t G" #'git-gutter-mode)

(map! :leader
      :desc "Mode-line"
      "t m" #'hide-mode-line-mode)

(map! :leader
      :desc "Magit push"
      "g p" #'magit-push)

(map! :leader
      :desc "Magit commit"
      "g C" #'magit-commit)

(map! :leader
      :desc "M&W Thesaurus at point"
      "s t" #'mw-thesaurus-lookup-at-point)
(map! :leader
      :desc "M&W Thesaurus"
      "s T" #'mw-thesaurus-lookup)

;; Highlight selected
(map! :leader
      :desc "Highlight selected"
      "m h" #'pdf-annot-add-highlight-markup-annotation)

;; Delete annotation
(map! :leader
      :desc "Delete annotation"
      "m h" #'pdf-annot-delete)

;; Revert
(map! :leader
      :desc "Revert PDF buffer"
      "m r" #'pdf-view-revert-buffer)

(map! :leader
      :desc "Add abbreviation for word"
      "m w" #'add-global-abbrev)
(map! :leader
      :desc "Add expansion for abbrev"
      "m W" #'inverse-add-global-abbrev)
