#!/bin/bash

#
#        This function helps to filter files' name in the current directory, with the specified modified date
#
#        Usage
#        Step 1: source script.sh
#        Step 2: lsd "Jan 26"
#        Here in step 2, Jan 26 is the argument which could be any date.
#

function lsd {
  local date=$1
  ls -l | grep -i "$date " | cut -c50-
}