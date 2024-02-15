#!/usr/bin/env bash
set -e

sudo apt update && sudo apt upgrade -y

if ! [-x "$(command -v ansible)"]; then
	sudo apt install ansible
fi

ansible-playbook --ask-become-pass ~/.dotfiles/playbook.yaml

if command -v terminal-notifier 1>/dev/null 2>&1; then
	terminal-notifier -title "dotfiles: Bootstrap complete" -message
	"Successfully set up"
fi
