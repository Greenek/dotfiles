#!/bin/bash
dir="$HOME/.dotfiles"

# our config files/dirs to link
paths="config/fish/ config/fisherman/ vim/ vimrc wakatime.cfg"

########

# backup dir for old files
backup=.backup/

# make sure we are in the right place
cd "$dir"

# make backup dir
echo "Creating backup dir for the old existing dotfiles..."
if [ -d "$backup" ]; then
  rm -rf "$backup/*"
else
  mkdir "$backup"
fi

# move files to the backup dir, then create symlinks
for path in $paths; do
  if [ ! -e $path ]; then
    echo "$path configuration doesn't exists in repository"
    continue
  fi

  dest="$HOME/.$path"

  if [ -L ${dest%/} ]; then
    echo "~/.$path is already linked"
    continue
  fi

  echo "Moving old configuration files to $dir/$backup"
  mv $dest $backup

  echo "Creating symlink to $path in home directory"
  ln -s $path $dest
done
