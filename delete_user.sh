#!/bin/bash

while true; do
    # Prompt user to enter the username to delete or type 'exit' to quit
    read -p "Enter username to delete (or type 'exit' to quit): " username

    # Check if the user wants to exit
    if [ "$username" == "exit" ]; then
        echo "Exiting..."
        break
    fi

    # Get the user's primary group
    primary_group=$(id -gn "$username")

    # Delete the user along with their home directory
    sudo userdel -r "$username"

    # Delete the user's primary group
    sudo groupdel "$primary_group"

    # Display a success message
    echo "User $username and their primary group $primary_group deleted successfully"
done

echo "Script terminated"
