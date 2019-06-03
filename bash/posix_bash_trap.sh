#!/usr/bin/env bash

## How to run an on-fail scripts once the script failed. (Bamboo also throw failed build)
## https://stackoverflow.com/questions/64786/error-handling-in-bash

#!/bin/bash
set -e

unzip FailHere

## Only for Bash. Not quite sure if works
function error() {
    JOB="$0"              # job name
    LASTLINE="$1"         # line of error occurrence
    LASTERR="$2"          # error code
    echo "ERROR in ${JOB} : line ${LASTLINE} with exit code ${LASTERR}"
    exit 1
}
trap 'error ${LINENO} ${?}' ERR

## Posix Friendly. 100% works
cleanup () {
	set +e
	echo "CLEANUP scripts should not be stopped if anything not existed or failed"
	set -e

}

# Run only error occur
trap cleanup ERR

# Run everytime finished the scripts
trap cleanup EXIT


## Pass Multiple Arguments
docker_cleanup () {
    set +e
    local loc_image_name_1=$1;
    local loc_image_name_2=$2;
    echo ""
    echo ""
    echo ">>>>>>>> Starting the final cleanup scripts  >>>>>>>>>>>>>>>"
    echo ""
	echo "# !!! PLEASE IGNORE WARNINGS IF IMAGES NOT FOUND !!!"
    docker images -a |  grep "projectKeyWords" | grep "${loc_image_name_1}"
    docker images -a |  grep "projectKeyWords" | grep "${loc_image_name_1}" | awk '{print $3}' | xargs docker rmi -f
    docker images -a |  grep "projectKeyWords" | grep "${loc_image_name_2}"
    docker images -a |  grep "projectKeyWords" | grep "${loc_image_name_2}" | awk '{print $3}' | xargs docker rmi -f
    set -e
}
## ============== END: FUNCTION DEFINITIONS =================

trap 'docker_cleanup ${application_name_1} ${application_name_2}' ERR ## Call docker_cleanup whenever the script exits with or without failure
