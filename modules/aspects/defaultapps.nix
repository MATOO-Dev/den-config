{
    den.aspects.defaultapps.home-manager = { pkgs, ... }: {
		home.packages = [
			# requires file input to work
			# test if syntax is correct like this
			(pkgs.writeShellScriptBin "find-mime-type" ''
				${pkgs.file}/bin/file --mime-type -b
			'')
		];

        xdg.mimeApps = {
            enable = true;
            # types can be found using 'file --mime-type -b <file>`
            defaultApplications = {
                "applications/pdf" = "evince.desktop";
            };
        };
    };
}
