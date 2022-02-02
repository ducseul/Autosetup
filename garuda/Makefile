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


config_desktop:
	bash config/desktop/config_desktop.sh


fonts:
	bash install_fonts/install_fonts.sh


restart_gshell:
	xdotool key "Alt+F2+r" && sleep 1 && xdotool key "Enter"
	sleep 5


extension:
	bash extensions/install_extensions.sh $(HOME_DIR)
	make restart_gshell
	bash extensions/enable_extensions.sh



background:
	bash set_background/set_background.sh $(HOME_DIR)


packages: 
	make pac_remove
	make update_system
	make pac_install
	sudo npm install -g neovim


admin_tasks: 
	make packages
	make config_terminal
	make install_bamboo
	make fonts


user_tasks:
	make config_python
	make config_neovim
	make config_vscode
	make config_git
	make background
	# sudo sysctl net.ipv4.tcp_ecn=0
	timedatectl set-local-rtc 1 --adjust-system-clock
	rm -f tmp.txt


garuda: 
	make extension
	make config_mirrorlist
	sudo pacman -S deepin-icon-theme jack2 --noconfirm
	make config_gsettings
	sudo make admin_tasks
	make user_tasks
	make config_desktop
	make restart_gshell
	