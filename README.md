# Python Environment Builder
## Documentation to build flexible and scalable python environment
This documentation demostrate a very flexible way to install python distribution in the local machine. This way of installation allows user to switch beetween various versions of python more conveniently and create different python environment with different dependencies. So, let's get started..
### Install pyenv
pyenv is a very efficient tool to install multiple versions of python and let you switch between different version of python for various projects. Without pyenv, it is possible to install only one version of python2 and python3. pyenv allows user to install for exampele: 2.2.3 and 2.2.4 and 3.5.6 and 3.7.0 at the same time. Also you can switch between 3.5.6 and 3.7.0 according to your needs. ***The following commands will do the trick***
```
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
$ echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
```
### Installing Necessary Dependencies
There are some libraries that is needed to perform various tasks. `tkinter` is one of the libraries that is a dependency of `matplotlib` which is used for plotting various distributions. We have to install these dependencies before building our python. Simply running the following code should do it.
```
$ sudo apt-get install python-tk python3-tk tk-dev
```

### Install python using pyenv
pyenv provides commands to install various versions of python. I would reccomend to use python 3.7.0. This tutorial is shown using python 3.7.0. To install python 3.7.0, execute
```
$ pyenv install 3.7.0
```
We need to make this version global so that this version can be accessible anywhere in the system. To do that, execute
```
$ pyenv global 3.7.0
```
To know more about pyenv and how it works, visit [Github page of pyenv](https://github.com/pyenv/pyenv)
 
