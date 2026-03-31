{
    den.aspects.defaultapps.home-manager = {
        xdg.mimeApps = {
            enable = true;
            # types can be found using 'file --mime-type -b <file>`
            # todo: use writeShellScriptBin to make a simple binary for this
            defaultApplications = {
                "applications/pdf" = "evince.desktop";
            };
        };
    };
}
