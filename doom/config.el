;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Josh Glover"
      user-mail-address "jmglov@jmglov.net")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; (setq doom-font (font-spec :family "Fira Code" :size 13))
;; (setq doom-big-font-increment 4)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq doom-leader-key "M-m"
      doom-leader-alt-key "M-m")

(setq lsp-enable-symbol-highlighting nil
      indicate-buffer-boundaries 'left
      direnv-always-show-summary nil
      ;; nice scrolling
      scroll-margin 3
      ispell-dictionary "en_GB"
      require-final-newline nil)

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(setq frame-title-format
      '(buffer-file-name "Emacs %* %f"
        (dired-directory dired-directory "Emacs")))

;; (set-formatter! 'erlfmt  "erlfmt -" :modes '(erlang-mode))
;; (setq-hook! 'erlang-mode-hook +format-with-lsp nil)

(setq which-key-idle-delay 0.5)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c M-S") 'sp-raise-sexp)
(global-set-key (kbd "C-c j") 'join-line)

(sp-use-paredit-bindings)
(define-key smartparens-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)

;; (define-key clojure-refactor-map (kbd "s r") 'cljr-rename-symbol)

;; (add-hook 'git-commit-setup-hook
;;           (lambda ()
;;             (let ((ISSUEKEY "[[:upper:]]+-[[:digit:]]+")
;;                   (tag-suffix "/")
;;                   (branch (magit-get-current-branch)))
;;               (when (string-match-p ISSUEKEY branch)
;;                 (let ((commit-prefix (replace-regexp-in-string
;;                                       (concat ".*?\\(" ISSUEKEY "\\).*")
;;                                       (concat "\\1" tag-suffix)
;;                                       branch)))
;;                   (when (not (string-prefix-p commit-prefix (buffer-string)))
;;                     (insert commit-prefix)))))))

(add-hook 'markdown-mode-hook 'auto-fill-mode)
(add-hook 'nix-mode-hook 'format-all-mode)
(add-hook 'python-mode-hook 'blacken-mode)
(add-to-list 'auto-mode-alist '("\\.json.j2\\'" . js2-mode))

(setq blacken-line-length 100
      cider-repl-history-file "~/.cider-repl-history"
      css-indent-offset 2
      ;; erlang-indent-level 4
      flycheck-flake8-maximum-line-length 100
      groovy-indent-offset 2
      js2-basic-offset 2
      js-indent-level 2
      js2-strict-missing-semi-warning nil
      python-indent-offset 4
      sh-basic-offset 2
      sh-indentation 2
      web-mode-attr-indent-offset 2
      web-mode-attr-value-indent-offset 2
      web-mode-code-indent-offset 2
      web-mode-css-indent-offset 2
      web-mode-markup-indent-offset 2)

;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (map! :leader
;;       :desc "M-x" "e" #'execute-extended-command
;;       :desc "Kill buffer" "k" #'kill-current-buffer
;;       :desc "Format buffer" "\\" #'+format/buffer)

(map! :leader
      "/" #'+default/search-project
      "*" #'+default/search-project-for-symbol-at-point)

(map! :leader
      "g s" #'magit-status)

(map! :leader
      "p!" #'projectile-run-shell-command-in-root
      "p&" #'projectile-run-async-shell-command-in-root
      "p%" #'projectile-replace-regexp
      "pa" #'projectile-toggle-between-implementation-and-test
      "pb" #'projectile-switch-to-buffer
      "pc" #'projectile-compile-project
      "pd" #'projectile-find-dir
      "pD" #'projectile-dired
      "pe" #'projectile-edit-dir-locals
      "pf" #'projectile-find-file
      "pF" #'projectile-find-file-dwim
      "pg" #'projectile-find-tag
      "pG" #'projectile-regenerate-tags
      "pI" #'projectile-invalidate-cache
      "pk" #'projectile-kill-buffers
      "pp" #'projectile-switch-project
      "pr" #'projectile-recentf
      "pR" #'projectile-replace
      :desc "Treemacs project sidebar" "pt" #'+treemacs/toggle
      "pT" #'projectile-test-project
      "pv" #'projectile-vc)

(map! :leader
      "w TAB" #'other-window
      "w <left>" #'windmove-left
      "w <right>" #'windmove-right
      "w <up>" #'windmove-up
      "w <down>" #'windmove-down
      "w =" #'balance-windows
      "wr" #'ace-swap-window)

(after! cider
  (require 'cider-util)
  (require 'cider-resolve)
  (require 'cider-client)
  (require 'cider-common)
  (require 'cider-find)
  (require 'clojure-mode)
  ;; For evaluating inside comments with C-c C-c
  (setq clojure-toplevel-inside-comment-form t)
  ;; https://github.com/oliyh/re-jump.el/blob/master/re-jump.el
  (defun re-frame-jump-to-reg ()
    (interactive)
    (let* ((kw (cider-symbol-at-point 'look-back))
           (ns-qualifier (and
                          (string-match "^:+\\(.+\\)/.+$" kw)
                          (match-string 1 kw)))
           (kw-ns (if ns-qualifier
                      (cider-resolve-alias (cider-current-ns) ns-qualifier)
                    (cider-current-ns)))
           (kw-to-find (concat "::" (replace-regexp-in-string "^:+\\(.+/\\)?" "" kw))))
      (when (and ns-qualifier (string= kw-ns (cider-current-ns)))
        (error "Could not resolve alias \"%s\" in %s" ns-qualifier (cider-current-ns)))
      (progn (cider-find-ns "-" kw-ns)
             (search-forward-regexp (concat "reg-[a-zA-Z-]*[ \\\n]+" kw-to-find) nil 'noerror))))
  (map! :map cider-mode-map
        :n "gz" #'cider-switch-to-repl-buffer
        :n "gS" #'re-frame-jump-to-reg)
  (map! :map cider-repl-mode-map
        :n "gz" #'cider-switch-to-last-clojure-buffer))

(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (set-company-backend!
    '(text-mode
      markdown-mode
      gfm-mode)
    '(:seperate
      company-ispell
      company-files
      company-yasnippet)))

;; (after! erlang
;;   (require 'erlang-eunit)
;;   (defun erlang-more-electric-comma (&optional arg)
;;     (interactive "P")
;;     (if (save-excursion
;;           (beginning-of-line)
;;           (looking-at-p "[[:space:]]*$"))
;;         (progn
;;           (self-insert-command (prefix-numeric-value arg))
;;           (insert " ")
;;           (indent-according-to-mode))
;;       (erlang-electric-comma arg)))
;;   (setq erlang-indent-level 2)
;;   (map! :map erlang-mode-map
;;         :i "RET" #'newline-and-indent
;;         :i "," #'erlang-more-electric-comma))

;; Not yet using Home Manager
;; (map! :map nix-mode-map
;;       :n ",h" #'dlesl/home-manager-switch)

(use-package unfill
  :commands (unfill-region unfill-paragraph toggle-unfill))

(map! :g "M-Q" #'unfill-paragraph)

(when (featurep! :completion ivy)
  (setq ivy-use-selectable-prompt t))

;; (map! :map special-mode-map
;;       :n "q" #'quit-window)

(defun copy-region-unfilled ()
  "Unfill the region or the whole buffer and unfill it."
  (interactive)
  (let* ((regionp (region-active-p))
         (beg (and regionp (region-beginning)))
         (end (and regionp (region-end)))
         (buf (current-buffer)))
    (with-temp-buffer
      (insert-buffer-substring buf beg end)
      (unfill-region (point-min) (point-max))
      (kill-new (buffer-string)))))

(setq recentf-max-saved-items 2000)

;; (setq aws-username "your-username-here")

;; (setq aws-roles '((your-role-name-here . ("your-account-number-here" "iam-sync/cbpf/cbpf.IdP_admin"))))

;; (defun aws-login ()
;;   (interactive)
;;   (cl-destructuring-bind
;;       (acc role) (alist-get (intern (completing-read "Choose a role" aws-roles)) aws-roles)
;;     (let ((output (shell-command-to-string
;;                    (format "aws-login-tool login -u %s -a %s -r %s" aws-username acc role))))
;;       (dolist (line (split-string output "\n"))
;;         (when (equal 0 (string-match "export \\(AWS_PROFILE\\)=\\(.+\\)" line))
;;           (setenv (match-string 1 line) (match-string 2 line)))))))

(setq +pretty-code-enabled-modes '())

;; (toggle-frame-maximized)
