echo "Writing native package list..."
pacman -Qqettn > ~/git/config/packages

echo "Writing foreign package list..."
pacman -Qqettm > ~/git/config/aur_packages
