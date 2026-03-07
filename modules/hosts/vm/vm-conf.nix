{ den, inputs, ... }:
{
	# define vm config aspect + user aspect
	den.hosts.x86_64-linux.matoo-vm.users.matoo = {};

	# configure vm config aspect
	den.aspects.matoo-vm = {
		# re-usable modules here
		includes = [
		];

		# system settings
		nixos = { pkgs, ... }:
		{
			includes = [
				# general
				# defined through den.base.user
				# self.nixosModules.matoo

				# system
				den.aspects.audio
				# den.aspects.bluetooth
				den.aspects.bootloader
				den.aspects.fonts
				den.aspects.input
				# den.aspects.kernel
				den.aspects.locale
				den.aspects.login
				den.aspects.networking
				den.aspects.niri
				den.aspects.nix
				den.aspects.printing
				den.aspects.virtualization

				# hardware
				# self.nixosModules.vm-general
				# self.nixosModules.vm-hardware
				# inputs.disko.nixosModules.disko
				# disk is already configured through shared namespace
				# self.diskoConfigurations.matoo-vm
				# den.aspects.vm
			];

			networking.hostName = "vm";
			environment.packages = with pkgs; [ vim ];
			system.stateVersion = "25.11";

			# hardware config
			boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
			boot.initrd.kernelModules = [];
			boot.kernelModules = [ "kvm-amd" ];
			boot.extraModulePackages = [];
			nixpkgs.hostPlatform = "x86_64-linux";
		};

		# home settings for all users on this system
		homeManager = { pkgs, ... }:
		{
			home.packages = [  ];
		};
	};
}
