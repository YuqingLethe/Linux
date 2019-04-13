#!/bin/sh

#################################################################################
### Posix compatible: http://mywiki.wooledge.org/Bashism
#################################################################################

# The best way to use if in posix is by echo|grep or test
longString="I love bash, do I"
shortString="ve b"
### Substring
if echo "$longString" | grep -q


### Full Comparison
if [ "$branch_is_feature_app" = "true" ] ; then
echo ">>>> Reset args for feature/app branch"
args="-Dsonar.verbose=false -Dsonar.login=$sonarqube_login -Dsonar.password=$sonarqube_password \
-Dsonar.host.url=$sonarqube_host_url -Dheadless=false --stacktrace -Daio=true ${shared_args} sonarqube"
fi

## IF AND 包含关系
if ! echo ${branch_name_lowercase} | grep "release" \
	&& [ ${branch_name_lowercase} != "feature-app" ] \
	&& [ ${branch_name_lowercase} != "develop" ]
then
	bld_num="${bld_num}-${branch_name_lowercase}"
	echo "Assign bld_num to new string with branch name: bld_num -->> $bld_num"
fi

################################################
### Check if directory exists
################################################
if [ ! -d $loc_target_folder ]; then
    echo "Create the new directory: $loc_target_folder"
    mkdir $loc_target_folder
fi
### Check if $dir exists or not
if [ ! -e "$dir" ] ; then
    echo "Error: cannot access directory: $dir" >&2
    exit 1
fi


################################
### Array
#################################
# https://stackoverflow.com/questions/6499486/how-to-mark-an-array-in-posix-sh

