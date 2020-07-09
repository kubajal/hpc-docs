#!/bin/bash
set -x
set -e

export VIRTUALENVWRAPPER_PYTHON=/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/home/gitlab-runner-nginx/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

ENV_NAME="mkdocs-env"
if lsvirtualenv | grep "$ENV_NAME" >/dev/null
then
    mkvirtualenv $ENV_NAME
else 
    workon $ENV_NAME
fi
pip install --upgrade -r requirements.txt
