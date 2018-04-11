#!/bin/bash
#https://github.com/naffan2014/naffan2014.github.io/blob/master/publish-gh-pages.sh

function exe_cmd() {
    echo $1
    eval $1
}

if [ $# -lt 1 ]; then
    echo "Usage: sh $0 master"
    exit
fi

branch=$1
if [ -z "$branch" ]; then
    branch='master'
fi

exe_cmd "jekyll build --safe"
if [ ! -d '_site' ];then
    echo "not content to be published"
    exit
fi

exe_cmd "git branch -D $branch"
error_code=$?
if [ $error_code != 0 ]; then
    echo 'Delete branch $branch fail.'
    exit
fi

exe_cmd "git checkout -b $branch"
error_code=$?
if [ $error_code != 0 ];then
    echo 'Switch branch $branch fail.'
    exit
else
    exe_cmd "git add _site/"
    exe_cmd "git commit -m 'jekyll build'"
    exe_cmd "git filter-branch --subdirectory-filter _site/ -f"
    exe_cmd "git push --all --force origin"
    exe_cmd "rm -Rf _site/"
    exe_cmd "git checkout dev"
fi
