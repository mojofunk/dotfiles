#!/bin/bash
############################
# This script creates symlinks in the home directory to various config files
# or copies them under MSYS2
############################

########## Variables

root_path=$( cd $(dirname $0) ; pwd -P )
olddir=$root_path/dotfiles_old        # old dotfiles backup directory
files="vimrc vim gitconfig"       # list of files/folders to symlink

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks 
for file in $files; do
	if [ -f ~/.$file ]; then
		echo "Moving existing config file ~/.$file to $olddir"
		mv ~/.$file $olddir
	fi

	if [ -z ${MSYSTEM+x} ]; then
		echo "Creating symlink from $root_path/$file to ~/.$file"
		ln -s $root_path/$file ~/.$file
	else
		echo "Copying config $root_dir/$file to ~/.$file"
		cp -r $root_path/$file ~/.$file
	fi
done
