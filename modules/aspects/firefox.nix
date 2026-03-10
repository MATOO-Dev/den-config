{
	den.aspects.firefox.nixos ={
		environment.sessionVariables.MOX_ENABLE_WAYLAND = 1;
	};

	den.aspects.firefox.homeManager = { lib, ... }: {
		programs.firefox = {
			enable = true;
			# languagePacks = [ "en-US" ];
			policies = {
				# AppAutoUpdate = false;
				# BackgroundAppUpdate = false;
				# DisableFirefoxStudies = true;
				# DisableTelemetry = true;
				# DisablePasswordReveal = true;
				# DisplayMenuBar = "never";
				# DontCheckDefaultBrowser = true;
				# HardwareAcceleration = true;
				# OfferToSaveLogins = false;
				# DefaultDownloadDirectory = "\${home}/Downloads";

				ExtensionSettings = let
					# mox-ext = name: "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
					foo = name: uuid: {
						name = uuid;
						value = {
							install_url = "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
							installation_mode = "force_installed";
							default_area = "menupanel";
							blocked_install_message = "blocked";
						};
					};
				in lib.listToAttrs [
					(foo "ublock-origin" "uBlock0@raymondhill.net")
				];
				# {
				# 	"*" = {
				# 		# installation_mode = "blocked";
				# 		installation_mode = "force_installed";
				# 		allowed_types = [ "extension" ];
				# 		updates_disabled = true;
				# 	};
				# 	# increase volume up to 600 %
				# 	# "600-sound-volume".install_url = mox-ext "600-sound-volume";
    #                 # remove tracking parameters from urls
				# 	# "clear-urls" = {
				# 	# 	install_url = mox-ext "clearurls";
				# 	# 	private_browsing = true;
				# 	# };
    #                 # automatically decline cookie popups
				# 	# "consent-o-matic".install_url = mox-ext "consent-o-matic";
				# 	# remove cookies for the current site
				# 	# "cookie-remover".install_url = "cookie-remover";
				# 	# dark mode overrides for all pages
				# 	# "dark-reader" = {
				# 	# 	install_url = "darkreader";
				# 	# 	private_browsing = true;
				# 	# };
				# 	# various additional youtube settings
				# 	# "enhancer-for-youtube".install-url = "enhancer-for-youtube";
				# 	# export open tabs as link list
				# 	# "export-tabs-urls".install_url = "export-tabs-urls-and-titles";
				# 	# redirect to better wikis
				# 	# "indie-wiki-buddy".install_url = "indie-wiki-buddy";
				# 	# open list of urls
				# 	# "open-multiple-urls".install_url = "open-multiple-urls";
				# 	# block hidden trackers
				# 	# "privacy-badger".install_url = "privacy-badger17";
				# 	# password manager
				# 	# "proton-pass".install_url = "proton-pass";
				# 	# in-browser vpn integration
				# 	# "proton-vpn".install_url = "proton-vpn-firefox-extension";
				# 	# stop translating reddit pages
				# 	# "reddit-untranslate".install_url = "reddituntranslate";
				# 	# redirect to the official nixos wiki
				# 	# "redirect-nix-wiki".install_url = "redirectnixwiki";
				# 	# show shorts as regular videos
				# 	# ???
				# 	# restores the dislike feature
				# 	# "return-youtube-dislikes".install_url = "return-youtube-dislikes";
				# 	# unofficial plugin for shadertoy
				# 	# "shadertoy-unofficial-plugin".install_url = "shadertoy-unofficial-plugin";
				# 	# block youtube sponsors
				# 	# "sponsorblock".install_url = "sponsorblock";
				# 	# run custom scripts
				# 	# "tampermonkey".install_url = "tampermonkey";
    #                 # block ads and other annoying stuff
				# 	"uBlock0@raymondhill.net" = {
				# 		install_url = mox-ext "ublock-origin";
				# 		private_browsing = true;
				# 	};
				# 	# fine grained request management
				# 	# "umatrix".install_url = "umatrix";
				# 	# show scholarly articles
				# 	# "unpaywall".install_url = "unpaywall";
				# 	# spoof user agent
				# 	# "user-agent-switcher".install_url = "user-agent-string-switcher";
				# 	# vim keybinds in the browser
				# 	# "vimium".install_url = "vimium-ff";
				# 	# disable auto-dubbing for youtube
				# 	# "youtube-no-translation".install_url = "youtube-no-translation";
				# 	# block youtube shorts in feed
				# 	# "youtube-shorts-block".install_url = "youtube-shorts-block";
				# };

				# "3rdparty".Extensions = {
				# 	"xyz".adminSettings = {
				# 		# stuff
				# 	};
				# };
			};
			# profiles.matoo = {
			# 	search = {
			# 		default = "ecosia";
			# 		privateDefault = "ecosia";
			#
			# 		engines = {
			# 			google.metaData.alias = "@g";
			# 			bing.metaData.hidden = true;
			# 			duckduckgo.metaData.hidden = true;
			# 			ecosia = {
			# 				name = "Ecosia";
			# 				urls = [{ template = "https://ecosia.org/search?q={searchTerms}"; }];
			# 				icon = "https://ecosia.org/favicon.ico";
			# 			};
			# 			nix-packages = {
			# 				name = "Nix package search";
			# 				urls = [{ template = "https://search.nixos.org/packages?query={searchTerms}"; }];
			# 				icon = "https://nixos.org/favicon.ico";
			# 				definesAliases = [ "@np" ];
			# 			};
			# 			nix-options = {
			# 				name = "Nix option search";
			# 				urls = [{ template = "https://search.nixos.org/options?query={searchTerms}"; }];
			# 				icon = "https://nixos.org/favicon.ico";
			# 				definesAliases = [ "@no" ];
			# 			};
			# 			nixos-wiki = {
			# 				name = "NixOS wiki";
			# 				urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
			# 				icon = "https://wiki.nixos.org/favicon.ico";
			# 				definesAliases = [ "@nw" ];
			# 			};
			# 			mynixos = {
			# 				name = "MyNixOS";
			# 				urls = [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
			# 				icon = "https://mynixos.com/favicon.ico";
			# 				definesAliases = [ "@ns" ];
			# 			};
			# 		};
			# 	};
			# };
		};
	};
}



# # 600 % sound volume # increase volume up to 600 %
# clearurls # remove tracking parameters from URLs
# consent-o-matic # automatically decline cookie popups
# # cookie remover
# darkreader # dark mode overrides
# enhancer-for-youtube # various additional youtube settings
# export-tabs-urls-and-titles # export open tabs as link list
# indie-wiki-buddy # redirect to better wikis
# # open multiple urls
# privacy-badger # block hidden trackers
# proton-pass # password manager
# proton-vpn # in-browser vpn integration
# # reddit untranslate
# # redirect nix wiki
# redirect-shorts-to-youtube # show shorts as regular videos
# return-youtube-dislikes # restores the dislike feature
# # shadertoy unofficial plugin
# sponsorblock # block youtube sponsors
# tampermonkey # run custom scripts
# umatrix # fine grained request management
# unpaywall # show scholarly articles
# user-agent-string-switcher # spoof user agent
# vimium # vim keybinds in the browser
# youtube-no-translation # disable auto-dubbing for youtube
# youtube-shorts-block # block shorts in feed
