{
	den.aspects.discord.homeManager = {pkgs, ...}: {
		# consider using nixcord for declarative config including plugins
		home.packages = with pkgs; [
			vesktop
		];
	};
}
