{ pkgs, ... }:

{
  imports = [
    ./browsers.nix
    ./cli-apps.nix
    ./terminal.nix
  ];

  home.packages = with pkgs; [
    gimp3
    blender
    google-chrome
    vesktop
    spotify
    spicetify-cli
    obs-studio
  ];
}
