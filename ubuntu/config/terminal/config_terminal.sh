HOME_DIR=$1

sudo make --directory config/terminal/cppneofetch/ install PREFIX=/usr

cp -vf config/terminal/config_files/.bashrc $HOME_DIR

TERM_PROFILE_ID="a39cb463-dfb9-44fd-a9c7-e98c1b4aa552"

gsettings set org.gnome.Terminal.ProfilesList list "['${TERM_PROFILE_ID}']"
gsettings set org.gnome.Terminal.ProfilesList default "'${TERM_PROFILE_ID}'"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${TERM_PROFILE_ID}/ visible-name 'Thanh'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${TERM_PROFILE_ID}/ default-size-columns 100
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${TERM_PROFILE_ID}/ default-size-rows 30
