#!/usr/bin/env bash

###############################################################################################
### Source key-value pairs config file in bash
###############################################################################################
source ${config_file_name}

###############################################################################################
### Source another config file in posix shell
### e.g.
### version=2.1
### artifact=myApp
###############################################################################################
config_file_name="config.var"
. "${config_file_name}" # Source the variables in another file

