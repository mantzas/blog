@echo off
cd mantzas.github.io

echo pull changes from mantzas.github.io
git checkout master
git pull origin master
cd ..

echo generate blog with hugo
hugo -d mantzas.github.io
cd mantzas.github.io

echo add, commit and push to mantzas.github.io
git add .
git commit -m "%1"
git push origin master
cd ..

echo push blog to github
git remote add github https://github.com/mantzas/blog.git
git push github master