#!/bin/sh
#path="PATH=\$PATH:"$(pwd)
#echo -e '\n# Path to OpenWeather bash command\n'$path >> $HOME/.bashrc
echo -e '\n# Path to OpenWeather bash command\nexport PATH=$PATH:'$(pwd) >> $HOME/.bashrc
