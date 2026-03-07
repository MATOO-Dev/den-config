{
	den.aspects.niri.nixos = { pkgs, ... }: {
		programs.niri.enable = true;
		services = {
			gnome.gnome-keyring.enable = true;
			xserver.enable = true;
		};

		security = {
			polkit.enable = true;
		};

		environment.systemPackages = with pkgs; [
			# notifications
			mako
		];
	};

	den.aspects.niri.homeManager = { config, ... }: {
		home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink ./../../dotfiles/niri;
	};
}
