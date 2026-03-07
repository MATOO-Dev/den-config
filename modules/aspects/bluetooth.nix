{
	den.aspects.bluetooth.nixos = { pkgs, ... }: {
		hardware.bluetooh = {
			enable = true;
			powerOnBoot = true;
		};

		environment.systemPackages = with pkgs; [
			bluetui
		];
	};
}
