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

	# definition for full nvim config
	den.aspects.nvim-full = {
		includes = [
			den.aspects.vimClass
			# import all aspects here
		];

		# example options
		vim.theme.enable = true;
		vim.theme.name = "gruvbox";
		vim.theme.style = "dark";
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
		# full nvim config for my own systems
		packages.nvim-full = (inputs.nvf.lib.neovimConfiguration {
			inherit pkgs;
			modules = [ (den.lib.aspects.resolve "nvf" [ den.aspects.nvim-full ] den.aspects.nvim-full) ];
		}).neovim;

		# small nvim config for other systems or ssh
		packages.nvim-small = (inputs.nvf.lib.neovimConfiguration {
			inherit pkgs;
			modules = [ (den.lib.aspects.resolve "nvf" [ den.aspects.nvim-small ] den.aspects.nvim-small) ];
		}).neovim;
	};
}
