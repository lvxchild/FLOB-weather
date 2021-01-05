#!/bin/sh
#path="PATH=\$PATH:"$(pwd)
#echo -e '\n# Path to OpenWeather bash command\n'$path >> $HOME/.bashrc
echo -e '\n# Path to OpenWeather bash command\nPATH=$PATH:'$(pwd) >> $HOME/.bashrc
