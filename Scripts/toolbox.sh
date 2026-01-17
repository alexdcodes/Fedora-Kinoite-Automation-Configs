#!/bin/bash
#
# Simple Instructions: 
#
#
# place the shell script in any folder you will no delete
# note down the folder/toolbox.sh 
# chmod +X toolbox.sh than 
# add ||  alias te="~/path/toolbox.sh" || to .bashrc 
#

 
clear
echo "***********************************************************"
cat << "EOF"
                             A   D                                                                           
▗▄▄▄▖▄▄▄   ▄▄▄  █ ▗▖    ▄▄▄  ▄   ▄     ▗▖  ▗▖▗▞▀▚▖▄▄▄▄  █  ▐▌
  █ █   █ █   █ █ ▐▌   █   █  ▀▄▀      ▐▛▚▞▜▌▐▛▀▀▘█   █ ▀▄▄▞▘
  █ ▀▄▄▄▀ ▀▄▄▄▀ █ ▐▛▀▚▖▀▄▄▄▀ ▄▀ ▀▄     ▐▌  ▐▌▝▚▄▄▖█   █      
  █             █ ▐▙▄▞▘                ▐▌  ▐▌                
                        Podman/Toolbox                                                      
https://github.com/alexdcodes/Fedora-Kinoite-Automation-Configs
			v.1 (More commands/options coming for v2)     
                                                               
EOF
echo "************************************************************"
toolbox list
echo ""
echo ""
echo -n "ALERT! Do you want to 'enter' or 'stop' a container (Enter/Stop)?: "
read reply
echo ""

if [[ "${reply,,}" =~ ^(enter|e)$ ]]; then
    echo "INFO: you selected enter container..."
    echo ""
    echo -n "Enter container name: "
    read cname
    toolbox enter "$cname"
else
    toolbox list
    echo "----------------------------------------------"
    read -p "Enter the toolbox(container) you want to Stop? " container_name
    echo "----------------------------------------------"
	kdialog --title "Caution" --warningcontinuecancel "About to stop a container that might be running an critical process, stop anyway?"	
	podman stop "$container_name" || echo "Failed to stop (not running or missing), continuing..."
    echo ""
    echo "INFO Listing all stopped containers on the system: "
    toolbox list  
fi

