{
  pkgs,
  username,
  ...
}:

{
  imports = [
    ./desktop
    ./packages.nix
  ];

  networking.networkmanager.enable = true;
  services.printing.enable = true;

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

  environment.shells = [ pkgs.zsh ];

  users.users.${username} = {
    home = "/home/${username}";
    isNormalUser = true;
    description = "Will";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Noto Serif"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Color Emoji"
        ];
        monospace = [
          "Noto Sans Mono"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      brotli
      glib
      unixodbc
      stdenv.cc.cc
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  programs.steam.enable = true;
  qt.enable = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
