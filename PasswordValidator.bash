#!/bin/bash

# Function to check password strength
check_password_strength() {
    local password=$1

    if [[ ${#password} -ge 8 && "$password" == *['!'@#\$%^\&*()_+]* ]]; then
        echo -e "\e[32mPassword is strong.\e[0m"
        return 0
    else
        echo -e "\e[31mPassword is weak. It must be at least 8 characters long and contain at least one special character.\e[0m"
        return 1
    fi
}

# Main script
while true; do
    echo "Enter your password:"
    read -s password

    if check_password_strength "$password"; then
        break
    else
        echo "Do you want to retry? (y/n)"
        read answer
        if [[ $answer != "y" ]]; then
            echo "Exiting program."
            break
        fi
    fi
done
