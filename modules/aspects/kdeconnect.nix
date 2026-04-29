{
	den.aspects.kdeconnect.nixos = {...}: {
		networking.firewall = {
			enable = true;
			allowedTCPPortRanges = [
				{
					from = 1714;
					to = 1764;
				}
			];
			allowedUDPPortRanges = [
				{
					from = 1714;
					to = 1764;
				}
			];
		};
	};

	den.aspects.kdeconnect.homeManager = {...}: {
		services.kdeconnect = {
			enable = true;
			indicator = true;
		};
	};
}
