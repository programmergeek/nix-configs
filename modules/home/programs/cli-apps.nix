{ pkgs, ... }:

{
  home.packages = with pkgs; [
    httpie
    unzip
    nix-index
  ];
}
