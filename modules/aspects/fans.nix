{
	den.aspects.fans = {
		nixos = {pkgs, ...}: {
			boot.extraModulePackages = [
				# todo: find a way to automatically update this to the most recent kernel
				pkgs.linuxKernel.packages.linux_6_18.it87
			];
		};

		homeManager = {pkgs, ...}: {
			home.packages = with pkgs; [
				coolercontrol
				corectrl
				fancontrol-gui
			];
		};
	};
}
