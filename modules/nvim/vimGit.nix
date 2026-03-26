{
	den.aspects.vimGit.vim= {
		git.gitsigns = {
			enable = true;
			setupOpts = {
				signs = {
					add.text = "+┃";
					change.text = "~┃";
					delete.text = "-┃";
					topdelete.text = "-┃";
					changedelete.text = "~┃";
					untracked.text = "?┃";
				};
				signs_staged = {
					add.text = "+┃";
					change.text = "~┃";
					delete.text = "-┃";
					topdelete.text = "-┃";
					changedelete.text = "~┃";
					untracked.text = "?┃";
				};
				signs_staged_enable = true;
			};
		};

		git.git-conflict = {
			enable = true;
		};

		# gitignore plugin currently not available

		utility.diffview-nvim = {
			enable = true;
			setupOpts = {
				view.merge_tool.layout = "diff3_mixed";
			};
		};
	};
}
