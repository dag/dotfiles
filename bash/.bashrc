for script in ~/.bash/*.sh; do
  source "$script"
done

source /etc/bash_completion
source virtualenvwrapper.sh

eval "$(pip completion --bash)"
eval "$(jbo bashrc)"

clear
