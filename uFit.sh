#!/bin/bash

# Downloaded from https://github.com/koulaxizis/ufit ~ Absolutely no warranty provided. I'm not responsible in any way for any possible damage may occur on your system. Use it at your own responsibility. ;)

echo -e "\033[1muFit: Dead-simple script to clean up Ubuntu-based distros.\033[0m"
echo ".:: Downloaded from https://github.com/koulaxizis/ufit ::."
echo ""
echo "What it does...
 - Updates all DEB, SNAP and FLATPAK applications.
 - Fixes any missing dependencies or broken packages.
 - Removes dependencies that are no longer required.
 - Removes old kernels that are no longer required.
 - Removes all packages kept in the apt cache.
 - Removes all data kept in the thumbnail cache.
 - Removes all unused flatpak runtimes.
 - Removes old versions on installed snaps.
 - Removes trashed files older than 30 days."
echo ""
echo "$(tput setaf 1)$(tput setab 7)Warning:Absolutely no warranty provided. I'm not responsible in any way for any possible damage may occur on your system. Use it at your own responsibility. Do you want to continue? $(tput sgr 0)"
echo ""
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

sudo apt-get update --fix-missing && sudo apt-get install -f && sudo apt-get install trash-cli && trash-empty 30 && sudo apt-get upgrade -y && sudo snap refresh && sudo flatpak update -y && sudo apt-get autoremove --purge -y && sudo apt-get clean && sudo apt-get autoclean && rm -rf ~/.cache/thumbnails/* && sudo flatpak uninstall --unused -y && sudo snap set system refresh.retain=2 && xmessage "All done! Enjoy your Linux system! :D"
