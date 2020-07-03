#!/usr/bin/env bash

usage() {
	echo "Creating a web server based on Linux, Apache (httpd), MySQL, and PHP"
	echo "This was originally written to deploy Wordpress from a CentOS machine"
}

# arg parser
while [ $# -gt 0 ]
do
	case "$1" in 
		--help)
			usage && exit 0
			;;
		-h)
			usage && exit 0
			;;
		*)
			echo "Unknown arg" && exit 1
			;;
	esac
	shift
done


echo "Setting up LAMP server..."
