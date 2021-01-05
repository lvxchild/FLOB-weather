#!/bin/sh

# Setup for preferences
echo "--OPEN WEATHER CLI APP SETUP--"
echo "Enter your Open Weather API key:"
read apiKey
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

# Create prefs.cfg and write on it
touch $(pwd)/Prefs.cfg
echo -e 'apiKey="'$apiKey'"\nunits="'$units'"' >> $(pwd)/Prefs.cfg

# Write PATH onto .bashrc, to be able to call OpenWeather commands everywhere
echo -e '\n# Path to OpenWeather bash command\nexport PATH=$PATH:'$(pwd) >> $HOME/.bashrc
