#!/usr/bin/env bash

usage() {
	echo "Creating a web server based on Linux, Apache (httpd), MySQL, and PHP"
	echo "This was originally written to deploy Wordpress from a CentOS machine"
}

linuxInstall() {
	echo "Updating your Linux RPM Repo..."
	sudo yum -y update
	echo
}

apacheInstall() {
	echo "Installing and Enabling Apache..."
	sudo yum install -y httpd
	sudo systemctl enable --now httpd.service
	systemctl status httpd
	echo
}

# arg parser
while [ $# -gt 0 ]
do
	case "$1" in 
		--help | -h)
			usage && exit 0
			;;
		--linux | -l)
			linuxInstall
			;;
		--apache | -a)
			apacheInstall
			;;
		*)
			echo "Unknown arg" && exit 1
			;;
	esac
	shift
done


