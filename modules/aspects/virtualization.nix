{
	den.aspects.virtualization.nixos = {...}: {
		programs.virt-manager.enable = true;
		virtualisation.libvirtd = {
			enable = true;
			qemu = {
				runAsRoot = true;
				swtpm.enable = true;
			};
		};
	};
}
