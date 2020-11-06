#!/bin/bash

# So we can add and commit files
git config --global user.email "someone@example.com"
git config --global user.name "Your Name"

# Ensure ansible and ansible-base are not installed so we don't get
# conflicts when we pip install
apt-get -y remove ansible ansible-base
touch /tmp/background-finished

# Add ~/.local/bin to PATH so "pip install --user" works
echo "export PATH=\$PATH:~/.local/bin" >> ~/.bashrc
