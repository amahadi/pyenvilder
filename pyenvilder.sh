#!/bin/sh

while getopts v:n: option
do
	case "${option}"
	in
		v) VERSION=${OPTARG};;
		n) VENV_NAME=${OPTARG};;
	esac
done

for i in {1..10}; do 
	bash src/debian/pyenv.sh
	if [ $? -eq 0 ]; then
		pyenv install $VERSION
		break
	fi	 
done
