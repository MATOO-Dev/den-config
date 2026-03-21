{ den, lib, inputs, ... }:
{
	# define a vim class that forwards 'vim' to 'nvf.vim'
	den.aspects.vimClass = { aspect-chain, ... }: 
		den.provides.forward {
			each = lib.singleton true;
			fromClass = _: "vim";
			intoClass = _: "nvf";
			intoPath = _: [ "vim" ];
			fromAspect = _: lib.head aspect-chain;
			adaptArgs = lib.id;
		};

	den.aspects.optClass = { aspect-chain, ... }: 
		den.provides.forward {
			each = lib.singleton true;
			fromClass = _: "opt";
			intoClass = _: "nvf";
			intoPath = _: [ "vim" "options" ];
			fromAspect = _: lib.head aspect-chain;
			adaptArgs = lib.id;
		};

	# definition for full nvim config
	den.aspects.nvim-full = {
		includes = [
			den.aspects.vimClass
			den.aspects.optClass
			# import all aspects here
		];

		# example options
		vim.theme.enable = true;
		vim.theme.name = "gruvbox";
		vim.theme.style = "dark";
		# vim.options.colorcolumn = "81";
		opt.colorcolumn = "81";
		# nvf.vim.options.colorcolumn = "81";
	};

	# definition for small nvim config
	den.aspects.nvim-small = {
		includes = [
			den.aspects.vimClass
			# import only some aspects here
		];

		# more example options
		vim.theme.enable = true;
		vim.theme.name = "catppuccin";
		vim.theme.style = "frappe";
	};

	# expose packages to all system types defined in flake
	perSystem = { pkgs, ... }: {
		# full nvim package for my own systems
		packages.nvim-full = (inputs.nvf.lib.neovimConfiguration {
			inherit pkgs;
			modules = [ (den.lib.aspects.resolve "nvf" [ den.aspects.nvim-full ] den.aspects.nvim-full) ];
		}).neovim;

		# small nvim package for ssh etc.
		packages.nvim-small = (inputs.nvf.lib.neovimConfiguration {
			inherit pkgs;
			modules = [ (den.lib.aspects.resolve "nvf" [ den.aspects.nvim-small ] den.aspects.nvim-small) ];
		}).neovim;
	};
}
