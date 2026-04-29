{inputs, ...}: {
	den.aspects.ld.nixos = {pkgs, ...}: {
		environment.systemPackages = with inputs.nix-alien.packages."x86_64-linux"; [
			nix-alien
		];
		programs.nix-ld = {
			enable = true;
			# libraries = [
			#     pkgs.steam-run.fhsenv.args.multipkgs
			# ];
		};
	};
}
