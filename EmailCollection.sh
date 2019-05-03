#!/bin/bash

path=$(pwd)
#double check if the devemail file is deleted

rm -rf DeveloperEmails.txt
#git clone project_URL
#git log > ../logs.txt

while read gitlinks
do
#echo ""
echo "Start Cloning Porjects... ${gitlinks}"
git clone ${gitlinks}

#when you clone a project a folder of that project name is created
#so we have to get the last part of the URL

#git project folder name
#put the link in an array
#example: take the third part
#     0.      1.         2.        3.
#https://github.com/nathanmarz/storm
arr=(`echo ${gitlinks}| tr '/' ' ' `)
#arr[3] get the project folder name

#complete path
appPath="${path}/${arr[3]}"
#echo " Path is : ${appPath%????}"

echo "App path ${appPath}"

#//////////////////////////////////////////
cd ${appPath%????}

#take a step back from the main project folder
#${arr[3]} in order the save in the same name
git log > ../${arr[3]}_log.txt

#after each clone return to the main folder
#in order to start the other clone
#in the main file not inside the previous cloned file.

#remove file recursively just need txt file

rm -rf ${appPath%????}

#/////////////////////////////////////////
cd $path

while read line
do
    if [[ "${line}" = "Author: "*  ]]; then
	#for not re-printing the same email
        if [[ $(grep "${line}"  "DeveloperEmails.txt" ) ]]; then
            echo " Already Saved... "
        else
            echo ${line} >>DeveloperEmails.txt
            echo " Saving..."
        fi
    fi

done < ${arr[3]}_log.txt

#remove file log and keep emails file

rm -rf ${arr[3]}_log.txt

done < Links.txt