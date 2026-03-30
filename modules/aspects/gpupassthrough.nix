{
	den.aspects.gpupassthrough.nixos = {
		# requires amd-vi enabled in bios
		boot.initrd.kernelModules = [
			"vfio_pci"
			"vfio"
			"vfio_iommu_type1"
			"amdgpu"
		];

		boot.kernelParams = [
			"amd_iommu=on"
			"vfio-pci.ids=1002:15bf"
		];
	};
}
