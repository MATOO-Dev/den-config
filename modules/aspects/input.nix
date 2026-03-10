{
	den.aspects.input = { user, ... }: {
		nixos = { ... }: {
			services.xserver.xkb = {
				layout = "us";
				variant = "";
				# gallium/canary does not exist :c
				# nixos wiki details setting up custom
				# or just use bazecor/kanata/ZMK
				# variant = "gallium";
				# variant = "colemak_dh_ortho";
			};

			console.keyMap = "us";

			# probably not needed
			# enable touchpad support (among others)
			# services.xserver.libinput.enable = true;

			# add these groups to all users on all hosts importing this aspect
			users.users.${user.userName}.extraGroups = [
				"dialout" # bazecor
			];
		};

		homeManager = { pkgs, ... }: {
			# todo: add user to dialout group for bazecor

			home.packages = with pkgs; [
				bazecor
			];
		};
	};
}
