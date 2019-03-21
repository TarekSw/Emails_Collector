#!/bin/bash

path=$(pwd)

#git clone
#git log > ../logs.txt

while read links
do
	echo "Start Cloning Porjects... $links"
	git clone $links

# when you clone a project a folder of that project name is created
# so we have to get the last part of the URL

	#git project folder name
	# put the link in an array
	arr = (`echo $links | tr '/' ' ' `)
	#arr[3] get the project folder name
	#complete path
	FolderName = "${path}/ ${arr[3]}"
	
	echo "Folder Name is : ${FolderName}" 

	cd $FolderName

	#take a step back from the main project folder
	#${arr[3]} in order the save in the same name
	git log >> ../${arr[3]}_Information.txt
done < Links.txt
