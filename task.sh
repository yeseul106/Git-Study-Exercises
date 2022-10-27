#!/usr/bin/env bash

if [$(git branch -r | grep -w -c "study") -gt 0]
then
    git branch -D study/remote-main
    git branch -D study/local-main
fi
git checkout -b study/remote-main
echo "3주차 과제" > task.txt
git add task.txt
git commit -m "commit1"

echo "아래에 이름 입력해주세요~" >> task.txt
git add task.txt
git commit -m "commit2"

sed -i '2s/.*/잘못 수정된 내용이요.../g' task.txt
git add task.txt
git commit -m "commit3"

git push origin study/remote-main -f
git checkout -b study/local-main
git push origin study/local-main -f
