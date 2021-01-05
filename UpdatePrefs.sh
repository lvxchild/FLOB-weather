#!/bin/sh

# Import preferences from prefs.cfg
source $(pwd)/Prefs.cfg

#Setup for new preferences
echo "---UPDATING OPEN WEATHER CLI APP PREFERENCES---"
echo "Do you want to modify your Open Weather API key(y/n)?"
read changeKey
changeKey=$( echo $changeKey | tr [:upper:] [:lower:])
while [ "$changeKey" != "y" ] && [ "$changeKey" != "n" ]
do
	echo "Only 'y' and 'n' are valid options."
	echo "Do you want to modify you Open Weather API key(y/n)?"
	read changeKey
	changeKey=$( echo $changeKey | tr [:upper:] [:lower:])
done
if [[ "$changeKey" == "y" ]]
then
	echo "Enter your Open Weather API Key:"
	read newApiKey
elif [[ "$changeKey" == "n" ]]
then
	newApiKey=$apiKey
fi
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

# Remove old prefs.cfg and create a new one
rm $(pwd)/Prefs.cfg
echo -e 'apiKey="'$newApiKey'"\nunits="'$units'"' >> $(pwd)/Prefs.cfg
