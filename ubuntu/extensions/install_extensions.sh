HOME_DIR=$1
EXTENSION_DIR="$HOME_DIR/.local/share/gnome-shell/extensions"

mkdir -p ${EXTENSION_DIR}

cp -r extensions/clipboard-indicator@tudmotu.com/             $EXTENSION_DIR
cp -r extensions/cpupower@mko-sl.de/                          $EXTENSION_DIR
cp -r extensions/dash-to-dock@micxgx.gmail.com/               $EXTENSION_DIR
cp -r extensions/netspeedsimplified@prateekmedia.extension/   $EXTENSION_DIR
cp -r extensions/sound-output-device-chooser@kgshank.net/     $EXTENSION_DIR
cp -r extensions/system-monitor@paradoxxx.zero.gmail.com/     $EXTENSION_DIR

busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")'

sleep 5

gnome-extensions enable clipboard-indicator@tudmotu.com
gnome-extensions enable cpupower@mko-sl.de
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable netspeedsimplified@prateekmedia.extension
gnome-extensions enable sound-output-device-chooser@kgshank.net
gnome-extensions enable system-monitor@paradoxxx.zero.gmail.com

# ===================== Install from source =====================

# Dash-To-Dock
# rm -rf github/dash-to-dock
# git clone https://github.com/micheleg/dash-to-dock.git github/dash-to-dock
# make --directory github/dash-to-dock/ clean
# make --directory github/dash-to-dock/ 
# make --directory github/dash-to-dock/ install


# CPU Power Manager
# rm -rf github/cpupower
# git clone https://github.com/martin31821/cpupower.git github/cpupower
# make --directory github/cpupower/ install PREFIX="$HOME/.local"


# system-monitor
# rm -rf github/gnome-shell-system-monitor-applet
# git clone https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git github/gnome-shell-system-monitor-applet
# sudo pacman -S libgtop networkmanager gnome-system-monitor clutter
# make --directory github/gnome-shell-system-monitor-applet clean
# make --directory github/gnome-shell-system-monitor-applet install


# clipboard-indicator
# git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git "$EXTENSION_DIR"/clipboard-indicator@tudmotu.com
# gnome-extensions enable clipboard-indicator@tudmotu.com


# Net speed Simplified 
# rm -rf github/netspeedsimplified
# git clone "https://github.com/prateekmedia/netspeedsimplified.git" github/netspeedsimplified
# make --directory github/netspeedsimplified install


# Sound Input & Output Device Chooser
# rm -rf github/gse-sound-output-device-chooser
# git clone https://github.com/kgshank/gse-sound-output-device-chooser.git github/gse-sound-output-device-chooser
# cp -rf github/gse-sound-output-device-chooser/sound-output-device-chooser@kgshank.net $EXTENSION_DIR
# gnome-extensions enable sound-output-device-chooser@kgshank.net
