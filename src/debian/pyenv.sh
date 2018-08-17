if [ ! -d ~/.pyenv ]; then
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi

if [ "$(grep -c "export PYENV_ROOT=\"\$HOME/.pyenv\"" ~/.bashrc)" -eq 0 ]; then
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
fi

if [ "$(grep -c "export PATH=\"\$PYENV_ROOT/bin:\$PATH\"" ~/.bashrc)" -eq 0 ]; then	
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
fi	

if [ "$(grep -c "eval \"\$(pyenv init -)\"" ~/.bashrc)" -eq 0 ]; then
	echo 'eval "$(pyenv init -)"' >> ~/.bashrc	
fi	

while : ; do
	source ~/.bashrc
	if [ $? -eq 0 ]; then
		echo "$(pyenv -v) installed"
		break
	fi
done
