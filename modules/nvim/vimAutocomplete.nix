{
	den.aspects.vimAutocomplete.vim = { pkgs, ... }: {
		# autocomplete.blink-cmp = {
		# 	enable = true;
		# 	friendly-snippets.enable = true;
		# 	setupOpts = {
		# 		# appears to be bugged
		# 		keymap.preset = "super-tab";
		# 		# cmdline.keymap.preset = "super-tab";
		# 		# completion.documentation.auto_show = true;
		# 		# completion.list.selection.auto_insert = false;
		# 		# signature.enabled = true;
		# 		# sources.default = [
		# 		# 	"lsp"
		# 		# 	"path"
		# 		# 	"snippets"
		# 		# 	"buffer"
		# 		# ];
		# 	};
		# };
		
		lazy.plugins."blink.cmp" = {
			package = pkgs.vimPlugins.blink-cmp;
			setupModule = "blink.cmp";
			setupOpts = {
				keymap.preset = "super-tab";
			};
			event = [ "InsertEnter" ];
		};
	};
}
