#bin/bash

set -e

current_version="6.16.0"

tagging() {
  local loc_path=$1;
  local loc_folder=$2;
  local loc_version=$current_version;
  local loc_release_branch="release/${loc_version}";
  local loc_tag="v${loc_version}";

  echo "====================== Start Tagging $loc_folder ======================";
  echo "-- Download folder: $loc_folder";

  git clone "${loc_path}" "./${loc_folder}"
  cd "${loc_folder}"

  echo "-- Checking out branch to be tagged: $loc_release_branch":
  git checkout ${loc_release_branch}
  git pull origin ${loc_release_branch}

  echo "-- Tag: $loc_tag";
  git tag ${loc_tag}
  git push origin --tags
  cd ..
  echo "====================== Finish Tagging $loc_folder ======================";
}

backupTagDeletion() {
  git clone <my_git_ssh_or_https>.git <file_folder_better_be_repo_name>
  cd <file_folder>
  git checkout release/6.0.30
  git pull origin release/6.0.30
  git push --delete origin v6.0.30
}
