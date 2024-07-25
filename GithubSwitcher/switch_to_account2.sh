#!/bin/bash

# SSH key setup
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/projectcoop1907

# Git config setup
git config --global user.name "projectcoop1907"
git config --global user.email "projectcoop1907@gmail.com"

echo "Switched to GitHub Account 2"
