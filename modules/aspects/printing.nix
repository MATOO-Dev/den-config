{
	den.aspects.printing.nixos = { pkgs, user, ... }: {
		# enable CUPS to print documents
		services.printing = {
			enable = true;
			drivers = with pkgs; [ hplip ];
		};

		# is this line needed if i already defined it above?
		# ill leave it commented for now and test it next time i need to print
		# HP printer driver
		# environment.systemPackages = with pkgs; [ hplip ];

		# enable scanning
		hardware.sane = {
			enable = true;
			extraBackends = [ pkgs.hplipWithPlugin pkgs.sane-airscan ];
		};

		# add these groups to all users importing this module
		users.users.${user.userName}.extraGroups = [
			"lp" # printing
			"scanner" # scanning
		];
	};
}
