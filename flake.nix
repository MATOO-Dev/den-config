{
	description = "MATOO's nixos den config testing";

	inputs = {
		# packages
		nixpkgs.url = "github:nixos/nixpkgs/25.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		# extra features
		home-manager.url = "github:nix-community/home-manager/release-25.11";
		# nvim.url = "github:matoo-dev/nixcats-conf";
		# impermanence.url = "github:nix-community/impermanence";

		# config architecture
		# allfollow.url = "github:spikespaz/allfollow";
		den.url = "github:vic/den";
		flake-parts.url = "github:hercules-ci/flake-parts";
		import-tree.url = "github:vic/import-tree";

		# hardware
		disko.url = "github:nix-community/disko";
		# lanzaboote.url = "github:nix-community/lanzaboote";
	};

	outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
