git checkout -b ff
echo "fast-forward 를 위한 내용수정" >> task.txt
echo "이름을 이 아래에 적어주세요" >> task.txt
git add task.txt
git commit -m "feat(ff): fast-forward를 위한 내용 추가"
git checkout -b tw
echo "이름이 들어갈 자리~" >> task.txt
git add task.txt
git commit -m "feat(tw): 3-way merge를 위한 내용 추가"
git checkout week2/branch-and-merge

echo "과제 파일 작성 완료"