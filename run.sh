#!/bin/bash

# ASCII art

echo "                                       __               "
echo "  ____    ___    _ __   __    _____   /\ \__     ____   "
echo " / ,__\  /'___\ /\` __\/\_\  /\ '__`\ \ \ ,_\   / ,__\  "
echo "/\__, `\/\ \__/ \ \ \/ \/\ \ \ \ \_\ \ \ \ \/  /\__, `\ "
echo "\/\____/\ \____\ \ \_\  \ \ \ \ \ ,__/  \ \ \_ \/\____/ "
echo " \/___/  \/____/  \/_/   \/_/  \ \ \/    \ \__\ \/___/  "
ehco "                                \/_/      \/__/         "
echo "A Curl/Wget scripts for automating my entire setup workflow for deb/rpm systems"
echo "sanjay7178 : sanjay7178.github.io "

# Function to list and choose shell
choose_shell() {
    echo "Choose a shell:"
    echo "1) zsh"
    echo "2) bash"
    echo "3) other"
    read -rp "Enter the number of your choice: " shell_choice

    case $shell_choice in
        1) shell="zsh";;
        2) shell="bash";;
        3) 
            read -rp "Enter the name of the shell: " custom_shell
            shell="$custom_shell"
            ;;
        *) 
            echo "Invalid choice, defaulting to bash."
            shell="bash"
            ;;
    esac

    echo "Chosen shell: $shell"
}

# Function to list and choose script
choose_script() {
    echo "Available scripts:"
    # You can customize the scripts listed here
    echo "1) script1.sh"
    echo "2) script2.sh"
    read -rp "Enter the number of the script to run: " script_choice

    case $script_choice in
        1) script="script1.sh";;
        2) script="script2.sh";;
        *) 
            echo "Invalid choice, defaulting to script1.sh."
            script="script1.sh"
            ;;
    esac

    echo "Chosen script: $script"
}

# Function to check if the script requires root permissions
check_root_permission() {
    read -rp "Does the script require root permissions? (y/n): " root_permission
    if [[ $root_permission == "y" || $root_permission == "Y" ]]; then
        sudo "$shell" "$script"
    else
        "$shell" "$script"
    fi
}

# Main script execution
choose_shell
choose_script
check_root_permission
