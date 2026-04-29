{
	den.aspects.vimLanguages.vim = {pkgs, ...}: {
		lsp = {
			enable = true;
			formatOnSave = true;
			inlayHints.enable = true; # inline type annotations
			# lspSignature.enable = true; # incompatible with blink-cmp
		};

		languages = {
			enableTreesitter = true;
			enableFormat = true;
			# enableDAP = true;
		};

		treesitter = {
			fold = true;
			highlight.enable = true;
			indent.enable = true;
		};

		languages.clang = {
			enable = true;
			# cmd = {
			# 	'clangd',
			# 	'--completion-style=detailed',
			# 	'--clang-tidy',
			# 	'--function-arg-placeholders=1'
			# },
		};
		formatter.conform-nvim.setupOpts.formatters_by_ft.c = ["clang-format"];
		formatter.conform-nvim.setupOpts.formatters_by_ft.cpp = ["clang-format"];
		formatter.conform-nvim.setupOpts.formatters.clang-format.prepend_args = [
			"--style={ColumnLimit: 0, IndentWidth: 4, TabWidth: 4}"
		];

		languages.lua = {
			enable = true;
			# globals?
			# telemetry?
			# diagnostics = {
			# 	globals = { 'vim', 'nixCats' },
			# },
			# telemetry = { enabled = false },
		};

		languages.csharp = {
			enable = true;
		};

		# languages.gdscript = {
		# 	enable = true;
		# };

		# languages.gdshader = {
		# enable = true;
		# };

		# glsl_analyzer lsp currently doesnt support error checking
		languages.glsl = {
			enable = true;
		};

		languages.nix = {
			enable = true;
			extraDiagnostics.enable = true;
			# format.type = [ "nixfmt" ];
			format.type = ["alejandra"];
		};
		formatter.conform-nvim.setupOpts.formatters.nixfmt.prepend_args = ["--indent=4"];
		formatter.conform-nvim.setupOpts.formatters.alejandra.prepend_args = ["--indentation=Tabs"];

		languages.rust = {
			enable = true;
		};
		formatter.conform-nvim.setupOpts.formatters_by_ft.rust = ["rustfmt"];

		languages.typst = {
			enable = true;
			extensions.typst-concealer.enable = true;
			extensions.typst-preview-nvim.enable = true;
			# on_attach = function(client, bufnr)
			# 	vim.keymap.set("n", "<leader>tp", function ()
			# 		client:exec_cmd({
			# 			title = "Tinymist pin main file",
			# 			command = "tinymist.pinMain",
			# 			arguments = { vim.api.nvim_buf_get_name(0) },
			# 		}, { bufnr = bufnr })
			# 	end, { desc = "[T]inymist [P]in" })
			#
			# 	vim.keymap.set("n", "<leader>tu", function ()
			# 		client:exec_cmd({
			# 			title = "Tinymist unpin main file",
			# 			command = "tinymist.pinMain",
			# 			arguments = { vim.v.null },
			# 		}, { bufnr = bufnr })
			# 	end, { desc = "[T]inymist [U]npin" })
			# end,
		};

		# autocmd.typst = {
		#
		# };

		# autocmds.wrap = {
		# 	event = [ "BufReadPost" ];
		# 	pattern = [ "*.typ" "*.txt" "*.md" ];
		# 	callback = "setlocal wrap";
		# };
	};
}
