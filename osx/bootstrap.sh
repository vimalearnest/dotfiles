#!/usr/bin/env zsh

#!/usr/bin/env bash

#pushd .
#cd ..
#git pull origin master;
#popd

function doIt() {
	rsync --exclude "bootstrap.sh" --exclude "README.md" \
              -avh --no-perms . ~;
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
