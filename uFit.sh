#!/bin/bash

# Downloaded from https://github.com/koulaxizis/ufit ~ Absolutely no warranty provided. I'm not responsible in any way for any possible damage may occur on your system. Use it at your own responsibility. ;)

echo -e "\033[1muFit: Dead-simple script to clean up Ubuntu-based distros.\033[0m"
echo ".:: Downloaded from https://github.com/koulaxizis/ufit ::."
echo ""
echo "What it does...
 - Updates all DEB, SNAP and FLATPAK applications.
 - Fixes any missing dependencies or broken packages.
 - Shrinks systemd's journal to a maximum of 100 MB.
 - Uses preload to speed up application load time.
 - Removes dependencies that are no longer required.
 - Removes orphaned packages and orphaned libraries.
 - Removes old kernels that are no longer required.
 - Removes all packages kept in the apt cache.
 - Removes all data kept in the thumbnail cache.
 - Removes all unused flatpak runtimes.
 - Removes old versions on installed snaps [*].
 - Removes trashed files older than 30 days.
 - Removes extra localization of installled packages."
echo ""
echo "[*] If snapd isn't installed, the script will end unexpectedly. However, commands about Snap are at the very end, so all of the rest commands will have been executed successfully. Not sure (yet) how to fix that. Feel free to help if you know how. Alternatively, edit the script with your favorite text editor and remove 'sudo snap refresh' & 'sudo snap set system refresh.retain=2', save and run it!"
echo ""
echo "$(tput setaf 1)$(tput setab 7)Warning:Absolutely no warranty provided. I'm not responsible in any way for any possible damage may occur on your system. Use it at your own responsibility. Do you want to continue? $(tput sgr 0)"
echo ""
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

sudo apt update --fix-missing
sudo apt install -f
sudo apt install trash-cli
trash-empty 30
sudo apt install localepurge
sudo apt install deborphan
deborphan --guess-all
sudo deborphan --guess-data | xargs sudo aptitude -y purge
sudo deborphan | xargs sudo apt-get -y remove --purge
sudo journalctl --vacuum-size=100M
sudo apt install preload
sudo apt upgrade -y
sudo flatpak update -y
sudo apt autoremove --purge -y
sudo apt clean
sudo apt autoclean
rm -rf ~/.cache/thumbnails/*
sudo flatpak uninstall --unused -y
sudo snap refresh
sudo snap set system refresh.retain=2
xmessage "All done! Enjoy your (awesome) Linux system! :D"
