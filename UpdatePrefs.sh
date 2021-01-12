#!/bin/sh

# Import preferences from prefs.cfg #
source $(pwd)/Prefs.cfg

clear

# Get old preferences #
newApiKey=$apiKey
newUnits=$units
newClearTerminal=$clearTerminal
newTimeFormat=$timeFormat
newSingleEvent=$singleEvent
newRefreshTime=$refreshTime
newInstallLocation=$installLocation

# Setup for new prefecences #
choice=00
while [ "$choice" != "0" ]
do
	echo "---UPDATING OPEN WEATHER CLI APP PREFERENCES---"
	echo "---Use numbers to navigate through the menus---"
	echo "1) Modify API key"
	echo "2) Modify units of measurements"
	echo "3) Choose wether to clear terminal or not"
	echo "4) Modify time format"
	echo "5) Choose wether to refresh or not data"
	echo "6) Modify the refresh timer"
	echo "7) Update install path"
	echo "0) Exit"
	read choice
	echo -e '\e[1A\e[K'
	case $choice in
		1)
			echo "Enter your Open Weather API key:"
			read newApiKey
			;;
		2)
			echo "Which units of measurements would you like to use (metric/imperial)?"
			read newUnits
			newUnits=$( echo $newUnits | tr [:upper:] [:lower:])
			while [ "$newUnits" != "metric" ] && [ "$newUnits" != "imperial" ]
			do
				echo "Only 'metric' and 'imperial' are valid options"
				echo "Which units of measurements would you like to use (metric/imperial)?"
				read newUnits
				newUnits=$( echo $newUnits | tr [:upper:] [:lower:])
			done
			;;
		3)
			echo "Would you like this app to clear the window before opening the app (y/n)?"
			read newClearTerminal
			newClearTerminal=$( echo $newClearTerminal | tr [:upper:] [:lower:])
			while [ "$newClearTerminal" != "y" ] && [ "$newClearTerminal" != "n" ]
			do
				echo "Only 'y' and 'n' are valid options"
				echo "Would you like this app to clear the window before opening the app (y/n)?"
				read newClearTerminal
				newClearTerminal=$( echo $newClearTerminal | tr [:upper:] [:lower:])
			done
			;;
		4)
			echo "Which time convention do you want to use: 12 hours of 24 hours (12/24)?"
			read newTimeFormat
			while [ "$newTimeFormat" != "12" ] && [ "$newTimeFormat" != "24" ]
			do
				echo "Only '12' and '24' are valid options"
				echo "Which time convention do you want to use: 12 hours or 24 hours (12/24)?"
				read newTimeFormat
			done
			;;
		5)
			echo "Do you want the data to be static (y/n)?"
			read newSingleEvent
			newSingleEvent=$( echo $newSingleEvent | tr [:upper:] [:lower:])
			while [ "$newSingleEvent" != "y" ] && [ "$newSingleEvent" != "n" ]
			do
				echo "Only 'y' and 'n' are valid options"
				echo "Do you want the data to be static (y/n)?"
				read newSingleEvent
				newSingleEvent=$( echo $newSingleEvent | tr [:upper:] [:lower:])
			done
			;;
		6)
			echo "Write here how often do you want the data to be refreshed, in seconds (min 3)"
			read newRefreshTime
			while [ "$newRefreshTime" < "3" ]
			do
				echo "Minimun amount of time must be 3 seconds or more"
				echo "Write here how often do you want the data to be refreshed, in seconds (min 3)"
				read newRefreshTime
			done
			;;
		7)
			newInstallLocation=$(pwd)
			echo "Install path updated"
			sleep 0.5
			;;
		0)
			;;
	esac
	clear
done

# Remove old Prefs.cfg and create a new updated one #
rm $(pwd)/Prefs.cfg
echo -e 'apiKey="'$newApiKey'"\nunits="'$newUnits'"\nclearTerminal="'$newClearTerminal'"\ntimeFormat="'$newTimeFormat'"\nsingleEvent="'$newSingleEvent'"\nrefreshTime="'$newRefreshTime'"\ninstallLocation="'$newInstallLocation'"' >> $(pwd)/Prefs.cfg
