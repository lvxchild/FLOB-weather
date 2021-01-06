#!/bin/sh

# Create correct pwd formula for use with sed #
route=$(pwd) 
route="$(echo $route | sed 's/\//\\\//g')"

# Remove PATH from .bashrc #
sed -i '/Path to OpenWeather bash commands/d' $HOME/.bashrc
sed -i '/export PATH=$PATH:'$route'/d' $HOME/.bashrc
