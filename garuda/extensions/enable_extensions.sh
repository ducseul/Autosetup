EXTENSIONS=$(cat extensions/extensions.txt)

for extension in ${EXTENSIONS[*]}; do
    # echo "$extension"
    gnome-extensions enable "$extension"
done
