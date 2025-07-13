#!/bin/bash

# -----------------------------------------------------------------------------
# File: cd_replace.sh
#
# Description:
#   A Bash function that mimics the Korn shell's 'cd old new' behavior.
#   It replaces the first occurrence of 'old' in the current working directory
#   path with 'new' and attempts to change to the resulting path.
#
# Usage:
#   Source this script into your shell session:
#     source cd_replace.sh
#
#   Then use the function as follows:
#     cd old new
#     → Attempts to replace 'old' with 'new' in $PWD and cd into the result.
#
# Examples:
#   If your current directory is:
#     /Users/junanzhao/projects/learning-bash
#
#   Running:
#     cd projects archives
#
#   Will take you to:
#     /Users/junanzhao/archives/learning-bash
#
# Notes:
# - If no match is found for 'old', an error message is printed.
# - If called with 0 or 1 arguments, it behaves like the normal 'cd'.
# - Must be sourced; running as a script will not affect your shell.
#
# -----------------------------------------------------------------------------

cd( ) {
         case "$#" in
             0 | 1)  builtin cd $1 ;;
             2    ) newdir=${PWD//$1/$2}
                     case "$newdir" in
                         $PWD)   echo "bash: cd: bad substitution" >&2 ;
                             return 1 ;;
                         *   )   builtin cd "$newdir"  && pwd ;;
                     esac ;;
             *    )  echo "bash: cd: wrong arg count" 1>&2 ; return 1 ;;
         esac
}
