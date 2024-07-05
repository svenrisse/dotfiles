# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## confirm: helper to prevent accidental cmds
.PHONY: confirm
confirm:
	@echo -n 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

# ==================================================================================== #
# Goodies
# ==================================================================================== #

## stow: stow the dir with --adopt flag
.PHONY: stow 
stow: confirm
	@stow --adopt .

## install: install all packages for new install
.PHONY: install  
install: confirm
	@sudo pacman -S neovim dunst kitty picom polybar rofi tmux ttf-jetbrains-mono-nerd discord pacman-contrib
