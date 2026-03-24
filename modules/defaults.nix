{ inputs, ... }: 
{
	imports = [ inputs.den.flakeModule ];

	den.schema = {
		host.home-manager.enable = true;
	};

	den.default = {
		nixos.system.stateVersion = "26.05";
		homeManager.home.stateVersion = "26.05";

		user = {

		};

		nixos = {
			nixpkgs.config.allowUnfree = true;
		};

		homeManager = {
		};
	};

}
