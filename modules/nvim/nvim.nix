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

	# workaround for namespace collision between nvf.vim.options and nix.<module>.options
	den.aspects.vimOpts.nvf = _: {
		imports = [ (lib.mkAliasOptionModule [ "vim" "opts" ] [ "vim" "options" ]) ];
	};

	# definition for full nvim config
	den.aspects.nvim-full = {
		includes = [
			den.aspects.vimClass
			den.aspects.vimOpts
			# import all aspects here
		];

		# example options
		vim.theme.enable = true;
		vim.theme.name = "catppuccin";
		vim.theme.style = "frappe";
		vim.opts.colorcolumn = "81";
	};

	# definition for small nvim config
	den.aspects.nvim-small = {
		includes = [
			den.aspects.vimClass
			den.aspects.vimOpts
			# import only some aspects here
		];

		# more example options
		vim.theme.enable = true;
		vim.theme.name = "gruvbox";
		vim.theme.style = "dark";
		vim.opts.wrap = false;
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
