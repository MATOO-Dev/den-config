{ den, lib, inputs, ... }:
{
	# define a vim class that forwards 'vim' to 'nvf.config.vim'
	den.aspects.vimClass = { aspect-chain }:
		den.provides.forward {
			each = lib.singleton true;
			fromClass = _: "vim";
			intoClass = _: "nvf";
			intoPath = _: [
				"config"
				"vim"
			];
			fromAspect = _: lib.head aspect-chain;
			adaptArgs = lib.id;
		};

	# definition for full nvim config
	den.aspects.nvim = {
		includes = [
			den.aspects.vimClass
			# import more aspects here
		];

		vim.options = {
			number = true;
			relativenumber = true;
		};
	};

	# definition for small nvim config
	den.aspects.nvim-small = {
		includes = [
			den.aspects.vimClass
			# import more aspects here
		];

		vim.options = {
			number = true;
			relativenumber = false;
		};
	};

	# expose the packages to the flake
	flake.packages.x86_64-linux = {
		# full nvim config
		nvim = (inputs.nvf.lib.neovimConfiguration {
			pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
			modules = [ (den.lib.aspects.resolve "nvf" [ ] (den.aspects.nvim {})) ];
		}).neovim;

		# small nvim config
		nvim-small = (inputs.nvf.lib.neovimConfiguration {
			pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
			modules = [ (den.lib.aspects.resolve "nvf" [ ] (den.aspects.nvim-small {})) ];
		}).neovim;
	};
}
