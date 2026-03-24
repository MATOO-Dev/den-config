{ den, ... }:
{
	# define vm config aspect + user aspect
	den.hosts.x86_64-linux.matoo-vm.users.matoo = {};

	# configure vm config aspect
	den.aspects.matoo-vm = {
		# re-usable modules here
		includes = [
			# general

			# system
			den.aspects.audio
			den.aspects.bluetooth
			den.aspects.bootloader
			den.aspects.email
			den.aspects.extraPackages
			den.aspects.firefox
			den.aspects.fonts
			den.aspects.gaming
			den.aspects.input
			den.aspects.kernel
			den.aspects.locale
			den.aspects.localsend
			den.aspects.login
			den.aspects.networking
			den.aspects.niri
			den.aspects.nix
			den.aspects.printing
			den.aspects.snapshots

			# hardware
			den.aspects.vm-disk
		];

		# system settings
		nixos = { ... }:
		{
			networking.hostName = "matoo-vm";

			# hardware config
			boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
			boot.initrd.kernelModules = [];
			boot.kernelModules = [ "kvm-amd" ];
			boot.extraModulePackages = [];
			nixpkgs.hostPlatform = "x86_64-linux";

			# vm guest config
			services = {
				qemuGuest.enable = true;
				spice-vdagentd.enable = true;
				xserver.enable = true;
				xserver.videoDrivers = ["virtio"];
			};
		};

		# home settings for all users on this system
		homeManager = { ... }:
		{

		};
	};
}
