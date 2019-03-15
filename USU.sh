#!/bin/bash

sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y autoremove && sudo apt-get -y autoremove --purge && sudo apt-get -y autoclean && sudo apt-get -y clean && sudo flatpak uninstall --unused && echo "=> All done! Enjoy your Linux system! :) <3"
