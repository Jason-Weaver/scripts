#!/usr/bin/env bash

usage() {
	echo "Creating a web server based on Linux, Apache (httpd), MySQL, and PHP"
	echo "This was originally written to deploy Wordpress from a CentOS machine"
}

linuxInstall() {
	echo "Updating YUM Repo..."
	sudo yum -y update
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
		*)
			echo "Unknown arg" && exit 1
			;;
	esac
	shift
done


