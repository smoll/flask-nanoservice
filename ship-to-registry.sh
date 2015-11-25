#!/bin/bash

set -e

namespace="smoll"
current_dir="${PWD##*/}"
image_name="$namespace/$current_dir"

branch_name=$(git symbolic-ref -q HEAD)
branch_name=${branch_name##refs/heads/}
branch_name=${branch_name:-HEAD}

docker build --tag=${image_name}:${branch_name} .
docker push ${image_name}
