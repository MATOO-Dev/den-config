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

		homeManager = { ... }: {
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
