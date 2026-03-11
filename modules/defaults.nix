{ inputs, den, ... }: 
{
	imports = [ inputs.den.flakeModule ];

	den.schema = {
		host.home-manager.enable = true;
	};

	den.default = {
		# nixos.system.stateVersion = "25.11";
		# homeManager.home.stateVersion = "25.11";

		user = {
			imports = [

			];
		};

		nixos = {
			nixpkgs.config.allowUnfree = true;
			imports = [
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
			];

		};

		homeManager = {
			imports = [
				den.aspects.email
				den.aspects.extraPackages
				den.aspects.firefox
				den.aspects.git
				den.aspects.hyprland
				den.aspects.kitty
				den.aspects.niri
				den.aspects.nix
			];
		};
	};

}
