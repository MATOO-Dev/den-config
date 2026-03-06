{ den, ... }:
{
	den.base.user = { user, lib, ... }:
	{
		# default classes for all users
		config.classes = lib.mkDefault [ 
			"homeManager" # uses home manager
			"lp" # printing
			"scanner" # scanning
		];

		options.mainGroup = lib.mkOption { default = user.userName; };
	};
}
