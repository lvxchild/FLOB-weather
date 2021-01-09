#!/bin/sh

# Setup for preferences #
echo "---FLOB WEATHER CLI APP SETUP---"
echo "Enter your Open Weather API key:"
read apiKey

# Units loop #
echo "Which units of measurement would you like to use (metric/imperial)?"
read units
units=$( echo $units | tr [:upper:] [:lower:])
while [ "$units" != "metric" ] && [ "$units" != "imperial" ]
do
	echo "Only 'metric' and 'imperial' are valid options."
	echo "Which units of measurement would you like to use (metric/imperial)?"
	read units
	units=$( echo $units | tr [:upper:] [:lower:])
done

# Time format loop #
echo "Which time convention do you want to use: 12 hours or 24 hours (12/24)?"
read timeFormat
while [ "$timeFormat" != "12" ] && [ "$timeFormat" != "24" ]
do
	echo "Only '12' and '24' are valid options."
	echo "Which time convention do you want to use: 12 hours or 24 hours (12/24)?"
	read timeFormat
done

# Create other prefs, editables easily using ./UpdatePrefs.sh
clearTerminal="y"
singleEvent="n"
refreshTime="60"

# Create prefs.cfg and write on it #
touch $(pwd)/Prefs.cfg
echo -e 'apiKey="'$apiKey'"\nunits="'$units'"\nclearTerminal="'$clearTerminal'"\ntimeFormat="'$timeFormat'"\nsingleEvent="'$singleEvent'"\nrefreshTime="'$refreshTime'"' >> $(pwd)/Prefs.cfg

# Write PATH onto .bashrc, to be able to call FLOB weather commands everywhere #
echo -e '\n# Path to FLOB weather bash commands\nexport PATH=$PATH:'$(pwd) >> $HOME/.bashrc

echo "This is just the minimal installation, if you want to choose a few more details of this app, launch ./UpdatePrefs.sh after this installation finish."
