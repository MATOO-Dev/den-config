{
	den.aspects.vimDebugging.vim = { pkgs, ... }: {
		languages.enableDAP = true;

		debugger.nvim-dap = {
			enable = true;
			mappings = {
				continue = "<f5>";
				terminate = "<s-f5>";
				restart = "<up>";
				stepOver = "<down>";
				stepInto = "<right>";
				stepOut = "<left>";
				toggleBreakpoint = "<leader>b";
			};
		};

		lazy.plugins.nvim-dap-view = {
			package = pkgs.vimPlugins.nvim-dap-view;
			setupModule = "dap-view";
			setupOpts = {};
		};

		lazy.plugins.nvim-dap-virtual-text = {
			package = pkgs.vimPlugins.nvim-dap-virtual-text;
			setupModule = "nvim-dap-virtual-text";
			setupOpts = {};
		};
	};
}
