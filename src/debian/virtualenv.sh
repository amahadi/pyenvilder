VENV_NAME=$1
VENV_PATH=~/pyvirenvs/$VENV_NAME
mkdir -p $VENV_PATH
if [ $? -eq 0 ]; then
	pip install virtualenv
	virtualenv $VENV_PATH
	echo "$VENV_NAME virtual python environment created"
	echo "============== To run this environment run =============="
	echo "source ~/pyvirenvs/$VENV_NAME/bin/activate"
fi
