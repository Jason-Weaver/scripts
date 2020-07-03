#!/usr/bin/env bash

usage() {
	echo "Creating a web server based on Linux, Apache (httpd), MySQL, and PHP"
	echo "This was originally written to deploy Wordpress from a CentOS machine"
	echo "Available options are --linx, --apache, --mysql, and --php to install"
	echo "any of them. Running the script sans args will install all of them"
}

linuxInstall() {
	echo "Updating and Configuring Linux Machine..."
	sudo yum -y update
	sudo firewall-cmd --add-service=http --permanent
	sudo firewall-cmd --reload
	echo "Enabled Services in the firewall:"
	sudo firewall-cmd --list-services
	echo
}

apacheInstall() {
	echo "Installing and Enabling Apache..."
	sudo yum install -y httpd
	sudo systemctl enable --now httpd.service
	systemctl status httpd
	echo
}

mysqlInstall() {
	echo "Installing and Enabling MySQL..."
	sudo yum install -y mysql-server
	sudo mysql_secure_installation
	sudo systemctl enable --now mysqld.service
	systemctl status mysqld
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
		--mysql | -m)
			mysqlInstall
			;;
		*)
			echo "Unknown arg" && exit 1
			;;
	esac
	shift
done


