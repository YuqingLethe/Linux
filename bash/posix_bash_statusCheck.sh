#!/usr/bin/env bash

###############################################################################################
### At the beginning of the file, print out the file name and the arguments needed
###############################################################################################
#
# Copyright XX Group (c) 2033
#

script_name=$(basename $0)

if [ $# != 4 ] ; then
    echo "Error: invalid arguments: $@" >&2
    echo "Usage: $script_name" >&2
    echo "Usage: $script_name <build-number> <build-key> <build-timestamp> <whether-branch-is-feature-app>" >&2
    exit 1
fi

###############################################################################################
### Check command status
###############################################################################################


###############################################################################################
### Source another file
### e.g.
### version=2.1
### artifact=myApp
###############################################################################################
config_file_name="config.var"
. "${config_file_name}" # Source the variables in another file

