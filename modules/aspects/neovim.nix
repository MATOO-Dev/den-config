{
	den.aspects.neovim = { ... }: {
		homeManager = { self', lib, ... }: {
			programs.neovim = {
				enable = true;
				package = lib.mkForce self'.packages.nvim-full;
			};
		};
	};
}
