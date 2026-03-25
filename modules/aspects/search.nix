{
	den.aspects.search.homeManager = { pkgs, ... }: {
		programs.rofi = {
			enable = true;
			modes = [
				"drun"
			];
		};
	};
}
