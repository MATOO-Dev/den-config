{
	den.aspects.bluetooth.nixos = { pkgs, ... }: {
		hardware.bluetooth = {
			enable = true;
			powerOnBoot = true;
		};

		environment.systemPackages = with pkgs; [
			bluetui
		];
	};
}
