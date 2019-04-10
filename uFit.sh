#!/bin/bash

sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove && sudo apt-get autoremove --purge && sudo apt-get autoclean && sudo apt-get clean && sudo flatpak uninstall --unused && sudo snap set system refresh.retain=2 && xmessage "All done! Enjoy your Linux system! :D"
