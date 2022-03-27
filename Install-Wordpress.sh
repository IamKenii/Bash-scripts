echo welcome to the install of wordpress.

	echo
	echo "Select an option:"
	echo "   1) install all requirements."
	echo "   2) "
	echo "   3) "
	echo "   4) Exit"

	read -p "Option: " option
	until [[ "$option" =~ ^[1-4]$ ]]; do
		echo "$option: invalid selection."
		read -p "Option: " option
	done
	case "$option" in

		1)
        echo "Installing apache2 and wordpress."
        echo
        sudo apt install apache2 -y
        echo "apache 2 has been installed. "
        echo
        sudo apt-get install php -y
        echo "php has been installed. "
        echo
        echo "Installing mySQL database."
        sudo apt-get install mariadb-server php-mysql -y
        echo
        cd /var/www/html
        sudo rm -rf *
        echo "The folder /var/www/html has been cleaned. "
        echo
        echo "Downloading wordpress in to html folder"
        sudo wget http://wordpress.org/latest.tar.gz
        sudo tar xzf latest.tar.gz
        sudo mv wordpress/* .
        sudo rm -rf wordpress latest.tar.gz
        sudo chown -R www-data: .
        echo
        echo "Your wordpress server is almost done. you'll need to install the database"
        echo
        echo
        sudo mysql -uroot -p
        echo "Enter your password and press enter: "
        echo 
        create database wordpress;
        GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'admin1234';
        FLUSH PRIVILEGES;
        echo "Your wordpress should be installed by now."
        sudo apt install net-tools -y
        echo "open your webbrouwser and typ your ip address in the search balk."
        ifconfig

		;;
		2)
            exit
		;;
		3)
            exit
		;;
		4)
			exit
		;;
esac