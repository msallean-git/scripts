#!/bin/sh
branch=$1
directory=$2
script=$3
script_args="${*:4}"

set -e
runtime=`date +%Y%m%d_%H%M%S`
if [ -d scripts ]; then cd scripts && git fetch -q origin && git checkout $branch && git pull origin $branch; else git clone -q -b $branch https://github.com/msallean-git/scripts.git scripts && cd scripts && git checkout -q $branch; fi
sloc="$directory/$script"
if [ ! -f $sloc ]; then echo "Cannot find script at $sloc" && exit 1; fi
script_cmd="ruby $sloc"
echo "Running: $script_cmd $script_args"
$script_cmd $script_args