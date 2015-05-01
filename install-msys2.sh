#!/bin/bash

########## Variables

dir=~/Data/dotfiles               # dotfiles directory
olddir=~/Data/dotfiles_old        # old dotfiles backup directory
files="vimrc vim gitconfig"       # list of files/folders to copy

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
rm -rf $olddir
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then copy
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file $olddir
	echo "Copying config $file to home directory."
	cp -r $dir/$file ~/.$file
done
