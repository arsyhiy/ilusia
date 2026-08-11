(set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 150)

(set-face-attribute 'mode-line nil :height 85 :inherit 'fixed-pitch)

(mirage-module 'ef-themes)
(load-theme 'ef-cyprus t)

(mirage-layer 'modeline-doom)

(mirage-module 'evil)
(evil-mode 1)
