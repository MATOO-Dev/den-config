{
	den.aspects.login.nixos = { pkgs, lib, ... }: {
		services.displayManager.ly.enable = false;

		services.greetd = lib.mkForce {
			enable = true;
			settings.default_session = 
			{
				command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd niri";
				user = "matoo";
			};
		};
	};
}
