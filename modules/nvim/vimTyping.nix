{
	den.aspects.vimTyping.vim = {
		# ultimate autopair currently not packaged

		comments.comment-nvim = {
			enable = true;
			setupOpts = {
				sticky = false;
			};
		};

		utility.surround = {
			enable = true;
			# dont override default keybinds
			useVendoredKeybindings = false;
		};

		# vim-move currently not packaged

		# quicker currently not packaged

		# tabout currently not packaged

		# vim-wordmotion currently not packaged

		utility.undotree = {
			enable = true;
		};

		keymaps = [
			{
				mode = "n";
				key = "<leader>ut";
				action = ''
					function()
						vim.cmd.UndotreeToggle()
						vim.cmd.UndotreeFocus()
					end
				'';
				lua = true;
				desc = "[U]ndotree [T]oggle";
			}
		];
	};
}
