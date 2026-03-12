{
	den.aspects.obsidian.homeManager = {
		programs.obsidian = {
			enable = true;

			defaultSettings = {
				corePlugins = {
					"backlinks".enable = true;
					"canvas".enable = true;
					"quick-switcher".enable = true;
					"sync" = {
						enable = true;
						settings = {

						};
					};
					"templates" = {
						enable = true;
						settings = {

						};
					};
				};
				communityPlugins = {
					"banners".enable = true;
					"better-export-pdf".enable = true;
					"better-word-count".enable = true;
					"dataview".enable = true;
					"diagrams".enable = true;
					"excalidraw".enable = true;
					"iconize".enable = true;
					"kanban".enable = true;
					"link-range".enable = true;
					"mermaid-tools".enable = true;
					"multi-tag".enable = true;
					"note-refactor".enable = true;
					"omnisearch".enable = true;
					"paste-url-into-selection".enable = true;
					"pdf++".enable = true;
					"plantuml".enable = true;
					"quick-latex".enable = true;
					"recent-files".enable = true;
					"style-settings".enable = true;
					"surfing".enable = true;
					"text-extractor".enable = true;
					"typing-transformer".enable = true;
					"typst-renderer".enable = true;
					"vim-toggle".enable = true;
					"wypst".enable = true;
				};
			};

			vaults.computer_science = {
				enable = true;
				target = "computer_science";
			};
		};
	};
}
