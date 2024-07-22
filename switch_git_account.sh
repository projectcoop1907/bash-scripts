# switch_git_account.sh
#!/bin/bash

if [ "$1" == "aryan-michael" ]; then
	ssh-add -D
	ssh-add ~/.ssh/aryan-michael
	git config --global user.name "aryan-michael"
	git config --global user.email "aryanmichael24@gmail.com"
elif [ "$1" == "projectcoop1907" ]; then
	ssh-add -D
	ssh-add ~/.ssh/projectcoop1907
	git config --global user.name "projectcoop1907"
	git config --global user.email "projectcoop1907@gmail.com"
else
	echo "Usage: switch_git_account.sh [aryan-michael|projectcoop1907]"
fi
