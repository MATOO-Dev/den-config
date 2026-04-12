{
	den.aspects.syncthing.homeManager = { pkgs, ... }: {
		services.syncthing = {
			enable = true;
			tray.enable = true;
			# settings = { 
			# 	devices = { };
			#	folders = { };
			# };
		};
	};
}
