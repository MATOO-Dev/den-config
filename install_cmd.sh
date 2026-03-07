sudo nix run \
	github:nix-community/disko/latest#disko-install \
	--extra-experimental-features "nix-command flakes" \
	-- --write-efi-boot-entries --flake \

	# editing note:
	# uncomment the 2 lines below the configuration
	# move them up to be directly below the rest of the command
	# do not leave an empty line!

	# desktop
	# .#matoo-desktop \
	# --disk primary /dev/nvme0n1 secondary /dev/nvme1n1 tertiary /dev/sda

	# laptop
	# .#matoo-laptop \
	# --disk primary /dev/nvme0n1

	# vm
	# .#matoo-vm \
	# --disk primary /dev/vda
