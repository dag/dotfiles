for script in ~/.bash/*.sh; do
  source "$script"
done

source /etc/bash_completion
source "$(which virtualenvwrapper.sh)"
eval "$(pip completion --bash)"
eval "$(jbo bashrc)"

clear
