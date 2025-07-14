# -----------------------------------------------------------------------------
# File: selectd.sh
#
# Description:
#   A Bash function that allows the user to select a directory from a
#   predefined array-based directory stack (DIR_STACK). The selected
#   directory is moved to the front of the stack and becomes the current
#   working directory (via `cd`).
#
# Usage:
#   1. Define the directory stack as a Bash array:
#        DIR_STACK=( "/path/one" "/path/two" "/path/three" )
#
#   2. Source this script (if saved in a file), or paste the function into
#      your current shell session:
#        source selectd.sh
#
#   3. Run:
#        selectd
#
#   4. You'll see a numbered list of directories. Select one by number, and
#      you'll be moved into that directory. DIR_STACK will be reordered to
#      reflect the change.
#
# Notes:
# - Requires Bash.
# - The directory stack is stored in the Bash array variable DIR_STACK.
# - Only valid selections (by index) are accepted. Invalid selections are handled.
# -----------------------------------------------------------------------------


selectd () {
    PS3='directory? '
    select selection in "${DIR_STACK[@]}"; do
        if [ -n "$selection" ]; then
            # Rebuild DIR_STACK with the selected directory at the front
            new_stack=( "$selection" )
            for dir in "${DIR_STACK[@]}"; do
                if [[ "$dir" != "$selection" ]]; then
                    new_stack+=( "$dir" )
                fi
            done
            DIR_STACK=("${new_stack[@]}")
            cd "$selection"
            break
        else
            echo "Invalid selection."
        fi
    done
}