#!/usr/bin/env bash

# Automatically install purchased apps from the Mac App Store

mas signout

read -r -t 60 -p "What is yout Apple ID?: " appleid
mas signin --dialog "$appleid"

# Mac App Store apps to install
apps=(
    "Pixelmator Pro:1289583905"
    "Napkin:581789185"
    "1Blocker:1107421413"
    "Pochade:1074208435"
    "Shapes:930093508"
    "Trello:1278508951"
    "Magnet:441258766"
    "Airmail 3:918858936"
    "Coca:1000808993"
    "Shush:496437906"
    "Agenda:1287445660"
    "Logoist 3:1247301872"
    "MindNode:1289197285"
    "Fantastical 2:975937182"
    "Bear:1091189122"
    "Tweetbot:1384080005"
    "Reeder:880001334"
    "Gifox:1082624744"
    "Tyme2:1063996724"
)

for app in "${apps[@]}"; do
    name=${app%%:*}
    id=${app#*:}

    echo -e "Attempting to install $name"
    mas install "$id"
done

