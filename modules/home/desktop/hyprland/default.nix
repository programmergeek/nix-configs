{
  inputs,
  pkgs,
  ...
}:
let
  hyprlandPackages = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  home.packages = with pkgs; [
    wl-clipboard
    gtk3
    gtk-layer-shell
    pango
    cairo
    awww
    dunst
    quickshell
    brightnessctl
    matugen
  ];

  programs.eww.enable = true;

  wayland.windowManager.hyprland = {
    enable = true; # enable hyprland
    package = hyprlandPackages.hyprland;
    portalPackage = hyprlandPackages.xdg-desktop-portal-hyprland; # allows apps to communicate with the compositor
    xwayland.enable = true; # enables xserver to allow x11 apps to run on wayland
    configType = "lua";
    extraConfig = builtins.readFile ./config.lua;
  };
}
