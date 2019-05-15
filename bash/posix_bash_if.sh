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



## 有待整理 =================================================


branch_name_lowercase="feature-devope-2222"
branch_type_develop="develop"
branch_type_release="release"


echo "sh的posix是不允许[[的"
echo "可以在posix shell下执行成功的"
# https://stackoverflow.com/questions/2829613/how-do-you-tell-if-a-string-contains-another-string-in-posix-sh
# Shell grep must use variabe substitute
result1=$(echo "$branch_name_lowercase" | grep "$branch_type_release")
result2=$(echo $branch_name_lowercase | grep "$branch_type_release")
echo "result1: $result1"
echo "result2: $result2"

echo "This works"
if [ "$result1" != "" ] || [ "$result2" != "" ]; then
fi

echo "This also works https://stackoverflow.com/questions/3826425/how-to-represent-multiple-conditions-in-a-shell-if-statement "
if echo "$branch_name_lowercase" | grep -q "$branch_type_develop"
fi

# grep not 100% work
echo "This absolute work"
if echo "$branch_name_lowercase" | grep -q "$branch_type_release" || echo "$branch_name_lowercase" | grep -q "$branch_type_develop"
then
fi


echo "bash下面认可的if条件句"
if echo "$branch_name_lowercase" | grep -q "$branch_type_develop"
then
	echo "This is the develop branch, we will push the same image with 'latest' "
  	base_image_tag2='latest'
  	createImageAndPush $dockermcm5_image_name $script_absolute_working_dir $mcm5_base_work_dir_relative \
	$base_image_tag2 $script_docker_server $script_docker_user $script_docker_pwd
fi




echo "Fit for both bash and shell"
echo "Case 1"
result=$(echo $branch_name_lowercase | grep "develop")
echo $result
if [ "$result" != "" ]; then
	echo "Not equal"
fi

