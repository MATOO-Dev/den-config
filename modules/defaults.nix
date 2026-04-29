{
	inputs,
	den,
	...
}: {
	imports = [inputs.den.flakeModule];

	den.schema = {
		host.home-manager.enable = true;
	};

	den.default = {
		nixos.system.stateVersion = "25.11";
		homeManager.home.stateVersion = "25.11";

		includes = [
			den.provides.self'
		];

		user = {
		};

		nixos = {
			nixpkgs.config.allowUnfree = true;
		};

		homeManager = {
		};
	};
}
