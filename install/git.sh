#!/bin/sh

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
