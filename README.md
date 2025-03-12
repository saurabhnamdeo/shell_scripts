Shebang: The first line of a shell script typically specifies the interpreter to use. This is called a "shebang" and it looks like this:

bash
#!/bin/bash
Comments: Use # to add comments in your script. Comments are ignored by the interpreter and are used to explain what the script does.

bash
# This is a comment
Variables: You can store values in variables and use them later in your script.

bash
name="Saurabh"
echo "Hello, $name"
Control Structures:

If-Else Statements:

bash
if [ condition ]; then
    # code to execute if condition is true
else
    # code to execute if condition is false
fi
Loops:

bash
# For loop
for i in 1 2 3 4 5; do
    echo "Number $i"
done

# While loop
count=1
while [ $count -le 5 ]; do
    echo "Count is $count"
    count=$((count + 1))
done
Functions: Define reusable blocks of code.

bash
greet() {
    echo "Hello, $1"
}

greet "Saurabh"
File Permissions: Make your script executable using chmod command.

bash
chmod +x script_name.sh
Running the Script: Execute your script using:

bash
./script_name.sh
With these basics, you can start writing your own shell scripts to automate repetitive tasks, manage files, and much more!


 Sure! Here are some important shell scripting commands explained in detail with examples:

1. **Shebang (`#!/bin/bash`)**:
   - Specifies the interpreter to use for the script.
   ```bash
   #!/bin/bash
   ```

2. **Comments (`#`)**:
   - Used to add explanations or notes in the script.
   ```bash
   # This is a comment
   ```

3. **Echo (`echo`)**:
   - Prints text to the terminal.
   ```bash
   echo "Hello, Saurabh"
   ```

4. **Variables**:
   - Store values to use later in the script.
   ```bash
   name="Saurabh"
   echo "Hello, $name"
   ```

5. **If-Else Statements**:
   - Execute code based on conditions.
   ```bash
   if [ $name == "Saurabh" ]; then
       echo "Hello, Saurabh!"
   else
       echo "Hello, stranger!"
   fi
   ```

6. **For Loop**:
   - Iterates over a list of values.
   ```bash
   for i in 1 2 3 4 5; do
       echo "Number $i"
   done
   ```

7. **While Loop**:
   - Repeats code while a condition is true.
   ```bash
   count=1
   while [ $count -le 5 ]; do
       echo "Count is $count"
       count=$((count + 1))
   done
   ```

8. **Functions**:
   - Define reusable blocks of code.
   ```bash
   greet() {
       echo "Hello, $1"
   }
   greet "Saurabh"
   ```

9. **Chmod (`chmod`)**:
   - Change file permissions.
   ```bash
   chmod +x script.sh
   ```

10. **Read**:
    - Accept input from the user.
    ```bash
    echo "Enter your name:"
    read name
    echo "Hello, $name"
    ```

11. **Arrays**:
    - Store multiple values in a single variable.
    ```bash
    fruits=("apple" "banana" "cherry")
    echo "${fruits[@]}"
    ```

12. **Case Statement**:
    - Multi-way branch based on the value of a variable.
    ```bash
    case $name in
        Saurabh)
            echo "Hello, Saurabh!"
            ;;
        *)
            echo "Hello, stranger!"
            ;;
    esac
    ```

13. **Exit (`exit`)**:
    - Exit the script with a status code.
    ```bash
    if [ "$name" == "" ]; then
        echo "No name provided"
        exit 1
    fi
    ```

14. **Set Command**:
    - Modify the shell environment settings.
    ```bash
    set -e  # Exit immediately if a command exits with a non-zero status
    set -u  # Treat unset variables as an error
    ```

15. **Trap**:
    - Execute commands when the script receives signals.
    ```bash
    trap 'echo "Exiting..."; exit' INT TERM
    ```

16. **Test Command**:
    - Evaluate expressions and conditions.
    ```bash
    if test $count -eq 5; then
        echo "Count is 5"
    fi
    ```

17. **Pipes (`|`)**:
    - Pass the output of one command as input to another.
    ```bash
    ls | grep "script"
    ```

18. **Redirection (`>`, `>>`, `<`)**:
    - Redirect input and output.
    ```bash
    echo "Hello, Saurabh" > output.txt
    cat < input.txt
    ```

19. **Background Processes (`&`)**:
    - Run commands in the background.
    ```bash
    ./long_running_task.sh &
    ```

20. **Cron Jobs**:
    - Schedule scripts to run at specific times.
    ```bash
    # Edit cron jobs
    crontab -e
    # Example entry to run script every day at 3 AM
    0 3 * * * /path/to/script.sh
    ```
