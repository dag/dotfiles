source /etc/profile

for script in ~/.bash/*.sh; do
  source "$script"
done

eval `dircolors ~/.dir_colors`

clear
