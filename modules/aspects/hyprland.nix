{
	den.aspects.hyprland.nixos = { ... }: {
		programs.hyprland.enable = true;
	};

	den.aspects.hyprland.homeManager = { config, ... }: {
		home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink ./../../dotfiles/hyprland;
	};
}
