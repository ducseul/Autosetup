HOME_DIR=$1

sudo make --directory config/terminal/cppneofetch/ install PREFIX=/usr

cp -vf config/terminal/config_files/.bashrc $HOME_DIR

