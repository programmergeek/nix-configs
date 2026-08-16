{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    fish
    ghostty
    btop
  ];

  programs.zellij.enable = true;
}
