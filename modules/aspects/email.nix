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

		homeMangager = { pkgs, ... }: {
			# programs.thunderbird.enable alone is not enough
			home.packages = with pkgs; [
				thunderbird
			];

			programs.thunderbird = {
				enable = true;
				# settings applied to all profiles
				settings = {
					"privacy.donottrackheader.enabled" = true;
				};

				profiles.default = {
					isDefault = true;
				};
			};
		};
	};
}
