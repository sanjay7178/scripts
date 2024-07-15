#!/bin/bash

# Check if an argument is provided
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <shell>"
    echo "  <shell>: Specify 'bash' or 'zsh'"
    exit 1
fi

# Validate the shell choice
shell_choice="$1"
case "$shell_choice" in
    bash|zsh)
        ;;
    *)
        echo "Invalid shell choice. Please specify 'bash' or 'zsh'."
        exit 1
        ;;
esac

# Run Homebrew installation script based on the chosen shell
/bin/"$shell_choice" -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
