for script in ~/.bash/*.sh; do
  source "$script"
done

source /etc/bash_completion
source virtualenvwrapper.sh

if [ ! -f /dev/shm/cache.sh ]; then
  pip completion --bash >> /dev/shm/cache.sh
  jbo bashrc            >> /dev/shm/cache.sh
else
  source /dev/shm/cache.sh
fi

clear
