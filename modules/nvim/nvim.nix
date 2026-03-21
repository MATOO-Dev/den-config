{ den, lib, inputs, ... }:
{
	# define a vim class that forwards 'vim' to 'nvf.config.vim'
	den.aspects.vimClass = { aspect-chain, ... }: 
		den.provides.forward {
			each = lib.singleton true;
			fromClass = _: "vim";
			intoClass = _: "nvf";
			intoPath = _: [ "vim" ];
			fromAspect = _: lib.head aspect-chain;
			adaptArgs = lib.id;
		};

	# definition for full nvim config
	den.aspects.nvim-full = {
		includes = [
			# import all aspects here
		];

		vim.theme.enable = true;
		vim.theme.name = "gruvbox";
		vim.theme.style = "dark";
	};

	# definition for small nvim config
	den.aspects.nvim-small = {
		includes = [
			# import only some aspects here
		];

		vim.theme.enable = true;
		vim.theme.name = "catppuccin";
		vim.theme.style = "frappe";
	};

	den.lib.nvf.module = vimAspect: ctx:
	let
		aspect = den.lib.parametric.fixedTo ctx {
			includes = [
			den.aspects.vimClass
			vimAspect
		];
		};
		module = den.lib.aspects.resolve "nvf" [ aspect ] aspect;
	in
		module;

	perSystem = { pkgs, ... }: {
		# full nvim config for my own systems
		packages.nvim-full = (inputs.nvf.lib.neovimConfiguration {
			inherit pkgs;
			# last {} is context required for aspects (if any)
			modules = [ (den.lib.nvf.module den.aspects.nvim-full {})];
		}).neovim;

		# small nvim config for other systems or ssh
		packages.nvim-small = (inputs.nvf.lib.neovimConfiguration {
			inherit pkgs;
			# last {} is context required for aspects (if any)
			modules = [ (den.lib.nvf.module den.aspects.nvim-small {}) ];
		}).neovim;

		# small nvim config
		packages.nvim-debug = (inputs.nvf.lib.neovimConfiguration {
			inherit pkgs;
			# last {} is context required for aspects (if any)
			modules = [ (den.lib.aspects.resolve "nvf" [ ] (den.aspects.nvim-small {})) ];
		}).neovim;
	};
}
