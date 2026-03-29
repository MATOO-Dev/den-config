{
	den.aspects.vimTyping.vim = { pkgs, ... }: {
		# ultimate autopair currently not packaged

		comments.comment-nvim = {
			enable = true;
			setupOpts = {
				sticky = false;
			};
		};

		utility.surround = {
			enable = true;
			# dont override default keybinds with nvf's version
			useVendoredKeybindings = false;
		};

		# ultimate-autopair is currently not exposed by nvf
		lazy.plugins.ultimate-autopair-nvim = {
			package = pkgs.vimPlugins.ultimate-autopair-nvim;
			setupModule = "ultimate-autopair.nvim";
			setupOpts = {
				# { "$", "$", ft = { 'typst' } };
			};
			event = [
				"InsertEnter"
				"CmdLineEnter"
			];
		};

		# vim-move is currently not exposed by nvf
		# vimscript plugin, so use extraPlugins rather than lazy.plugins
		extraPlugins.vim-move = {
			package = pkgs.vimPlugins.vim-move;
			setup = ''
				event = "DeferredUIEnter";
			'';
		};

		# quicker is currently not exposed by nvf
		lazy.plugins.quicker-nvim = {
			package = pkgs.vimPlugins.quicker-nvim;
			setupModule = "quicker.nvim";
			setupOpts = {};
			event = [ "DeferredUIEnter" ];
		};

		# tabout is currently not exposed by nvf
		lazy.plugins.tabout-nvim = {
			package = pkgs.vimPlugins.tabout-nvim;
			setupModule = "tabout-nvim";
			setupOpts = {};
			event = [ "InsertCharPre" ];
		};

		# vim-wordmotion is currently not exposed by nvf
		# vimscript plugin, so use extraPlugins rather than lazy.plugins
		extraPlugins.vim-wordmotion = {
			package = pkgs.vimPlugins.vim-wordmotion;
			setup = ''
				event = "DeferredUIEnter";
			'';
		};

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
