{ inputs, ... }: 
{
	imports = [ inputs.den.flakeModule ];

	den.base = {
		host.home-manager.enable = true;
	};

	den.default = {
		nixos.system.stateVersion = "25.11";
		homeManager.home.stateVersion = "25.11";

		nixos = {
			imports = [

			];

			nixpkgs.config.allowUnfree = true;
		};

		homeManager = {

		};
	};

}
