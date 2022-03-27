echo welcome to the install of wordpress.

	echo
	echo "Select an option:"
	echo "   1) install all requirements."
	echo "   2) Uninstall apache and wordpress"
	echo "   3) Exit "

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
        sudo service apache2 restart
        echo "php has been installed. "
        echo
        echo "Installing mySQL database."
        sudo apt-get install mariadb-server php-mysql -y
        sudo service apache2 restart
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
        sudo service apache2 restart
        echo
        echo "Your wordpress server is almost done. you'll need to install the database"
        echo
        echo
        echo "follow the instructions in the README.md to add the database."
        echo "enter your root password."
        sudo mysql -uroot -p
        echo
        echo
        echo "open your webbrouwser and typ your ip address in the search balk."
        ifconfig

		;;
		2)
            echo "uninstall apache2 and wordpress."
            sudo apt purge apache2
            echo "apache 2 has been uninstalled"
            cd /var/www/html
            sudo rm -rf *
            ls
            echo
            echo
            echo
            sudo service apache2 status

		;;
		3)
            exit
		;;
esac