{ den, ... }:
{
	den.aspects.matoo = {
		# modules for this user
		includes = [
			# set username for nixos and home manager
			den.provides.define-user
			# add admin groups and set isnormaluser
			den.provides.primary-user
			# set user shell for nixos and home manager
			(den.provides.user-shell "zsh")
			# custom aspects
			den.aspects.git
		];

		# general user config
		user = { pkgs, ... }: {
			packages = with pkgs; [ kitty ];
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
			};

			# mute home manager news
			# news.display = "silent";
		};

		# settings for all machines this user runs on
		# nixos.services.<service>.enable = true;
	};
}
