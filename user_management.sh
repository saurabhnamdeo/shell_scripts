#!/bin/bash

# Function to check if the script is run as root.
create_root() {
    if [[ $EUID -ne 0 ]]; then  # Check if the effective user ID is not zero (i.e., not root).
        echo "This script must be run as root"  # Print a message indicating the script must be run as root.
        exit 1  # Exit the script with status 1 (error).
    fi
}

# Function to create a user and check if the user exists.
check_user () {
    read -p "Enter username to create: " username  # Prompt the user to enter a username
    if id "$username" &>/dev/null; then  # Check if the username already exists. (The &>/dev/null operator redirects both standard output (stdout) and standard error (stderr) to /dev/null, effectively discarding all output and errors.)
        echo "User '$username' already exists."  # Print a message indicating the user already exists.
        return  # Return from the function.
    fi
    read -s -p "Enter password for $username: " password  # Prompt the user to enter a password.
    echo  # Print a newline.
    useradd -m -s /bin/bash "$username"  # Create a new user with a home directory and default shell set to /bin/bash.
    echo "$username:$password" | chpasswd  # Set the password for the new user.
    echo "User '$username' created successfully."  # Print a message indicating the user was created successfully.

    read -p "Add user to a group? (y/n): " add_group  # Prompt the user to confirm if they want to add the new user to a group.
    if [[ "$add_group" == "y" ]]; then  # Check if the user chose "y".
        read -p "Enter group name: " groupname  # Prompt the user to enter a group name.
        if grep -q "^$groupname"  /etc/group; then  # Check if the group exists in the /etc/group file.
            usermod -aG "$groupname" "$username"  # Add the new user to the specified group.
            echo "User '$username' added to group '$groupname'."  # Print a message indicating the user was added to the group.
        else
            echo "Group '$groupname' does not exist."  # Print a message indicating the group does not exist.
        fi
    fi
}

# Function to delete a user.
delete_user() {
    read -p "Enter username to delete: " username  # Prompt the user to enter the username to delete.
    if ! id "$username" &>/dev/null; then  # Check if the username does not exist.
        echo "User '$username' does not exist."  # Print a message indicating the user does not exist.
        return  # Return from the function.
    fi
    read -p "Do you want to delete user $username? (y/n): " confirm  # Prompt the user to confirm deletion.
    if [[ "$confirm" == "y" ]]; then  # Check if the user chose "y".
        userdel -r "$username"  # Delete the user and remove their home directory.
        echo "User '$username' deleted successfully."  # Print a message indicating the user was deleted successfully.
    else
        echo "User deletion aborted."  # Print a message indicating the deletion was aborted.
    fi
}

# Function to list all users.
list_users() {
    echo "Listing all system users:"  # Print a message indicating that the list of users will be displayed.
    awk -F':' '{print $1}' /etc/passwd  # Use awk to print the first field (username) from the /etc/passwd file.
}

# Function to lock a user.
lock_user() {
    read -p "Enter username to lock: " username  # Prompt the user to enter the username to lock.
    if id "$username" &>/dev/null; then  # Check if the username exists.
        passwd -l "$username"  # Lock the user account.
        echo "User '$username' has been locked."  # Print a message indicating the user was locked.
    else
        echo "User '$username' does not exist."  # Print a message indicating the user does not exist.
    fi
}

# Function to unlock a user.
unlock_user() {
    read -p "Enter username to unlock: " username  # Prompt the user to enter the username to unlock.
    if id "$username" &>/dev/null; then  # Check if the username exists.
        passwd -u "$username"  # Unlock the user account.
        echo "User '$username' has been unlocked."  # Print a message indicating the user was unlocked.
    else
        echo "User '$username' does not exist."  # Print a message indicating the user does not exist.
    fi
}

# Function to display the menu.
show_menu() {
    echo "----------------------------"  # Print a separator line.
    echo "    Linux User Management"  # Print the menu title.
    echo "----------------------------"  # Print a separator line.
    echo "1. Create a new user"  # Print menu option 1.
    echo "2. Delete an existing user"  # Print menu option 2.
    echo "3. List all users"  # Print menu option 3.
    echo "4. Lock a user"  # Print menu option 4.
    echo "5. Unlock a user"  # Print menu option 5.
    echo "6. Exit"  # Print menu option 6.
    read -p "Choose an option [1-6]: " option  # Prompt the user to choose an option.
}

# Main script execution.
create_root  # Call the function to check if the script is run as root.

while true; do  # Start an infinite loop.
    show_menu  # Display the menu.
    case $option in  # Evaluate the user's choice.
        1) check_user ;;  # Call the function to create a new user.
        2) delete_user ;;  # Call the function to delete an existing user.
        3) list_users ;;  # Call the function to list all users.
        4) lock_user ;;  # Call the function to lock a user.
        5) unlock_user ;;  # Call the function to unlock a user.
        6) echo "Script execution completed."; exit ;;  # Exit the script.
        *) echo "Invalid option. Please choose a valid option." ;;  # Print a message for invalid options.
    esac
done  # End of the infinite loop.
