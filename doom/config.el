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
(setq doom-theme 'doom-vibrant)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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

(setq doom-font (font-spec :size 20 ))

;; MY KEYBINDS

(blink-cursor-mode 1)
(recentf-mode 1)
(setq display-line-numbers 'relative)

(map! :leader
      (:prefix ("j" . "Personal Keybinds")
               (:prefix ("t" . "Tabs")
                        :desc "Switch Tabs By Name"          "n" #'+vertico/switch-workspace-buffer
                        :desc "Kill Current Tab"             "k" #'message-kill-buffer
                        :desc "Save tab"                     "s" #'save-current-buffer
                )
               (:prefix ("f" . "Files")
                        :desc "Recent Files"                 "r" #'recentf-open-files
                )
               (:prefix ("e" . "Editor")
                        :desc "Toggle Terminal (vTerm)"      "v" #'+vterm/toggle
                        :desc "Toggle File Tree"             "t" #'+treemacs/toggle
                        :desc "Toggle Comment"               "c" #'evilnc-comment-or-uncomment-lines
                        :desc "Move line up"                 "u" #'move-text-up
                        :desc "Move line down"               "d" #'move-text-down

                        (:prefix ("g". "Goto")
                                 :desc "Goto Next"           "n" #'evil-jump-forward
                                 :desc "Goto Definition"     "d" #'evil-goto-definition
                                 :desc "Goto Previous"       "p" #'evil-jump-backward
                         )
                )
        )

      ;; TODO org mode, Shift code line up or down (M-S-up/down), save a buffer, multiple cursors,
)

(defun my/fullscreen-if-not ()
  "Toggle fullscreen only if Emacs is not already in fullscreen mode."
  (unless (frame-parameter nil 'fullscreen)
    (set-frame-parameter nil 'fullscreen 'full)))

(add-hook 'window-setup-hook 'my/fullscreen-if-not)
