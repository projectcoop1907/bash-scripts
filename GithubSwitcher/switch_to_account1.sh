#!/bin/bash

# SSH key setup
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/aryan-michael

# Git config setup
git config --global user.name "aryan-michael"
git config --global user.email "aryanmichael24@gmail.com"

echo "Switched to GitHub Account 1"
