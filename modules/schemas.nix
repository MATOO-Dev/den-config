{ den, ... }:
{
	den.schema.user = { user, lib, ... }:
	{
		# default classes for all users
		# classes are not the same as groups!
		config.classes = lib.mkDefault [ 
			"homeManager"
		];

		options.mainGroup = lib.mkOption { default = user.userName; };
	};
}
