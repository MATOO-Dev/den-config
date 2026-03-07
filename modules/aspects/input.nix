{
	den.aspects.input.nixos = { ... }: {
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
	};

	den.aspects.input.homeManager = { pkgs, ... }: {
		# todo: add user to dialout group for bazecor

		home.packages = with pkgs; [
			bazecor
		];
	};
}
