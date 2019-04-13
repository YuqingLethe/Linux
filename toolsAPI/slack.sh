#!/bin/sh
echo "Starting the curl"

bamboo_url="SomeUrl"
first_half_key="jkjlkj"
second_half_key="jklkj"

curl -d 'payload={"username":"Octopus-Deployment-Notifications",\
"icon_emoji":":zoidberg:","channel":"#ci-refactor",\
"attachments":[{"fallback":"${bamboo_url}",\
"text":"<http://deploy.somecompany.com/app#/projects/mcm4 started>",\
"fields":[{"title":"Build","value":"yokiBuildNumber","short":true}],"color":"#fff400"}]}' \
https://hooks.slack.com/services/${first_half_key}/${second_half_key}

echo "Finished the curl"


#[string]$buildNumber="yoki-testing";
#[string]$body_json="";
#
#Invoke-WebRequest `
#-ContentType "application/json" `
#-Method Post`
#-Uri "https://hooks.slack.com/services/<some_key>" `
#-Body ${body_json}



