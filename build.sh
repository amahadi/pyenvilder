#!/bin/bash -i

PYENVILDER_PATH=`pwd`

while getopts v:n: option
do
	case "${option}"
	in
		v) VERSION=${OPTARG};;
		n) VENV_NAME=${OPTARG};;
	esac
done

for i in {1..10}; do 
	. $PYENVILDER_PATH/src/debian/pyenv.sh
	if [ $? -eq 0 ]; then

		pyenv install $VERSION

		mkdir -p ~/pyvirenvs

		cd ~/pyvirenvs

		pyenv local $VERSION

		sudo apt-get install tcl-dev tk-dev python-tk python3-tk

		for j in {1..10}; do
			. $PYENVILDER_PATH/src/debian/virtualenv.sh $VENV_NAME
			if [ $? -eq 0 ]; then
				break
			fi
		done
		
		break
	fi	 
done
