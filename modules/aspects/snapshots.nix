{
	den.aspects.snapshots = {
		nixos = {
			services.snapper = {
			};
		};

		homeManager = {pkgs, ...}: {
			home.packages = with pkgs; [
				snapper-gui
			];
		};
	};
}
