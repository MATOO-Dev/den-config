{
	den.aspects.syncthing.homeManager = { pkgs, ... }: {
		services.syncthing = {
			enable = true;
			# settings = { 
			# 	devices = { };
			#	folders = { };
			# };
		};
	};
}
