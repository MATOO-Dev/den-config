{
	den.aspects.login.nixos = { pkgs, lib, ... }: {
		services.displayManager.ly.enable = false;

		services.greetd = lib.mkDefault {
			enable = true;
			settings.default_session = 
			{
				command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri-session";
				user = "matoo";
			};
		};
	};
}
