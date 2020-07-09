#!/bin/bash
# set -x
set -e

export VIRTUALENVWRAPPER_PYTHON=/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/home/gitlab-runner-nginx/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

echo "checking lsvirtualenv"
lsvirtualenv
if [[ ! (lsvirtualenv | grep -w "$ENV_NAME" >/dev/null) ]]
then
    echo "mkvirtualenv $ENV_NAME"
    mkvirtualenv $ENV_NAME
else 
    echo "aaa"
    workon $ENV_NAME && echo "virtualenv $ENV_NAME activated"
    echo "bbb"
fi

pip install --upgrade -r requirements.txt
