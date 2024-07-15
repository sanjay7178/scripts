#!/bin/bash

# ASCII art
cat <<'EOF'
                                       __               
  ____    ___    _ __   __    _____   /\ \__     ____   
 / ,__\  /'___\ /\` __\/\_\  /\ '__`\ \ \ ,_\   / ,__\  
/\__, `\/\ \__/ \ \ \/ \/\ \ \ \ \_\ \ \ \ \/  /\__, `\ 
\/\____/\ \____\ \ \_\  \ \ \ \ \ ,__/  \ \ \_ \/\____/ 
 \/___/  \/____/  \/_/   \/_/  \ \ \/    \ \__\ \/___/  
                                \/_/      \/__/         
EOF

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
            shell=$custom_shell
            ;;
        *) echo "Invalid choice"; exit 1;;
    esac
    echo "Chosen shell: $shell"
}

# Function to list and choose script
choose_script() {
    echo "Available scripts:"
    echo "1) homebrew.sh"
    echo "2) script2.sh"
    read -rp "Enter the number of the script to run: " script_choice

    case $script_choice in
        1) script="homebrew.sh";;
        2) script="script2.sh";;
        *) echo "Invalid choice"; exit 1;;
    esac
    echo "Chosen script: $script"
}

# Function to check root permission and run the script
check_root_permission() {
    read -rp "Does the script require root permissions? (y/n): " root_permission
    if [[ $root_permission == "y" || $root_permission == "Y" ]]; then
        curl -sSL "https://sanjay7178.github.io/scripts/scripts/$script" | sudo "$shell"
    else
        curl -sSL "https://sanjay7178.github.io/scripts/scripts/$script" | "$shell"
    fi
}

# Call the functions
choose_shell
choose_script
check_root_permission