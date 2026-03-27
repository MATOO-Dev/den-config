{
	den.aspects.vimAutocomplete.vim = {
		autocomplete.blink-cmp = {
			# appears to be bugged
			enable = true;
			friendly-snippets.enable = true;
			setupOpts = {
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
	};
}
