{
	den.aspects.vimAutocomplete.vim = {
		autocomplete.blink-cmp = {
			# appears to be bugged
			enable = false;
			friendly-snippets.enable = true;
			setupOpts = {
				cmdline.keymap.preset = "super-tab";
				completion.documentation.auto_show = true;
				completion.list.selection.auto_insert = false;
				sources.default = [
					"lsp"
					"path"
					"snippets"
					"buffer"
				];
			};
		};
	};
}
