# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      # assuming /boot is the mount point of the  EFI partition in NixOS (as the installation section recommends).
      #efiSysMountPoint = "/boot";
    };
#     grub = {
#       # despite what the configuration.nix manpage seems to indicate,
#       # as of release 17.09, setting device to "nodev" will still call
#       # `grub-install` if efiSupport is true
#       # (the devices list is not used by the EFI grub install,
#       # but must be set to some value in order to pass an assert in grub.nix)
#       devices = [ "nodev" ];
#       efiSupport = true;
#       enable = true;
#     };
  };


  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "dnsmasq";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Asia/Colombo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  programs.partition-manager.enable = true;
  programs.kdeconnect.enable = true;


  users.users.inomal = {
    isNormalUser = true;
    description = "Mayura Inomal";
    initialPassword = "nixos";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "input" ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.plasma-browser-integration
      kdePackages.kget

      #  thunderbird
    ];
  };

  # enabling ntfs
  boot.supportedFilesystems = [ "ntfs" ];

  nix.settings.trusted-users = [ "inomal" ];

  virtualisation.libvirtd.enable = true;

  # To install docker, add the following to your your NixOS configuration:
  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    data-root = "/home/inomal/docker";
  };

  # To make sure some docker containers are running as systemd services, you can use 'oci-containers':

  #   virtualisation.oci-containers = {
  #     backend = "docker";
  #     containers = {
  #       foo = {
  #         # ...
  #       };
  #     };
  #   };

  services.touchegg.enable = true;
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

    # Flakes clones its dependencies through the git command,
    # so git must be installed first
    git
    vim
    wget
    btrfs-progs
    fprintd
    touchegg
    #libsForQt5.krohnkite
  ];
  environment.etc."xdg/touchegg/touchegg.conf".text = "<touchégg></touchégg>";

  # fingerprint setup
  services.fprintd = {
    enable = true;
    tod.enable = true;
    tod.driver = pkgs.libfprint-2-tod1-elan;
  };
  security.pam.services.login.fprintAuth = true;


  ########### Needed fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    wineWowPackages.fonts
    corefonts
    vistafonts
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;






  services.flatpak = {
    enable = true;
    remotes = pkgs.lib.mkOptionDefault [{
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };

    packages = [
      "com.st.STM32CubeIDE"
    ];

    # overrides = {
    #   global = {
    #     # Force Wayland by default
    #     Context.sockets = [ "wayland" "!x11" "!fallback-x11" ];

    #     Environment = {
    #       # Fix un-themed cursor in some Wayland apps
    #       XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

    #       # Force correct theme for some GTK apps
    #       GTK_THEME = "Adwaita:dark";
    #     };
    #   };
    # };
  };




  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set the default editor to vim
  environment.variables.EDITOR = "vim";
  environment.sessionVariables = {
    #   XDG_DATA_HOME = "$HOME/.local/share";
    #   XDG_CONFIG_HOME = "$HOME/.local/config";
    #   XDG_CACHE_HOME = "$HOME/.local/cache";

    NIXOS_OZONE_WL = "1";
  };

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
    libraries = with pkgs; [
    #   cudaPackages.cutensor
    #   cudaPackages.nvidia_fs
    #   cudaPackages.libcurand
    #   cudaPackages.libcufile

    #   cudaPackages.libcublas
    #   cudaPackages.cuda_cccl

    #   cudaPackages.cuda_cupti
    #   stdenv.cc
      libGLU
      libGL
      xorg.libXi
      xorg.libXmu
    #   freeglut
    #   xorg.libXext
      xorg.libX11
      
    #   xorg.libXv
    #   xorg.libXrandr

    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
