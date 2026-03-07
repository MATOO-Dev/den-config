# fixes 'no space left on device' during install
export TMPDIR=/mnt/flake/tmp

# install desktop
sudo nix run \
	github:nix-community/disko/latest#disko-install \
	--extra-experimental-features "nix-command flakes" \
	-- --write-efi-boot-entries --flake \
	# desktop
	# .#matoo-desktop \
	# --disk primary /dev/nvme0n1 secondary /dev/nvme1n1 tertiary /dev/sda

	# laptop
	# .#matoo-laptop \
	# --disk primary /dev/nvme0n1

	# vm
	# .#matoo-vm \
	# --disk primary /dev/vda
