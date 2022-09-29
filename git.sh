#!/bin/bash
#action=$1
#set -x
function create_branch () {
    branch=$1
    git rev-parse --verify "$branch"
    if [[ $? -eq 0 ]]; then
     echo "$branch"  already exits. Please try with other name.
    else
    git branch "$branch"
    fi
}

function merge_branch () {
    merge_branch=$1
    git rev-parse --verify "$merge_branch"
    if [[ $? -eq 0 ]]; then
        git checkout main
        git merge "$merge_branch"
    else 
    echo "$merge_branch"  not exist. Please check your branch name.
    fi
}

function rebase_branch () {
    rebase_branch=$1
    git rev-parse --verify "$rebase_branch";
    if [[ $? -eq 0 ]]; then
        git checkout main
        git rebase "$rebase_branch"
    else 
    echo "$rebase_branch"  not exist. Please check your branch name.
    fi
}

function delete_name () {
     dlt_branch=$1
    git rev-parse --verify "$dlt_branch";
    if [[ $? -eq 0 ]]; then
    git branch -d "$dlt_branch"
    else
    echo "$dlt_branch" does not exist. Please check youtr branch name.
    fi
}


function push_branch () {
    push_branch=$1
    git rev-parse --verify "$push_branch";
    if [[ $? -eq 0 ]]; then
    git push origin "$push_branch"
    else
    echo "Branch is not exist.Please check your branch name"
    fi
}

action=$1
branch=$2

case $action in
        create)
            branch_name=$branch
            create_branch "$branch_name"
        ;;
        list)
            git branch
        ;;
        merge)
            merge_branch_name=$branch
            merge_branch "$merge_branch_name"
        ;;
        rebase)
            rebase_branch_name=$branch
            rebase_branch "$rebase_branch_name"
        ;;
        delete)
            dlt_branch_name=$branch
            delete_name "$dlt_branch_name"
        ;;
        push)
            push=$branch
            push_branch "$push"
        ;;
        esac
