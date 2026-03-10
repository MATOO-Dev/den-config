{
	den.aspects.gaming = {
		nixos = { pkgs, ... }: {
			programs.steam = {
				enable = true;
				remotePlay.openFirewall = true;
				dedicatedServer.openFirewall = false;
				localNetworkGameTransfers.openFirewall = true;

				# override to the default steam package
				# causes custom rebuild -> increases eval time
				package = pkgs.steam.override {
					# launch options that apply to all games
					extraEnv = {
						MANGOHUD = "0"; # disable mangohud by default
						STEAMDECK = "1"; # skips launchers for some games
						GAMEMODERUN = "1"; # launch with gamemode
						PROTON_ENABLE_WAYLAND = "1"; # run the game on wayland
					};
				};
			};

			programs.gamemode.enable = true;
		};

		homeManager = { pkgs-unstable, ... }: {
			programs.mangohud.enable = true;
			programs.lutris = {
				enable = true;
				defaultWinePackage = pkgs-unstable.proton-ge-bin;
			};
		};
	};
}
