#!/bin/bash

# Taking user input
echo "Enter your name: "
read name

# Taking input from arguments
arg1=$1
arg2=$2

# Printing the variables
echo "Hello, $name!"
echo "This is first Argument: $arg1"
echo "This is second Argument: $arg2"
