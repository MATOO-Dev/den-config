{
	den.aspects.bootloader.nixos = {...}: {
		boot.loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
	};
}
