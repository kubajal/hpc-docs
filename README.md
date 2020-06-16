
# About docs repo

This repo contains public documentation of the hpc-resources and tutorials.

HPC @ ICM UW: <http://kdm.icm.edu.pl/>

Tutorials are hosted at <https://icm-uw.github.io/hpc-docs/>

## How to host the tutorials

This short tutorial will show you how to serve the webpage at you local machine and test your changes. Tested on Ubuntu.

First, it is safe to isolate your python's enviroment.

Install virtual enviroment:
```sh
$ pip3 install virtualenv virtualenvwrapper
$ source /usr/local/bin/virtualenvwrapper.sh
```

Depending on the version install, the source location can differ and environment paths need to be exported:

```sh
$ export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
$ export VIRTUALENVWRAPPER_VIRTUALENV=/home/<user>/.local/bin/virtualenv
$ source ~/.local/bin/virtualenvwrapper.sh
```

You can lookup your pythons' distributions using `$ whereis python` or just pick the default one...

```sh
$ mkvirtualenv --python=$(which python3) tclb-docs-env
```

To activate `$ workon docs-env`, to deactive enter `$ deactivate`

Install dependencies:

```sh
(docs-env) $  pip install -r requirements.txt
```

Run server on you local machine:

```sh
(docs-env) $ mkdocs serve
```

To deploy:

```sh
(docs-env) $ mkdocs gh-deploy
```

More questions? Visit original documentation: http://www.mkdocs.org/

### Common issues

Google virtual env installation

<https://medium.com/@aaditya.chhabra/virtualenv-with-virtualenvwrapper-on-ubuntu-34850ab9e765>

<https://itnext.io/virtualenv-with-virtualenvwrapper-on-ubuntu-18-04-goran-aviani-d7b712d906d5>

## How run automaticaly check for broken links

Install nodejs <https://nodejs.org/en/download/>

Install markdown-link-check:

```.sh
$ npm install -g markdown-link-check
```

Command Line Tool
The command line tool optionally takes 1 argument, the file name or http/https URL. If not supplied, the tool reads from standard input.

```.sh
# Check links from a markdown file hosted on the web
$ markdown-link-check https://github.com/tcort/markdown-link-check/blob/master/README.md  

# Check links from a local markdown folder (recursive)
$ find docs -name \*.md -exec markdown-link-check {} \;

# Check links from a local markdown file
$ markdown-link-check ./README.md  
```

Source: <https://www.npmjs.com/package/markdown-link-check>

### Some potentially interesting stuff

Converting a web page to markdown:

```.sh
pandoc -s -r html http://www.gnu.org/software/make/ -o example_from_web.md
```

## How to contribute

1) Test the changes on your local machine.
2) Make a pull request to the develop branch.
