@echo off
cd mantzas.github.io

echo pull changes from mantzas.github.io
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
git push github master