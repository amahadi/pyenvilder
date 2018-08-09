if [ ! -d ~/.pyenv ]; then
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi

if [ "$(grep -c "export PYENV_ROOT=\"\$HOME/.pyenv\"" ~/.bashrc)" -eq 0 ]; then
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
fi

if [ "$(grep -c "export PATH=\"\$PYENV_ROOT/bin:\$PATH\"" ~/.bashrc)" -eq 0 ]; then	
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
fi	

if [ "$(grep -c "if command -v pyenv 1>/dev/null 2>&1; then" ~/.bashrc)" -eq 0 ]; then
	echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc	
fi	

source ~/.bashrc		

echo "$(pyenv -v) installed"
