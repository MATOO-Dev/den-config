{
	den.aspects.ld.nixos = { pkgs, ... }: {
		programs.nix-ld = {
			enable = true;
			libraries = pkgs.steam-run.fhsenv.args.multipkgs pkgs;
		};
	};
}
