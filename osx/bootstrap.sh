#!/usr/bin/env zsh

pushd .
cd ..
git pull origin master;
popd

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
	      --exclude "README.md" 
              --exclude "LICENSE-GPL.txt"  -avh --no-perms . ~;
	source ~/.zhrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
