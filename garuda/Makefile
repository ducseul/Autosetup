HOME_DIR ?= /home/thanh

install_bamboo:
	bash bamboo/install_bamboo.sh


update_system:
	sudo pacman -Syu


pac_install:
	bash install_packages/install_packages.sh


pac_remove:
	bash remove_packages/remove_packages.sh


config_terminal:
	bash config/terminal/config_terminal.sh $(HOME_DIR)


config_neovim:
	bash config/neovim/config_nvim.sh $(HOME_DIR)


config_vscode:
	bash config/vscode/config_extension.sh $(HOME_DIR)


config_git:
	bash config/git/config_git.sh


config_python:
	bash config/python/config_python.sh


config_gsettings:
	bash config/gsettings/config_gsettings.sh


config_mirrorlist:
	bash config/mirrorlist/config_mirrorlist.sh


fonts:
	bash install_fonts/install_fonts.sh


extension:
	bash extensions/install_extensions.sh $(HOME_DIR)


background:
	bash set_background/set_background.sh $(HOME_DIR)


packages: pac_remove \
		  pac_install
	sudo npm install -g neovim


admin_tasks: packages 		 \
			 config_terminal \
			 install_bamboo  \
			 fonts


user_tasks:	config_python \
			config_neovim \
			config_vscode \
			background
			
	# sudo sysctl net.ipv4.tcp_ecn=0
	timedatectl set-local-rtc 1 --adjust-system-clock
	rm -f install_packages.out
	rm -f remove_packages.out
	rm -f tmp.txt
	make extension


garuda: config_mirrorlist \

	sudo pacman -S deepin-icon-theme jack2 --noconfirm
	make config_gsettings
	make update_system
	sudo make admin_tasks
	make user_tasks
