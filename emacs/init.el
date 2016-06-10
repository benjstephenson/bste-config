
(require 'cl)
(require 'package)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
  evil company composable rainbow-delimiters rainbow-blocks scala-mode sbt-mode linum-relative jbeans-theme
))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'composable)
(require 'evil)
(require 'ido)
(require 'rainbow-blocks)
(require 'linum-relative)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(composable-mode) ;composable command keys - hurray!
(evil-mode 1)     ;enable vi emulation
(global-linum-mode 1)
(ido-mode t)
(show-paren-mode 1)
(hl-line-mode 1) ;highlihgt current cursor line
(tool-bar-mode -1) ;hide the tool bar
(load-theme 'jbeans t)

(load-theme 'solarized-dark t)
(use-package ensime
  :commands ensime ensime-mode)

(add-hook 'scala-mode-hook 'ensime-mode)

(setq exec-path (append exec-path '("/usr/local/bin")))
