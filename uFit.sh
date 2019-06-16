#!/bin/bash

# Downloaded from https://github.com/koulaxizis/ufit/ ~ Absolutely no warranty provided. I'm not responsible in any way for any possible damage may occur on your system. Use it at your own responsibility. ;)

echo -e "\033[1muFit: Dead-simple script to clean up Ubuntu-based distros.\033[0m"
echo ""
echo "$(tput setaf 1)$(tput setab 7)Warning:Absolutely no warranty provided. I'm not responsible in any way for any possible damage may occur on your system. Use it at your own responsibility. Do you want to continue? $(tput sgr 0)"
echo ""
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

sudo apt-get update && sudo apt-get install trash-cli && trash-empty 30 && sudo apt-get upgrade && sudo snap refresh && sudo flatpak update && sudo apt-get autoremove --purge && sudo apt-get autoclean && sudo apt-get clean && rm -rf ~/.cache/thumbnails/* && sudo flatpak uninstall --unused && sudo snap set system refresh.retain=2 && xmessage "All done! Enjoy your Linux system! :D"
