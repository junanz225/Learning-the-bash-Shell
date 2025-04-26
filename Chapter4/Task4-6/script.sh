#!/bin/bash

#
#        Usage
#        ./script.sh
#
#        It will send a mail message to everyone who is currently logged in in the system.
#

mail "$(who | cut -f1 -d' ')"