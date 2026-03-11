{ den, ... }:
{
	# define home aspect
	den.homes.x86_64-linux.matoo = {};

	# configure home aspect
	den.aspects.matoo = {
		# modules for this user
		includes = [
			# set wheel/networkmanager groups
			den.provides.primary-user
			# set login shell
			(den.provides.user-shell "zsh")
			# custom aspects
			den.aspects.coding
			den.aspects.discord
			den.aspects.email
			den.aspects.extraPackages
			den.aspects.firefox
			den.aspects.git
			den.aspects.hyprland
			den.aspects.kitty
			den.aspects.niri
			den.aspects.nix
			den.aspects.shells
		];

		# general user config
		user = { pkgs, ... }: {
			isNormalUser = true;
			description = "MATOO";
			extraGroups = [ ];
			# only used once right after installing
			# don't forget to set password after installing
			initialPassword = "12345";
		};

		# user-specific home manager settings
		homeManager = { pkgs, ... }: {
			# let home manager install and manage itself
			programs.home-manager.enable = true;

			home = {
				username = "matoo";
				homeDirectory = "/home/matoo";
				stateVersion = "25.11";

				packages = with pkgs; [
					kitty
					git
				];
			};

			# mute home manager news
			# news.display = "silent";
		};

		# settings for all machines this user runs on
		# nixos.services.<service>.enable = true;
	};
}
