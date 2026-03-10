{
	den.aspects.email = {
		nixos = { pkgs, ... }: {
			services = {
				protonmail-bridge.enable = true;
				gnome.gnome-keyring.enable = true;
			};

			environment.systemPackages = with pkgs; [
				protonmail-bridge-gui
			];
		};

		homeMangager = {
			programs.thunderbird = {
				enable = true;
				# settings = { };
			};
		};
	};
}
