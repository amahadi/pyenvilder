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
Now you will see by running `$ python -V`, it return `Python 3.7.0` as python 3.7.0 is set to be global and executable anywhere in the system.
To know more about pyenv and how it works, visit [Github page of pyenv](https://github.com/pyenv/pyenv)
### Install virtualenv
`virtualenv` is a very convenient tool to create an isolated python environment. All the libraries and dependencies can be packaged together in a folder that is totally independent from the global environment. Also this environment can be activated and deactivated when needed. Installing the `virtualenv` is as easy as running the following command.
```
$ sudo pip install virtualenv
```
### Create custom environment using virtualenv
Creating a virtual environment using virtualenv is very straight forward. 
- First create a directory for the environment that will packate the while virtual environment including dependencies.
```
$ mkdir Environments/pyenvilder
```
Name the directory whatever you want instead of `pyenvilder`
- Now run the following command to create a virtual environment named anything you want eg. pyenvilder.
```
$ virtualenv ~/Environments/pyenvilder/
```
You can see that, this installs pip and wheel in that directory.
- Now execute the following command to `activate` this environment.
```
$ source ~/Environments/pyenvilder/bin/activate
```
You can see that there is a `(pyenvilder)` written before the username of your terminal. It indicates you that, the virtual environment `pyenvilder` is running.
- To deactivate this environment simply run `deactivate`. You can see that the `(pyenvilder)` would have gone.

To know more about different stuffs about virtualenv, visit their [Official Page](https://virtualenv.pypa.io/en/stable/installation/)
### Some Observations
Not that you have successfully completed all the steps above(Which is a lot!!! :sweat:), let's talk why we took so much trouble to do all this things instead installing python using just `$ sudo apt-get install python3`. It will get much clearer by going through the following scenarios:
#### Scenario #1
Suppose you are a python web developer. You use `django` or `Flask` for your web development. Now, you have done lets say, Project_A with python version 3.6.0, so you have python 3.6.0 installed in your local workstation. Now you are required to do an project lets say Project_X in python 3.7.0 but you also have to give some support to Project_A, what should you do? Should you uninstall python 3.6.0 and install 3.7.0 for Project_X? It's a bad idea because Project_A may break in the newer version of python. Also it's not quite possible to upgrade Project_A. The solution is `pyenv`. You can assign different versions of python using pyenv. To demostrate this, let us install another version of `python` using `pyenv`. ***Remember to deactivate the virtualenv.***
```
$ pyenv install 3.6.0
```
Now let us make two directory from Project_A and Project_X
```
$ mkdir Project_A
$ mkdir Project_X
```
Now `cd` to Project_A and run `$ python -V`. The command will return `Python 3.7.0` as python 3.7.0 is set as global. Now run `$ pyenv local 3.6.0`. Now checking the version by `$ python -V` will return `Python 3.6.0`. This directory will now use python 3.6.0. Similarly, if you cd into Project_X, you will find that the python version 3.7.0 is set for this directory. So you can now work on python 3.6.0 in Project_A while you can work in python 3.7.0 in Project_X. It's that convenient.
