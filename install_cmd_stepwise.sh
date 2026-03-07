 sudo nix run \
	 --experimental-features "nix-command flakes" \ 
	 github:nix-community/disko/latest \
	 -- --mode destroy,format,mount --flake \ 

	# editing note:
	# uncomment the 2 lines below the configuration you wish to use
	# move them up to be directly below the rest of the command
	# do not leave an empty line!


	# desktop
	# .#matoo-desktop \
	# --disk primary /dev/nvme0n1 secondary /dev/nvme1n1 tertiary /dev/sda

	# laptop
	# .#matoo-laptop \
	# --disk primary /dev/nvme0n1

	# vm
	# .#matoo-vm
	# --disk primary /dev/vda

sudo nixos-install --flake \
	# editing note:
	# uncomment the line for the configuration you wish to use
	# move them up to be directly below the rest of the command
	# do not leave an empty line!

	# .#matoo-desktop
	# .#matoo-laptop
	# .#matoo-vm
