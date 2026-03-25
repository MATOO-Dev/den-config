{ den, ... }:
{
	# define vm config aspect + user aspect
	den.hosts.x86_64-linux.matoo-laptop.users.matoo = {};

	# configure vm config aspect
	den.aspects.matoo-laptop = {
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
			den.aspects.virtualization

			# hardware
			# den.aspects.fingerprint
			# den.aspects.powersave
			# den.aspects.kanata
			den.aspects.laptop-disk
		];

		# system settings
		nixos = { config, lib, ... }:
		{
			networking.hostName = "matoo-laptop";

			# hardware config
			boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbold" "usb_storage" "sd_mod" ];
			boot.initrd.kernelModules = [];
			boot.kernelModules = [ "kvm-amd" ];
			boot.extraModulePackages = [];
			nixpkgs.hostPlatform = "x86_64-linux";
			hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
		};

		# home settings for all users on this system
		homeManager = { ... }:
		{

		};
	};
}
