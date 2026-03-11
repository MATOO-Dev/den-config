{ inputs, den, ... }: 
{
	imports = [ inputs.den.flakeModule ];

	den.schema = {
		host.home-manager.enable = true;
	};

	den.default = {
		# nixos.system.stateVersion = "25.11";
		# homeManager.home.stateVersion = "25.11";

		nixos = den.lib.parametric {
			nixpkgs.config.allowUnfree = true;
			imports = with den.aspects; [
				audio
				bluetooth
				bootloader
				email
				extraPackages
				firefox
				fonts
				gaming
				input
				kernel
				locale
				localsend
				login
				networking
				niri
				nix
				printing
			];

		};

		homeManager = den.lib.parametric {
			imports = with den.aspects; [
				email
				extraPackages
				firefox
				git
				hyprland
				kitty
				niri
				nix
			];
		};
	};

}
