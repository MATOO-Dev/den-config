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
			den.aspects.vimAutocomplete
			den.aspects.vimDebugging
			den.aspects.vimDiagnostics
			den.aspects.vimGit
			den.aspects.vimKeymaps
			den.aspects.vimLanguages
			den.aspects.vimNavigation
			den.aspects.vimOptions
			den.aspects.vimTheme
			den.aspects.vimTyping
			den.aspects.vimVisuals
		];
	};

	# definition for small nvim config
	den.aspects.nvim-small = {
		includes = [
			den.aspects.vimClass
			# import only some aspects here
			den.aspects.vimKeymaps
			den.aspects.vimNavigation
			den.aspects.vimOptions
		];
	};

	# install full nvim config to home manager (package definition below)
	den.aspects.neovim.homeManager = { self', ... }: {
		home.packages = [ self'.packages.nvim-full ];
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
