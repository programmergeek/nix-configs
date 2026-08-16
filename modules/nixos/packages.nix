{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    curl
    alacritty
    nodejs
    google-chrome
    cargo
    fastfetch
    python313
    python313Packages.pip
    git
    gh
    gcc
    pnpm
    dbeaver-bin
    gnomeExtensions.gsconnect
    neovim
    cachix
    dhcpm
    ninja
  ];
}
