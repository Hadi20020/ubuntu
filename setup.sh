#!/bin/bash

echo "-----------Updating------------"
 sudo apt update && sudo apt upgrade  
 sudo apt-get install dialog
cmd=(dialog --separate-output --checklist "Select options:" 22 76 16)
# any option can be set to default to "on"
options=( 
	a "Git,chrome,vlc,vscode,Vim,curl,npm,Python-useful stuff" off
    1  "php LAMP Stack" off
	2 "Build Essentials" off
	3 "Node.js" off
	4 "Angular MEAN" off
	5 "Composer" off
	6 "JDK 8" off
	7 "Laravel php7.4" off
	8 " Gimp Image Editor" off
	9 "Archive Extractors" off
	10 "FileZilla - a FTP client" off
	11 "Sticky Notes " off
	12 "Postman API development" off
	13 "simple screen recorder" off
	14 "Ruby" off
	15 "Heroku CLI " off     
	
	)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
    
         a)  echo "Git,chrome, vlc, vscode, Vim, Curl,npm ,Python - Some random useful stuff"
          sudo apt-get install npm
		  sudo apt-get install git
		  sudo apt-get install -y vim curl python-software-properties
          sudo apt-get install -y python-dev, python-pip
          sudo apt-get install -y libkrb5-dev
		  
		  echo "----------Text Editor------------"
            sudo snap install --classic code
             
             echo "-------Media player---------------"
              sudo apt install ubuntu-restricted-extras mpv vlc gthumb  -y 
			 
				echo "Installing Google Chrome"
				wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
				sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
				apt-get update 
				apt-get install google-chrome-stable -y
				sudo apt install -y gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell
				;; 

         
                      1)
					#Install LAMP stack
					echo "Installing Apache"
					apt install apache2 -y

					echo "Installing Mysql Server"
					apt install mysql-server -y

					echo "Installing PHP"
					apt install php libapache2-mod-php php-mcrypt php-mysql -y

					echo "Installing Phpmyadmin"
					apt install phpmyadmin -y

					echo "Configuring apache to run Phpmyadmin"
					echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

					echo "Restarting Apache Server"
					service apache2 restart
					;;
				2)
					#Install Build Essentials
					echo "Installing Build Essentials"
					apt install -y build-essential
					;;

				3)
					#Install Nodejs
					echo "Installing Nodejs"
					curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
					apt install -y nodejs
					;;
				4) echo "Installing angular MEAN"
					
                  # Angular FullStack - My favorite MEAN boilerplate (MEAN = MongoDB, Express, Angularjs, Nodejs)
                   sudo npm install -g generator-angular-fullstack

                  ;;
				5)
					#Composer
					echo "Installing Composer"
					EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
					php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
					ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

					if [ "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" ]
						then
							php composer-setup.php --quiet --install-dir=/bin --filename=composer
							RESULT=$?
							rm composer-setup.php
					else
						>&2 echo 'ERROR: Invalid installer signature'
						rm composer-setup.php
					fi
					;;

				6)
					#JDK 8
					echo "Installing JDK 8"
					apt install python-software-common -y
					add-apt-repository ppa:webupd8team/java -y
					apt update
					apt install oracle-java8-installer -y
					;;

              			7) #Laravel
              			   echo " INstalling Laravel php7.4"
                             sudo apt install php-common php-bcmath openssl php-json php-mbstring
                              ;;
            
              			8) # Gimp Image Editor
              sudo apt-get install -y gimp gimp-data gimp-plugin-registry gimp-data-extras
               ;;
              9) # Archive Extractors
              sudo apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller
              ;;
              10) # FileZilla - a FTP client
              sudo apt-get install -y filezilla
              ;;
              11) # Sticky Notes
              sudo apt-get install -y xpad
              ;;
              12) echo "Installing Postman API development environment"
                sudo snap install postman
              ;;
              13) echo "Installing simple screen recorder"
                sudo apt install -y simplescreenrecorder
              ;;
              14) echo "Installing Ruby"
                sudo apt install -y ruby
              ;;
               15) echo "Installing Heroku CLI client ..."
                curl -s https://toolbelt.heroku.com/install-ubuntu.sh | sh
              
              echo "Installing the heroku-config plugin to pull config variables locally to be used as ENV variables ..."
                heroku plugins:install git://github.com/ddollar/heroku-config.git	
               ;;
			   
			
	
	esac
done
              
