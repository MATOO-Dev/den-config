{ den, ... }:
{
	# define vm config aspect + user aspect
	den.hosts.x86_64-linux.matoo-vm.users.matoo = {};

	# configure vm config aspect
	den.aspects.matoo-vm = {
		# system-specific modules
		includes = [
			den.aspects.virtualization
		];

		# system settings
		nixos = { pkgs, ... }:
		{
			networking.hostName = "matoo-vm";
			environment.systemPackages = with pkgs; [ vim ];
			system.stateVersion = "25.11";

			# hardware config
			boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
			boot.initrd.kernelModules = [];
			boot.kernelModules = [ "kvm-amd" ];
			boot.extraModulePackages = [];
			nixpkgs.hostPlatform = "x86_64-linux";
		};

		# home settings for all users on this system
		homeManager = { ... }:
		{
			home.packages = [  ];
		};
	};
}
