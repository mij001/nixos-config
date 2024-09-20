{ config, pkgs, ... }:

{

  home.username = "inomal";
  home.homeDirectory = "/home/inomal";

  imports = [ ./starship.nix ./vscode.nix ./ranger.nix ./flameshot.nix ./plasma-conf.nix ./brave.nix ];

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  #   xresources.properties = {
  #     "Xcursor.size" = 16;
  #     "Xft.dpi" = 172;
  #   };

  programs.git = {
    enable = true;
    userName = "Inomal";
    userEmail = "no@tell.lol";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };


  # programs = {
  #   direnv = {
  #     enable = true;
  #     enableBashIntegration = true; # see note on other shells below
  #     nix-direnv.enable = true;
  #   };

  #   zsh.enable = true; # see note on other shells below
  # };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    distrobox
    boxbuddy
    qdirstat
    cudatoolkit
    linuxPackages.nvidia_x11

    neofetch
    wget
    # brave
    qemu
    virt-manager
    papirus-icon-theme
    python3
    poetry
    bottles

    #gparted
    vlc
    ghidra
    ghidra-extensions.machinelearning
    libreoffice-qt6-fresh
    usbutils
    tldr
    discord
    obsidian
    qbittorrent
    nerdfonts
    zoom-us

    remmina
    cargo
    openssh
    openssl
    killall
    whatsapp-for-linux
    bison
    flex
    fontforge
    makeWrapper
    pkg-config
    gnumake
    gcc
    libiconv
    autoconf
    automake
    libtool
    gcc
    gsettings-desktop-schemas

    #python311Packages.tensorflowWithCuda
    neofetch
    nnn # terminal file manager
    kicad

    # archives
    zip
    xz
    unzip
    p7zip
    nixpkgs-fmt

    # utils
    ripgrep # recursively searches directories for a regex pattern
    #     jq # A lightweight and flexible command-line JSON processor
    #     yq-go # yaml processor https://github.com/mikefarah/yq
    #     eza # A modern replacement for ‘ls’
    #     fzf # A command-line fuzzy finder

    # networking tools
    #     mtr # A network diagnostic tool
    #     iperf3
    #     dnsutils  # `dig` + `nslookup`
    #     ldns # replacement of `dig`, it provide the command `drill`
    #     aria2 # A lightweight multi-protocol & multi-source command-line download utility
    #     socat # replacement of openbsd-netcat
    #     nmap # A utility for network discovery and security auditing
    #     ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    #     cowsay
    file
    which
    wireshark
    tree
    btop
    fzf
    rclone
    rclone-browser
    #     gnused
    #     gnutar
    #     gawk
    #     zstd
    #     gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    #     hugo # static site generator
    #     glow # markdown previewer in terminal
    #
    #     btop  # replacement of htop/nmon
    #     iotop # io monitoring
    #     iftop # network monitoring
    #
    #     # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    #     ethtool
    pciutils
    gns3-gui
    tree
    # motrix
    # lspci
    #     usbutils # lsusb
  ];


  #   services.gns3-server = {
  #     enable = true;
  #     auth.user = "inomal";
  #
  #   };


  # services.fusuma = {
  #   enable = true;
  #   extraPackages = with pkgs; [coreutils-full ydotool];
  #   settings = {
  #     threshold = {
  #       swipe = 0.1;
  #     };
  #     interval = {
  #       swipe = 0.7;
  #     };
  #     swipe = {
  #       "3" = {
  #         begin.command = "ydotool keydown Alt";
  #         right.update = {
  #           command = "ydotool key Tab";
  #           interval = "5";
  #         };
  #         left.update = {
  #           command = "ydotool key Shift+Tab";
  #           interval = "5";
  #         };
  #         end.command = "ydotool keyup Alt";
  #         };
  #     };
  #   };
  # };
  # basic configuration of git, please change to your own

  /*
      wayland.windowManager.hyprland = {
      enable = true;
      settings = {home.pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 16;
      };

      gtk = {
      enable = true;

      theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
      };

      iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
      };

      font = {
      name = "Sans";
      size = 11;
      };
      };
       "$mod" = "SUPER";
      bind =
      [

      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

      };
    };*/


  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  #   programs.alacritty = {
  #     enable = true;
  #     # custom settings
  #     settings = {
  #       env.TERM = "xterm-256color";
  #       font = {
  #         size = 12;
  #         draw_bold_text_with_bright_colors = true;
  #       };
  #       scrolling.multiplier = 5;
  #       selection.save_to_clipboard = true;
  #     };
  #   };


  # starship - an customizable prompt for any shell

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    #autosuggestion.highlight = "fg=#ff00ff,bg=cyan,bold,underline";
    syntaxHighlighting.enable = true;

    syntaxHighlighting.highlighters = [
      "main"
      "brackets"
      "pattern"
      "cursor"
      "regexp"
      "root"
      "line"
    ];

    shellAliases = {
      /*k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
        urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";*/

      la = "ls -a";
      ll = "ls -l";
      lll = "ls -la";
      nbld = "sudo nixos-rebuild switch";
      hbld = "home-manager switch";
      ngc = "nix store gc; nix store optimise";
      ngcall = "sudo nix-collect-garbage -d; nix store gc; nix store optimise";
      #z = "zoxide";
    };
  };

  programs.kitty = {
    enable = true;
    font.name = "Fira Fons sans";
    shellIntegration.enableZshIntegration = true;
    theme = "Obsidian";

    settings = {
      background_opacity = "0.9";
    };
  };

  programs.neovim = {
    enable = true;
  };


  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  #   wayland.windowManager.hyprland = {
  #     enable = true;
  #   };
  #
  #   wayland.windowManager.hyprland.settings = {
  #   decoration = {
  #     shadow_offset = "0 5";
  #     "col.shadow" = "rgba(00000099)";
  #   };
  #
  #   "$mod" = "SUPER";
  #
  #   bindm = [
  #     # mouse movements
  #     "$mod, mouse:272, movewindow"
  #     "$mod, mouse:273, resizewindow"
  #     "$mod ALT, mouse:272, resizewindow"
  #   ];
  # };



  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
