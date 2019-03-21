#!/bin/bash

path=$(pwd)

#git clone project_URL
#git log > ../logs.txt

while read links
do
echo""
echo "Start Cloning Porjects... $links"
git clone $links

#when you clone a project a folder of that project name is created
#so we have to get the last part of the URL

#git project folder name
#put the link in an array
#example: take the third part
#     0.      1.         2.        3.
#https://github.com/nathanmarz/storm
arr=(`echo $links | tr '/' ' ' `)
#arr[3] get the project folder name

#complete path
FolderName="${path}/ ${arr[3]}"

echo "Folder Name is : ${FolderName}"

cd $FolderName

#take a step back from the main project folder
#${arr[3]} in order the save in the same name
git log > ${arr[3]}_log.txt

#after each clone return to the main folder
#in order to start the other clone
#in the main file not inside the previous cloned file.

#remove file recursively just need txt file
rm -rf $FolderName

cd $path

done <Links.txt
