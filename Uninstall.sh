#!/bin/sh

#
echo "---FLOB WEATHER CLI APP UNINSTALLER---"
echo "You are removing FLOB weather, are you sure(y/n)?"
read isSure

# If user really want to delete: ask if user also want to delete the FLOB weather folder, create correct pwd formula for use with sed and finally remove PATH from /bashrc and folder # 
if [[ $isSure == "y" ]]
then
	echo "Would you like to also delete this folder and everything in it(y/n)?"
	read deleteFolders
	route="$(echo $(pwd) | sed 's/\//\\\//g')"
	sed -i '/Path to FLOB weather bash commands/d' $HOME/.bashrc
	sed -i '/export PATH=$PATH:'$route'/d' $HOME/.bashrc
	if [[ $deleteFolders == "y" ]]
	then
		rm -r $(pwd)
	fi
fi
