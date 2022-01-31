HOME_DIR ?= /home/thanh

install_bamboo:
	bash bamboo/install_bamboo.sh


update_system:
	sudo apt update -y
	sudo apt upgrade -y


apt_install:
	bash install_packages/install_packages.sh


apt_remove:
	bash remove_packages/remove_packages.sh


config_terminal:
	bash config/terminal/config_terminal.sh $(HOME_DIR)


config_neovim:
	bash config/neovim/config_nvim.sh $(HOME_DIR)


config_git:
	bash config/git/config_git.sh


config_gsettings:
	bash config/gsettings/config_gsettings.sh


config_python:
	bash config/python/config_python.sh


config_vscode:
	bash config/vscode/config_extension.sh $(HOME_DIR)
	

fonts:
	bash install_fonts/install_fonts.sh


extension:
	bash extensions/install_extensions.sh $(HOME_DIR)


background:
	bash set_background/set_background.sh $(HOME_DIR)


install_nodejs12:
	sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
	curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
	sudo apt install nodejs -y


packages: apt_remove 		  \
		  update_system 	  \
		  apt_install 		  \
		  install_nodejs12

	sudo npm install -g neovim


admin_tasks: packages 		  \
			 config_terminal  \
			 install_bamboo   \
			 fonts


user_tasks:	config_git 		  \
			config_python 	  \
			config_neovim 	  \
			config_vscode 	  \
			background
			
	# sudo sysctl net.ipv4.tcp_ecn=0
	timedatectl set-local-rtc 1 --adjust-system-clock
	rm -f tmp.txt
	make extension


ubuntu:
	sudo apt install deepin-icon-theme htop -y
	make config_gsettings
	sudo make admin_tasks
	make user_tasks
