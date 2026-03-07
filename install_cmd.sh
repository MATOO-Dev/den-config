# abbreviations
disko=github:nix-community/disko/latest#disko-install
experimental=--extra-experimental-features "nix-command flakes"
options=--write-efi-boot-entries

# fixes 'no space left on device' during install
export TMPDIR=/mnt/flake/tmp

# install desktop
# sudo nix run $disko $experimental -- $options --flake .#matoo-desktop --disk primary /dev/nvme0n1 secondary /dev/nvme1n1 tertiary /dev/sda

# install laptop
# sudo nix run $disko $experimental -- $options --flake .#matoo-laptop --disk primary /dev/nvme0n1

# install vm
# sudo nix run $disko $experimental -- $options --flake .#matoo-vm --disk primary /dev/vda
