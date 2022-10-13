#!/usr/bin/env bash

currentBranch=$(git rev-parse --abbrev-ref HEAD)
taskBranch=$1

validateTaskBranch() {
    if [ $(git branch -r | grep -w -c "${1}") -eq 0 ]
    then
        echo 아직 준비되지 않은 내용입니다.
        exit 1
    fi
}

initCurrentBranch() {
    if [ "$currentBranch" != "main" ]
    then
        echo "현재 main brnach에 있지 않습니다. main brnach 로 이동합니다."
        git checkout main
    fi
}

switchTaskBarnch() {
    initCurrentBranch
    validateTaskBranch $1
    echo "load -> $1"
    if [$(git branch | grep -w -c "${1}") -eq 0]
    then
        git branch $1
    fi
    git checkout $1
    git pull origin $1
    bash ./task.sh
}

case $taskBranch in
    "week2") switchTaskBarnch week2/branch-and-merge
    ;;
    "week3") switchTaskBarnch week3/reset-and-revert
    ;;
    "week4") switchTaskBarnch week3/reset-and-revert
    ;;
    "") echo "과제 주차를 입력해주세요. ex week2"
    ;;
    *) echo "$1 과제는 없습니다, 다시 확인해주세요" && echo "혹은 week(과제 주) 로 입력하셨는지 확인해주세요. ex) week2"
esac