{ inputs, ... }: 
{
	imports = [ inputs.den.flakeModule ];

	den.schema = {
		host.home-manager.enable = true;
	};

	den.default = {
		nixos.system.stateVersion = "25.11";
		homeManager.home.stateVersion = "25.11";

		user = {
			imports = [

			];
		};

		nixos = {
			imports = [

			];

			nixpkgs.config.allowUnfree = true;
		};

		homeManager = {
			imports = [

			];
		};
	};

}
