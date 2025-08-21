
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Gaborone";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_BW.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_BW.UTF-8";
    LC_IDENTIFICATION = "en_BW.UTF-8";
    LC_MEASUREMENT = "en_BW.UTF-8";
    LC_MONETARY = "en_BW.UTF-8";
    LC_NAME = "en_BW.UTF-8";
    LC_NUMERIC = "en_BW.UTF-8";
    LC_PAPER = "en_BW.UTF-8";
    LC_TELEPHONE = "en_BW.UTF-8";
    LC_TIME = "en_BW.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "bw";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # Install zsh and oh-my-zsh
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
	enable = true;
	custom = "$HOME/.oh-my-zsh/custom";
	theme = "powerlevel10k/powerlevel10k";
    };
  };

  environment.shells = with pkgs; [zsh];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.will = {
    isNormalUser = true;
    description = "Will";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Run unpatched dynamic binaries
  programs.nix-ld = {
	enable = true;
	libraries = with pkgs; [
	  stdenv.cc.cc
	];
  };
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    curl
    alacritty
    nodejs
    google-chrome
    cargo
    neofetch
    python311
    python311Packages.pip
    git
    gh
    gcc
  ];


  # Enable nix flakes and command-line tools
  nix.settings.experimental-features = ["nix-command" "flakes"];

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
