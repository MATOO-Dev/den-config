{
	den.aspects.login.nixos = { pkgs, ... }: {
		services.displayManager.ly.enable = false;

		services.greetd = {
			enable = true;
			settings = {
				default_session = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri";
				user = "matoo";
			};
		};
	};
}
