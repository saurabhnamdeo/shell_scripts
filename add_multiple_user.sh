#!/bin/bash

while true; do
    # Prompt user to enter a username or type 'exit' to quit
    read -p "Enter username (or type 'exit' to quit): " username

    # Check if the user wants to exit
    if [ "$username" == "exit" ]; then
        echo "Exiting..."
        break
    fi

    # Set a default password for the user (you can change this as needed)
    defaultpassword="defaultpassword"

    # Create the user
    sudo useradd -m "$username"

    # Set the default password for the user
    echo "$username:$defaultpassword" | sudo chpasswd

    # Expire the password to force a password change on first login
    sudo chage -d 0 "$username"

    echo "User $username created successfully with default password: $defaultpassword"
done

echo "Script terminated"
