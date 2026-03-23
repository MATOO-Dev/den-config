{
	den.aspects.vimLanguages.vim = {
		languages = {
			enableTreesitter = true;
			enableFormat = true;
			enableDAP = true;
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

		languages.glsl = {
			enable = true;
		};

		languages.nix = {
			enable = true;
			format.type = [ "alejandra" ];
		};

		languages.rust = {
			enable = true;
		};

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
