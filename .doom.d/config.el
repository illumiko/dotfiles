;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq
 doom-theme 'doom-oksolar-light
 doom-font (font-spec :family "Maple Mono NF" :size 20)
)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq evil-escape-key-sequence "jk"
      evil-escape-delay 0.1
)

(after! org
(setq org-directory "~/Documents/org/"
      org-journal-dir "~/Documents/org/journal/"
      org-agenda-files '("~/Documents/org/journal/" "~/Documents/org/semester/" "~/Documents/org/journal/weeks/")
      org-default-notes-file "~/org/inbox.org"
      org-clock-into-drawer t
      org-log-into-drawer t
      org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org"
      org-roam-directory "~/Documents/org/notes/zk/"
      org-capture-templates '(("t" "Task [inbox]" entry
                              (file+headline "~/Documents/org/inbox.org")
                              "* %?\n%U\n")
                              ("n" "Note" entry
                              (file "~/Documents/org/inbox.org")
                              "* %u %?\n"))
))

;; Function that tries to auto-expand YaSnippets
(after! yasnippet
  (defun my-yas-try-expanding-auto-snippets ()
    (when yas-minor-mode
      (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
        (yas-expand))))
  (add-hook 'post-command-hook #'my-yas-try-expanding-auto-snippets)
  (add-hook 'evil-insert-state-exit-hook #'yas-exit-all-snippets)
)

;; (defun my/open-weekly-file ()
;;   "Open or create the current week's org file."
;;   (interactive)
;;   (let* ((year (format-time-string "%Y"))
;;          (week (format-time-string "%V"))
;;          (filename (format "%s-W%s.org" year week))
;;          (dir (expand-file-name "journal/weeks/" org-directory))
;;          (filepath (expand-file-name filename dir)))
;;     (unless (file-directory-p dir)
;;       (make-directory dir t))
;;     (find-file filepath)
;;     (when (= (buffer-size) 0)
;;       (insert (format "#+TITLE: Week %s — %s\n\n" week year))
;;       (insert "* Goals & Intention\n\n")
;;       (insert "* Tasks\n\n")
;;       (insert "* Time Report\n")
;;       (insert "#+BEGIN: clocktable :scope file :maxlevel 3 :compact t\n")
;;       (insert "#+END:\n\n")
;;       (insert "* Week Review\n")
;;       (save-buffer))))
(defun my/open-weekly-file ()
  "Open or create the current week's org file."
  (interactive)
  (let* ((day-of-year (string-to-number (format-time-string "%j")))
         (week (floor (/ (- day-of-year 1) 7)))
         (week-str (format "%02d" week))
         (year (format-time-string "%Y"))
         (filename (format "%s-W%s.org" year week-str))
         (dir (expand-file-name "journal/weeks/" org-directory))
         (filepath (expand-file-name filename dir)))
    (unless (file-directory-p dir)
      (make-directory dir t))
    (find-file filepath)
    (when (= (buffer-size) 0)
      (insert (format "#+TITLE: Week %s — %s\n\n" week-str year))
      (insert "* Goals & Intention\n\n")
      (insert "* Tasks\n\n")
      (insert "* Time Report\n")
      (insert "#+BEGIN: clocktable :scope file :maxlevel 3 :compact t\n")
      (insert "#+END:\n\n")
      (insert "* Week Review\n")
      (save-buffer))))
(map! :leader
      :prefix ("n w" . "weekly")
      :desc "Open weekly file" "w" #'my/open-weekly-file)

(after! dired
  (map! :map dired-mode-map
        :n "h" #'dired-up-directory
        :n "l" #'dired-find-file
        :n "M-j" #'dired-next-line
        :n "M-k" #'dired-previous-line
  )
)

(map! :leader
      :desc "Open Dired" "e" #'find-file
      :desc "clears highlight" "h h" #'evil-ex-nohighlight
)
(map! "M-j" #'next-line
      "M-k" #'previous-line)



;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
