{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  time.timeZone = "Africa/Gaborone";

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

  services.xserver.xkb = {
    layout = "bw";
    variant = "";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  networking.firewall.allowedTCPPorts = [
    8000
    8081
    3000
  ];
  networking.firewall.enable = false;

  system.stateVersion = "25.05";
}
