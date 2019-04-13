#!/usr/bin/env bash
## https://www.jfrog.com/confluence/display/RTF/Artifactory+REST+API#ArtifactoryRESTAPI-ItemLastModified

# $given_path=$1
given_path="Pipeline-something/category/project_name/branch_name"
echo "想把结果存到变量里面"
artifactory_url="http://some_url/artifactory"
last_modified_response_body=$(curl -X GET ${artifactory_url}/${given_path}?lastModified)
echo "直接把结果放在文件里（保持原有format"
curl -X GET ${artifactory_url}/artifactory/api/storage/${given_path}?lastModified > output.json

echo "Start parse"
cat output.json

echo "两种方式都可以得到有uri的那一行"
sed -E 's/\},\s*\{/\},\n\{/g' output.json | grep  "uri"
grep "uri" output.json



echo "得到有uri的那一行"
grep '^ *"uri" :' output.json
echo "得到以空格分割的第三个值，带着双引号 Grab the value within the quote marks wrapped it"
grep '^ *"uri" :' output.json | awk '{ print $3 }'

echo "去掉头尾的双引号 Get rid fo the quote marks"
grep '^ *"uri" :' output.json | awk '{ print $3 }' | sed -e 's/,$//' -e 's/^"//' -e 's/"$//'

echo "+++++++++++++++++++++++++++++++++++++++++++"
echo "Final usage"
echo "+++++++++++++++++++++++++++++++++++++++++++"
artifactory_url="Some_url"
getUri () { ## This example using JFrog API
    local loc_given_path=$1
    curl -v X GET ${artifactory_url}/api/storage/${loc_given_path}?lastModified > output1.json
    local loc_uri=$(grep '^ *"uri" :' output1.json | awk '{ print $3 }' | sed -e 's/,$//' -e 's/^"//' -e 's/"$//')
    echo $loc_uri
}

getDownloadUri () {
    local loc_uri=$1
    curl -v -X GET ${loc_uri} > output2.json
    local loc_downloaduri=$(grep '^ *"downloadUri" :' output2.json | awk '{ print $3 }' | sed -e 's/,$//' -e 's/^"//' -e 's/"$//')
    echo $loc_downloaduri
}

rm output1.json
return_value_getUri=$(getUri $loc_artifact_download_from)
cat output1.json
echo ""
rm output2.json
download_artifact_url=$(getDownloadUri ${return_value_getUri})
cat output2.json
echo ""