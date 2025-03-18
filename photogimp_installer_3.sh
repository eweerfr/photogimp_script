#!/bin/bash

echo "Installing PhotoGimp by Diolinux"

echo "Checking if GIMP is running"
killall gimp-3.0

if [ -d "$HOME/.config/GIMP/3.0/" ]; then
	echo "Downloading PhotoGIMP files by DioLinux"
	shopt -s dotglob
	curl -L --progress-bar https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/PhotoGIMP-linux.zip -o ~/Downloads/PhotoGIMP-linux.zip && unzip -q ~/Downloads/PhotoGIMP-linux.zip -d ~/Downloads/PhotoGIMP/ && cp -Rf ~/Downloads/PhotoGIMP/PhotoGIMP-linux/* ~/.
	shopt -u dotglob
	echo
	echo "Removing temporary files"
	rm -rf $HOME/Downloads/PhotoGIMP
	rm $HOME/Downloads/PhotoGIMP-linux.zip
	echo
	echo "Enjoy your PhotoGIMP"
	echo "installation script by eweerfr ( https://github.com/eweerfr )"
else
	echo
	echo "GIMP config files not found"
	echo "Make sure you've opened it after installing"
	exit 1
fi
