{
    den.aspects.firefox.nixos = {
        environment.sessionVariables.MOX_ENABLE_WAYLAND = 1;
    };

    den.aspects.firefox.homeManager.programs.firefox = {
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
            Homepage.StartPage = "previous-session";
        };
    };
}
