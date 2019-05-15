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
