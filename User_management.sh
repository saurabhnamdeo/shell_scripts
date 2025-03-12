#!/bin/bash

check_user_exists() {
  if id "$1" &>/dev/null; then
    return 0
  else
    return 1
  fi
}

create_user() {
  read -p "Enter username: " username
  if check_user_exists "$username"; then
    echo "User $username already exists."
  else
    sudo useradd "$username"
    echo "User $username created."
    read -p "Do you want to add the user to specific groups? (y/n): " choice
    if [ "$choice" == "y" ]; then
      read -p "Enter groups (comma-separated): " groups
      IFS=',' read -ra ADDR <<< "$groups"
      for group in "${ADDR[@]}"; do
        sudo usermod -aG "$group" "$username"
      done
      echo "User $username added to groups: $groups."
    fi
  fi
}

delete_user() {
  read -p "Enter username to delete: " username
  if check_user_exists "$username"; then
    read -p "Are you sure you want to delete the user $username? (y/n): " choice
    if [ "$choice" == "y" ]; then
      sudo userdel "$username"
      echo "User $username deleted."
    else
      echo "Deletion aborted."
    fi
  else
    echo "User $username does not exist."
  fi
}

list_users() {
  awk -F':' '{ print $1}' /etc/passwd
}

lock_user() {
  read -p "Enter username to lock: " username
  if check_user_exists "$username"; then
    sudo usermod -L "$username"
    echo "User $username has been locked."
  else
    echo "User $username does not exist."
  fi
}

unlock_user() {
  read -p "Enter username to unlock: " username
  if check_user_exists "$username"; then
    sudo usermod -U "$username"
    echo "User $username has been unlocked."
  else
    echo "User $username does not exist."
  fi
}

show_menu() {
  echo "1. Create User"
  echo "2. Delete User"
  echo "3. List Users"
  echo "4. Lock User"
  echo "5. Unlock User"
  echo "6. Exit"
}

while true; do
  show_menu
  read -p "Choose an option: " option
  case $option in
    1) create_user ;;
    2) delete_user ;;
    3) list_users ;;
    4) lock_user ;;
    5) unlock_user ;;
    6) echo "Exiting script."; exit ;;
    *) echo "Invalid option. Please try again." ;;
  esac
done
