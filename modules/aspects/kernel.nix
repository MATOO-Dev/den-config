{
	den.aspects.kernel.nixos = { pkgs, ... }: {
		# use newest available kernel
		boot.kernelPackages = pkgs.linuxPackages_latest;
	};
}
