{
    den.aspects.vimAutocomplete.vim =
        { pkgs, ... }:
        {
            autocomplete.blink-cmp = {
                enable = true;
                friendly-snippets.enable = true;
				# appears to be bugged, none of these are applied
                setupOpts = {
					keymap.preset = "super-tab";
                    cmdline.keymap.preset = "super-tab";
                    completion.documentation.auto_show = true;
                    completion.list.selection.auto_insert = false;
                    signature.enabled = true;
                    sources.default = [
                    	"lsp"
                    	"path"
                    	"snippets"
                    	"buffer"
                    ];
                };
            };

            # appears to break tiny-inline-diagnostic
            # lazy.plugins."blink.cmp" = {
            #     package = pkgs.vimPlugins.blink-cmp;
            #     setupModule = "blink.cmp";
            #     setupOpts = {
            #         keymap.preset = "super-tab";
            #     };
            #     event = [ "InsertEnter" ];
            # };
        };
}
