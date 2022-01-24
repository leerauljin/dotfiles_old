;;; doom-city-lights-theme.el --- inspired by Atom City Lights -*- lexical-binding: t; no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-city-lights-theme nil
  "Options for the `doom-city-lights' theme."
  :group 'doom-themes)

(defcustom doom-city-lights-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-city-lights-theme
  :type 'boolean)

(defcustom doom-city-lights-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-city-lights-theme
  :type 'boolean)

(defcustom doom-city-lights-comment-bg doom-city-lights-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-city-lights-theme
  :type 'boolean)

(defcustom doom-city-lights-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-city-lights-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-city-lights-day
  "A dark theme inspired by Atom City Lights"

  ;; name        default   256       16
  ((bg         '("#ffffff"))
   (bg-alt     (doom-darken bg 0.03))
   (base0      '("#969896"))
   (base1      '("#f1f3f5"))
   (base2      '("#444444"))
   (base3      '("#cccccc"))
   (base4      '("#e7e7e7"))
   (base5      '("#c5c8c6"))
   (base6      '("#fafafa"))
   (base7      '("#dfdfdf"))
   (base8      '("#fafafa"))
   (fg         '("#1D252C"))
   (fg-alt     (doom-lighten fg 0.15))

   (grey       base4)
   (red         '("#D95468" "#ff6655" "red"          ))
   (orange      '("#D98E48" "#dd8844" "brightred"    ))
   (green       '("#8BD49C" "#99bb66" "green"        ))
   (teal        '("#33CED8" "#33CCDD" "brightgreen"  ))
   (yellow      '("#EBBF83" "#EEBB88" "yellow"       ))
   (blue        '("#5EC4FF" "#55CCFF" "brightblue"   ))
   (bright-blue '("#539AFC" "#5599FF" "blue"         ))
   (dark-blue   '("#718CA1" "#7788AA" "blue"         ))
   (magenta     '("#E27E8D" "#EE7788" "magenta"      ))
   (violet      '("#B62D65" "#BB2266" "brightmagenta"))
   (cyan        '("#70E1E8" "#77EEEE" "brightcyan"   ))
   (dark-cyan   '("#008B94" "#008899" "cyan"   ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.5))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-city-lights-brighter-comments dark-cyan grey))
   (doc-comments   (doom-lighten (if doom-city-lights-brighter-comments dark-cyan grey) 0.25))
   (constants      magenta)
   (functions      teal)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        bright-blue)
   (variables      dark-blue)
   (numbers        magenta)
   (region         base3)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-city-lights-brighter-modeline)
   (-modeline-pad
    (when doom-city-lights-padded-modeline
      (if (integerp doom-city-lights-padded-modeline) doom-city-lights-padded-modeline 4)))

   (modeline-bg              (doom-darken bg-alt 0.03))
   (modeline-bg-alt          (doom-darken bg-alt 0.01))
   (modeline-bg-inactive     (doom-lighten bg-alt 0.1))
   (modeline-bg-inactive-alt bg-alt)
   (modeline-fg              fg)
   (modeline-fg-alt          (doom-darken modeline-bg-inactive 0.35)))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-city-lights-comment-bg (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   ;;;; company
   (company-tooltip-selection     :background base3)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; magit
   (magit-diff-hunk-heading-highlight :foreground fg :background base4 :weight 'bold)
   (magit-diff-hunk-heading :foreground fg-alt :background base3 :weight 'normal)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-url-face    :foreground teal :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground green)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground (doom-darken blue 0.2))
   ((outline-5 &override) :foreground (doom-darken green 0.2))
   ((outline-6 &override) :foreground (doom-darken teal 0.2))
   ((outline-7 &override) :foreground (doom-darken blue 0.4))
   ((outline-8 &override) :foreground (doom-darken green 0.4))
   ;;;; org <built-in>
   ((org-block &override) :background base2)
   ((org-block-begin-line &override) :background base2)
   (org-hide :foreground hidden)
   ;;;; ivy
   (ivy-minibuffer-match-face-2 :foreground blue :weight 'bold)
   ;;;; js2-mode
   (js2-object-property :foreground dark-blue)
   (js2-object-property-access :foreground dark-cyan)
   ;;;; rjsx-mode
   (rjsx-tag :foreground dark-cyan)
   (rjsx-attr :foreground cyan :slant 'italic :weight 'medium)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :backgroundkk
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive))))

  ;;;; Base theme variable overrides-
  ()
  )

;;; doom-city-lights-theme.el ends here
