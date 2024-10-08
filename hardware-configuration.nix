# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "vmd" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/2207c8b0-b423-48db-adcf-4120bae5e948";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8488-F3CA";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

# windows file systems (NTFS)
 fileSystems."/win-drives/wp2" =
  {
      device = "/dev/disk/by-uuid/4EE26E4DE26E397B";
      fsType = "ntfs-3g";
      options = [ "rw" "uid=1000" ];
    };

  fileSystems."/win-drives/wp1" =
    {
      device = "/dev/disk/by-uuid/A4F61EDEF61EB092";
      fsType = "ntfs-3g";
      options = [ "rw" "uid=1000" ];
    };



  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
