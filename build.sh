#!/bin/sh

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
	bash $PYENVILDER_PATH/src/debian/pyenv.sh
	if [ $? -eq 0 ]; then

		pyenv install $VERSION

		if [ ! -d ~/pyvirenvs ]; then
			mkdir ~/pyvirenvs
		fi	

		cd ~/pyvirenvs
		pyenv local $VERSION

		for j in {1..10}; do
			bash $PYENVILDER_PATH/src/debian/virtualenv.sh $VENV_NAME
			if [ $? -eq 0 ]; then
				break
			fi
		done
		
		break
	fi	 
done