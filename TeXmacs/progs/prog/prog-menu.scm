
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : prog-menu.scm
;; DESCRIPTION : program menus and icons
;; COPYRIGHT   : (C) 2010  Joris van der Hoeven
;;
;; This software falls under the GNU general public license version 3 or later.
;; It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
;; in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(texmacs-module (prog prog-menu)
  (:use (generic format-edit)
	(generic insert-menu)))

(tm-menu (focus-code-icons t)
  (mini #t
    (inert ((eval (format-get-name (get-env "prog-language"))) (noop)))))

(tm-menu (standard-focus-icons t)
  (:require (in-code?))
  (dynamic (focus-code-icons t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The main Format menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind full-prog-format-menu
  (group "Font")
  (link prog-font-menu)
  (if (simple-menus?)
      (-> "Color" (link color-menu)))
  (if (detailed-menus?)
      ---
      (group "Text")
      (link textual-properties-menu))
  ---
  (group "Paragraph")
  (link paragraph-menu)
  ---
  (when (in-main-flow?)
    (group "Page")
    (link page-menu)))

(menu-bind compressed-prog-format-menu
  ("Font" (interactive open-font-selector))
  ("Paragraph" (open-paragraph-format))
  (when (in-main-flow?)
    ("Page" (open-page-format)))
  (when (inside? 'table)
    ("Cell" (open-cell-properties))
    ("Table" (open-table-properties)))
  ---
  (-> "Whitespace" (link space-menu))
  (-> "Indentation" (link indentation-menu))
  (-> "Break" (link break-menu))
  ---
  (-> "Color"
      (if (== (get-preference "experimental alpha") "on")
	  (-> "Opacity" (link opacity-menu))
	  ---)
      (link color-menu))
  (-> "Adjust" (link adjust-menu))
  (-> "Transform" (link linear-transform-menu))
  (-> "Specific" (link specific-menu))
  (-> "Special" (link format-special-menu))
  (-> "Font effects" (link text-font-effects-menu))
  (assuming (== (get-preference "bitmap effects") "on")
    (-> "Graphical effects" (link text-effects-menu))))

(menu-bind prog-format-menu
  (if (use-menus?)
      (link full-prog-format-menu))
  (if (use-popups?)
      (link compressed-prog-format-menu)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Icons for modifying text properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind prog-format-icons
  ((balloon (icon "tm_italic.xpm") "Write italic text")
   (make-with "prog-font-shape" "italic"))
  ((balloon (icon "tm_bold.xpm") "Write bold text")
   (make-with "prog-font-series" "bold"))
  ((balloon (icon "tm_sansserif.xpm") "Use a sans serif font")
   (make-with "prog-font-family" "ss"))
  (if (not (in-graphics?))
      (=> (balloon (icon "tm_color.xpm") "Select a foreground color")
	  (link color-menu))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Icons in prog mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bind prog-icons
  (link prog-format-icons)
  (link texmacs-insert-icons)
  (if (and (in-presentation?) (not (visible-icon-bar? 0)))
    /
    (link dynamic-icons)))

(menu-bind code-menu
  ("Algorithm" (make 'algorithm))
  ("Pseudo code" (make 'render-code))
  ---
  ("Indent" (make 'indent))
  (when (not (selection-active?))
    ("Tabbed" (make 'wide-tabbed)))
  ---
  (-> "Inline code"
      ("Verbatim" (make 'verbatim))
      ("C++" (make 'cpp))
      ("Scheme" (make 'scm))
      ("Shell" (make 'shell)))
  (-> "Block of code"
      ("Verbatim" (make 'verbatim-code))
      ("C++" (make 'cpp-code))
      ("Scheme" (make 'scm-code))
      ("Shell" (make 'shell-code)))
  ---
  (-> "Goldfish"
      (when (style-has? "goldfish-lang")
        ("Inline code" (make 'goldfish-lang))
        ("Block of code" (make 'goldfish-code)))
      (when (not (style-has? "goldfish-lang"))
        ("Activate" (add-style-package "goldfish"))))
  (-> "Scala"
      (when (style-has? "scala")
        ("Inline code" (make 'scala))
        ("Block of code" (make 'scala-code)))
      (when (not (style-has? "scala"))
        ("Activate" (add-style-package "scala"))))
  (-> "Python"
      (when (style-has? "python")
        ("Inline code" (make 'python))
        ("Block of code" (make 'python-code)))
      (when (not (style-has? "python"))
        ("Activate" (add-style-package "python")))))
