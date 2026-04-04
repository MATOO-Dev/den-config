{ inputs, ... }:
{
    den.aspects.theming.homeManager =
        { pkgs, ... }:
        {
            imports = [ inputs.stylix.homeModules.stylix ];
            stylix = {
                enable = true;
                polarity = "dark";
                autoEnable = false;
                base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
                targets = {
                    vesktop.enable = true;
                    gtk.enable = true;
                    qt.enable = true;
                };
            };
        };
}
