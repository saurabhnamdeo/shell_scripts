#!/bin/bash

# Take input for two numbers
echo "Enter the first number: "
read num1
echo "Enter the second number: "
read num2

# If-Else statement to compare the numbers
if [ $num1 -gt $num2 ]; then
    echo "$num1 is greater than $num2"
elif [ $num1 -lt $num2 ]; then
    echo "$num1 is less than $num2"
else
    echo "$num1 is equal to $num2"
fi
