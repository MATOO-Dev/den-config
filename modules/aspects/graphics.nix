{
    den.aspects.graphics.nixos = {
        hardware.graphics.enable = true;
        hardware.graphics.enable32Bit = true;
        services.xserver.enable = true;

        services.desktopManager.plasma6.enable = true;
    };
}
