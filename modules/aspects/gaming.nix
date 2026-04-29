{
	den.aspects.gaming = {
		nixos = {pkgs, ...}: {
			programs.steam = {
				enable = true;
				remotePlay.openFirewall = true;
				dedicatedServer.openFirewall = false;
				localNetworkGameTransfers.openFirewall = true;
				extraCompatPackages = with pkgs; [
					proton-ge-bin
				];

				# override to the default steam package
				# causes custom rebuild -> increases eval time
				package =
					pkgs.steam.override {
						# launch options that apply to all games
						extraEnv = {
							MANGOHUD = "0"; # disable mangohud by default
							STEAMDECK = "1"; # skips launchers for some games
							GAMEMODERUN = "1"; # launch with gamemode
							PROTON_ENABLE_WAYLAND = "1"; # run the game on wayland
						};
					};
			};

			# optimize system performance for gaming
			programs.gamemode.enable = true;

			# xbox controller drive
			hardware.xpadneo.enable = true;
		};

		# todo: consider moving this to pkgs-unstable
		homeManager = {pkgs, ...}: {
			programs.mangohud.enable = true;
			programs.lutris = {
				enable = true;
				defaultWinePackage = pkgs.proton-ge-bin;
			};

			home.packages = with pkgs; [
				beyond-all-reason # FOSS RTS game
				heroic # game launcher for GOG, etc.
				prismlauncher # minecraft launcher
				r2modman # modding tool
				vintagestory # survival game
			];
		};
	};
}
