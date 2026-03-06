{
	den.aspects.niri.nixos = { ... }: {
		programs.niri.enable = true;
		services = {

		};
	};

	den.aspects.niri.homeManager = { config, ... }: {
		home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink ./../../dotfiles/niri;
	};
}
