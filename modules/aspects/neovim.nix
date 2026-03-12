{
	den.aspects.neovim = { inputs, ... }: {
		homeManager = {
			programs.neovim = {
				enable = true;
				package = inputs.neovim.nvim-full;
			};
		};
	};
}
