#!/bin/sh

#set -e

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

main() {
	# Run as unattended if stdin is closed
	if [ ! -t 0 ]; then
		RUNZSH=no
		CHSH=no
	fi

    echo "Installing geeksaga dotfiles."

    . ../install/link.sh

    . ../install/git.sh

    setup_color

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
