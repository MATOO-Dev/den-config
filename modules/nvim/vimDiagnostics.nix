{
    den.aspects.vimDiagnostics.vim =
        { pkgs, ... }:
        {
            lsp.trouble = {
                enable = true;
                setupOpts = {
                    warn_no_results = false;
                    open_no_results = true;
                    focus = true;
                };
                mappings.workspaceDiagnostics = "<leader>tr";
            };

            # tiny-inline-diagnostic currently not wrapped
            lazy.plugins."tiny-inline-diagnostic.nvim" = {
                package = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
                setupModule = "tiny-inline-diagnostic";
                setupOpts = {
                    preset = "powerline";
                    options = {
                        enable_on_insert = true;
                        enable_on_select = true;
                        show_source = false;
                        multilines = {
							enabled = true;
							always_show = true;
						};
                    };
                };
				event = [ "BufEnter" ];
				keys = [{
					key = "<leader>ti";
					mode = "n";
					action = "<cmd>TinyInlineDiag toggle<cr>";
					desc = "[T]oggle [I]nline diagnostics";
				}];
            };
        };
}
