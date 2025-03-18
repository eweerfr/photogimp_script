#!/bin/bash

echo "Installing PhotoGimp"

echo "Checking if GIMP is running"
killall gimp-2.10

if [ -d "$HOME/.config/GIMP/2.10/" ]; then
	echo "Downloading PhotoGIMP files by DioLinux"
	curl -L --progress-bar https://github.com/Diolinux/PhotoGIMP/releases/download/1.1/PhotoGIMP.zip -o ~/Downloads/PhotoGIMP.zip && unzip -q ~/Downloads/PhotoGIMP.zip -d ~/Downloads/PhotoGIMP/ && cp -R ~/Downloads/PhotoGIMP/PhotoGIMP-master/.var/app/org.gimp.GIMP/config/GIMP/2.10/* $HOME/.config/GIMP/2.10/
	echo
	echo "Removing temporary files"
	rm -rf $HOME/Downloads/PhotoGIMP
	rm $HOME/Downloads/PhotoGIMP.zip
	echo

	read -p "Do you wish to open GIMP now ? (y/n): " ans

	if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
		echo "Launching GIMP..."
		gimp
	else
		echo
		echo "Enjoy your PhotoGIMP"
		echo "installation script by eweerfr ( https://github.com/eweerfr )"
	fi
else
	echo
	echo "GIMP config files not found"
	echo "Make sure you've opened it after installing"
	exit 1
fi
