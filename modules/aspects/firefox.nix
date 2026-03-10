{
	den.aspects.firefox.nixos ={
		environment.sessionVariables.MOX_ENABLE_WAYLAND = 1;
	};

	den.aspects.firefox.homeManager = { lib, ... }: {
		programs.firefox = {
			enable = true;
			languagePacks = [ "en-US" ];
			policies = {
				AppAutoUpdate = false;
				BackgroundAppUpdate = false;
				DisableFirefoxStudies = true;
				DisableTelemetry = true;
				DisablePasswordReveal = true;
				DisplayMenuBar = "never";
				DontCheckDefaultBrowser = true;
				HardwareAcceleration = true;
				OfferToSaveLogins = false;
				DefaultDownloadDirectory = "\${home}/Downloads";

				ExtensionSettings = let
					# function stolen & adjusted from github user abhinandh-s
					get-extension = slug: uuid: private: area: {
						name = uuid;
						value = {
							install_url = "https://addons.mozilla.org/firefox/downloads/latest/${slug}/latest.xpi";
							default_area = area;
							private_browsing = private;
							allowed_types = [ "extension" ];
							installation_mode = "force_installed";
							updates_disabled = true;
							blocked_install_message = "This extension's installation was blocked";
						};
					};
				in lib.listToAttrs [
					# increase volume up to 600 %
					(get-extension "600-sound-volume" "{c4b582ec-4343-438c-bda2-2f691c16c262}" false "navbar")
					# remove tracking parameters from urls
					(get-extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}" true "menupanel")
					# automatically decline cookie popups
					(get-extension "consent-o-matic" "gdpr@cavi.au.dk" true "menupanel")
					# remove cookies for the current site
					(get-extension "cookie-remover" "{3507f56d-2ef5-45c1-b6d7-5297a0ba7642}" false "menupanel")
					# dark mode overrides for all pages
					(get-extension "darkreader" "addon@darkreader.org" true "menupanel")
					# various additional youtube settings
					(get-extension "enhancer-for-youtube" "enhancerforyoutube@maximerf.addons.mozilla.org" false "menupanel")
					# export open tabs as link list
					(get-extension "export-tabs-urls-and-titles" "{17165bd9-9b71-4323-99a5-3d4ce49f3d75}" false "menupanel")
					# redirect to better wikis
					(get-extension "indie-wiki-buddy" "{cb31ec5d-c49a-4e5a-b240-16c767444f62}" false "menupanel")
					# open list of urls
					(get-extension "open-multiple-urls" "openmultipleurls@ustat.de" false "menupanel")
					# block hidden trackers
					(get-extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack" false "menupanel")
					# password manager
					(get-extension "proton-pass" "78272b6fa58f4a1abaac99321d503a20@proton.me" false "navbar")
					# in-browser vpn integration
					(get-extension "proton-vpn-firefox-extension" "vpn@proton.ch" false "menupanel")
					# stop translating reddit pages
					(get-extension "reddituntranslate" "reddit-url-redirector@kichkoupi.com" false "menupanel")
					# redirect to the official nixos wiki
					(get-extension "redirectnixwiki" "redirect-nix-wiki@undesided.me" false "menupanel")
					# restores the dislike feature
					(get-extension "return-youtube-dislikes" "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" false "menupanel")
					# block ads and other annoying stuff
					(get-extension "ublock-origin" "uBlock0@raymondhill.net" true "menupanel")
					# unofficial plugin for shadertoy
					(get-extension "shadertoy-unofficial-plugin" "{cab6fe0d-6896-4cb6-a40c-1613dd3ed8f9}" false "menupanel")
					# block youtube sponsors
					(get-extension "sponsorblock" "sponsorBlocker@ajay.app" false "menupanel")
					# run custom scripts
					(get-extension "tempermonkey" "firefox@tampermonkey.net" false "menupanel")
					# fine grained request management
					(get-extension "umatrix" "uMatrix@raymondhill.net" false "navbar")
					# show scholarly articles
					(get-extension "unpaywall" "{f209234a-76f0-4735-9920-eb62507a54cd}" true "menupanel")
					# spoof user agent
					(get-extension "user-agent-string-switcher" "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}" false "menupanel")
					# vim keybinds in the browser
					(get-extension "vimium-ff" "{d7742d87-e61d-4b78-b8a1-b469842139fa}" true "navbar")
					# disable auto-dubbing for youtube
					(get-extension "youtube-no-translation" "{9a3104a2-02c2-464c-b069-82344e5ed4ec}" false "menupanel")
					# play youtube shorts as regular videos
					(get-extension "youtube-shorts-block" "{34daeb50-c2d2-4f14-886a-7160b24d66a4}" false "menupanel")
				]; # ++

				# 	"*" = {
				# 		allowed_types = [ "extension" ];
				# 		installation_mode = "force_installed";
				# 		updates_disabled = true;
				# 		blocked_install_message = "This extension's installation was blocked";
				# 	};

				# "3rdparty".Extensions = {
				# 	"xyz".adminSettings = {
				# 		# stuff
				# 	};
				# };
			};
			profiles.matoo = {
				search = {
					default = "ecosia";
					privateDefault = "ecosia";

					engines = {
						google.metaData.alias = "@g";
						bing.metaData.hidden = true;
						duckduckgo.metaData.hidden = true;
						nix-packages = {
							name = "Nix package search";
							urls = [{ template = "https://search.nixos.org/packages?query={searchTerms}"; }];
							icon = "https://nixos.org/favicon.ico";
							definesAliases = [ "@np" ];
						};
						nix-options = {
							name = "Nix option search";
							urls = [{ template = "https://search.nixos.org/options?query={searchTerms}"; }];
							icon = "https://nixos.org/favicon.ico";
							definesAliases = [ "@no" ];
						};
						nixos-wiki = {
							name = "NixOS wiki";
							urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
							icon = "https://wiki.nixos.org/favicon.ico";
							definesAliases = [ "@nw" ];
						};
						mynixos = {
							name = "MyNixOS";
							urls = [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
							icon = "https://mynixos.com/favicon.ico";
							definesAliases = [ "@ns" ];
						};
					};
				};
			};
		};
	};
}
