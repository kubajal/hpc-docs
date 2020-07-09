#!/bin/bash
# set -x
set -e

export VIRTUALENVWRAPPER_PYTHON=/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/home/gitlab-runner-nginx/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

echo "listing lsvirtualenv"
lsvirtualenv
# if [[ ! $(lsvirtualenv | grep -w "mkdocs-env") ]] ; then echo "not found" ; else echo "found" ; fi

if [[ ! $(lsvirtualenv | grep -w "mkdocs-env") ]] ; then
    echo "creating new enviroment: $ENV_NAME"
    mkvirtualenv $ENV_NAME
else 
    echo "existing enviroment found $ENV_NAME"
    workon $ENV_NAME && echo "virtualenv $ENV_NAME activated"
fi

pip install --upgrade -r requirements.txt
