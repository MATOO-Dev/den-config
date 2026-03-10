{
	den.aspects.browser = { inputs, ... }: {
		homeManager = { pkgs, ... }: {
			programs.firefox = {
				enable = true;
				profiles.matoo = {
					extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
						# 600 % sound volume
						clearurls # remove tracking parameters from URLs
						consent-o-matic # automatically decline cookie popups
						# cookie remover
						darkreader # dark mode overrides
						enhancer-for-youtube # various additional youtube settings
						export-tabs-urls-and-titles # export open tabs as link list
						indie-wiki-buddy # redirect to better wikis
						# open multiple urls
						privacy-badger # block hidden trackers
						proton-pass # password manager
						proton-vpn # in-browser vpn integration
						# reddit untranslate
						# redirect nix wiki
						redirect-shorts-to-youtube # show shorts as regular videos
						return-youtube-dislikes # restores the dislike feature
						# shadertoy unofficial plugin
						sponsorblock # block youtube sponsors
						tampermonkey # run custom scripts
						ublock-origin # block ads and other annoying stuff
						umatrix # fine grained request management
						unpaywall # show scholarly articles
						user-agent-string-switcher # spoof user agent
						vimium # vim keybinds in the browser
						youtube-no-translation # disable auto-dubbing
						youtube-shorts-block # block shorts in feed
					];
				};
				languagePacks = [ "en-US" ];
				preferences = {
					"xyz" = false;
				};
			};

			home.packages = with pkgs; [
				chromium # backup in case a site doesn't work with firefox
			];
		};
	};
}
