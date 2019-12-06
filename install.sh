#!/bin/sh

#set -e

# Default settings
DOTFILES=${DOTFILES:-~/.dotfiles}
REPO=${REPO:-geeksaga/dotfiles}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

error() {
	echo ${RED}"Error: $@"${RESET} >&2
}

setup_shell() {
    # only perform macOS-specific install
    if [ "$(uname)" = "Darwin" ]; then
        echo -e "\\n\\nRunning on macOS"

    #    source install/brew.sh
        
    #    source install/osx.sh
    fi

    echo -e "\\n\creating neovim directories"

    if ! command_exists zsh; then
       	echo "${YELLOW}zsh is not installed.${RESET} Please install zsh first."
		exit 1
    else
        case $SHELL in
            *"zsh"*)
                echo "zsh shell used by default"
            ;;
            *)
                echo "Configuring zsh as default shell"
                chsh -s "$(command -v zsh)"
            ;;
        esac
    fi
}

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

setup_dotfile() {
    umask g-w,o-w

	echo "${BLUE}Cloning GeekSaga dotfiles...${RESET}"

    command_exists git || {
		error "git is not installed"
		exit 1
	}

    git clone -c core.eol=lf -c core.autocrlf=false \
		-c fsck.zeroPaddedFilemode=ignore \
		-c fetch.fsck.zeroPaddedFilemode=ignore \
		-c receive.fsck.zeroPaddedFilemode=ignore \
		--depth=1 --branch "$BRANCH" "$REMOTE" "$DOTFILES" || {
		error "git clone of dotfiles repo failed"
		exit 1
	}

	echo
}

setup_link() {
    DOTFILES=$HOME/.dotfiles

    echo -e "\\nCreating symlinks"
    echo "=============================="
    linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
    for file in $linkables ; do
        target="$HOME/.$( basename "$file" '.symlink' )"
        if [ -e "$target" ]; then
            echo "~${target#$HOME} already exists... Skipping."
        else
            echo "Creating symlink for $file"
            ln -s "$file" "$target"
        fi
    done

    echo -e "\\n\\ninstalling to ~/.config"
    echo "=============================="
    if [ ! -d "$HOME/.config" ]; then
        echo "Creating ~/.config"
        mkdir -p "$HOME/.config"
    fi

    config_files=$( find "$DOTFILES/config" -depth 1 2>/dev/null )
    for config in $config_files; do
        target="$HOME/.config/$( basename "$config" )"
        if [ -e "$target" ]; then
            echo "~${target#$HOME} already exists... Skipping."
        else
            echo "Creating symlink for $config"
            ln -s "$config" "$target"
        fi
    done

    # create neovim symlinks(use neovim)
    echo -e "\\n\\nCreating neovim symlinks"
    echo "=============================="
    KEY=$HOME/.config/nvim
    VALUE=$DOTFILES/config/nvim

    if [ -e "${KEY}" ]; then
        echo "${KEY} already exists... skipping."
    else
        echo "Creating symlink for $KEY"
        ln -s "${VALUE}" "${KEY}"
    fi
}

setup_git() {
    printf "Setting up Git...\\n\\n"

    defaultName=$( git config --global user.name )
    defaultEmail=$( git config --global user.email )
    defaultGithub=$( git config --global github.user )

    read -rp "Name [$defaultName] " name
    read -rp "Email [$defaultEmail] " email
    read -rp "Github username [$defaultGithub] " github

    git config --global user.name "${name:-$defaultName}"
    git config --global user.email "${email:-$defaultEmail}"
    git config --global github.user "${github:-$defaultGithub}"

    #shopt -s nocasematch

    if [ "$( uname )" = "Darwin" ]; then
        git config --global credential.helper "osxkeychain"
    else
        read -rp "Save user and password to an unencrypted file to avoid writing? [y/N] (default N): " save
        save=${save:-N}
        if [ $save = "y" ] || [ $save = "Y" ]; then
            git config --global credential.helper "store"
        else
            git config --global credential.helper "cache --timeout 3600"
        fi
    fi
}

main() {
	# Run as unattended if stdin is closed
	if [ ! -t 0 ]; then
		RUNZSH=no
		CHSH=no
	fi

    setup_color

    echo "Installing geeksaga dotfiles."

    setup_dotfile

    setup_link

    setup_git

    setup_shell

    printf "$GREEN"
	cat <<-'EOF'
           _____           _     _____                   
          / ____|         | |   / ____|                  
         | |  __  ___  ___| | _| (___   __ _  __ _  __ _ 
         | | |_ |/ _ \/ _ \ |/ /\___ \ / _` |/ _` |/ _` |
         | |__| |  __/  __/   < ____) | (_| | (_| | (_| |
          \_____|\___|\___|_|\_\_____/ \__,_|\__, |\__,_|
                                              __/ |      
                                             |___/        ....is now installed!

	EOF
	printf "$RESET"

    echo "Done. Reload your terminal."
}

main "$@"