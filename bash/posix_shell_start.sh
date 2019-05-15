#!/usr/bin/env bash

# From http://tldp.org/LDP/Bash-Beginners-Guide/html/

#Bash开头
#	• The first two characters of the first line should be #!,
#	• Then follows the path to the shell that should interpret the commands that follow.
#	• Don't start your script with an empty line，blank lines are also considered to be lines
#
#Bash Debug
#	• 用-x
#	• 在命令行下，不要在双引号号里面用!，这会让 Shell "误以为" 你要执行历史展开
#	• B - brace expansion
#	• $-的输出himBH的含义 http://kodango.com/explain-shell-default-options
