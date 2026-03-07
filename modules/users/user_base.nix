{ den, ... }:
{
	den.base.user = { user, lib, ... }:
	{
		# default classes for all users
		config.classes = lib.mkDefault [ 
			"homeManager" # uses home manager
		];

		options.mainGroup = lib.mkOption { default = user.userName; };
	};
}
