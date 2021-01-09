#!/bin/sh

#
echo "---OPEN WEATHER UNINSTALLER---"
echo "You are removing Open Weather CLI, are you sure(y/n)?"
read isSure

# If user really want to delete: ask if user also want to delete the Open Weather CLI folder, create correct pwd formula for use with sed and finally remove PATH from /bashrc and folder # 
if [[ $isSure == "y" ]]
then
	echo "Would you like to also delete this folder and everything in it(y/n)?"
	read deleteFolders
	route="$(echo $(pwd) | sed 's/\//\\\//g')"
	sed -i '/Path to OpenWeather bash commands/d' $HOME/.bashrc
	sed -i '/export PATH=$PATH:'$route'/d' $HOME/.bashrc
	if [[ $deleteFolders == "y" ]]
	then
		rm -r $(pwd)
	fi
fi
