#! /usr/bin/env bash

#
# stf
# This script downloads the latest Arch Linux mirrorlist, ranks the mirrors by speed, 
# and updates the system's mirrorlist with the 7 fastest ones, backing up the original 
# mirrorlist file before making changes. It also prompts the user to remove temporary files.

set -e

raw_mirrors_file=mirrorlist.new
fast_mirrors_file=mirrorlist.fast

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
curl -s -o $raw_mirrors_file https://archlinux.org/mirrorlist/?country=all&protocol=http&protocol=https&ip_version=4

if [[ ! -f $raw_mirrors_file ]]; then
    echo "Error: Failed to download the mirrorlist"
    exit 1
fi

sed -i 's/^#Server/Server/' $raw_mirrors_file

echo "Ranking mirrors. This will take a while..."
rankmirrors -n 7 $raw_mirrors_file > $fast_mirrors_file
sed -i '/^#/d' $fast_mirrors_file
sudo mv $fast_mirrors_file /etc/pacman.d/mirrorlist

echo ""
echo "Obtained fast mirrors. cat /etc/pacman.d/mirrorlist"
cat $fast_mirrors_file
echo ""

while true; do
  rmfls="'$raw_mirrors_file' and '$fast_mirrors_file' files"
  read -rp "Remove $rmfls? [Y/n] " yn
  yn="${yn,,}" # convert to lowercase

  case "$yn" in
    y|yes|'')
      rm $raw_mirrors_file $fast_mirrors_file
      echo "Removed $rmfls"
      break
      ;;
    n|no)
      break
      ;;
    *)
      echo "Invalid input '$yn'. Please enter yes or no (Y/n)"
      ;;
  esac
done

echo "Finished."
exit 0
