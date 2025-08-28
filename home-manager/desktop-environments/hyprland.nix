{inputs, pkgs, ...}:
let
    hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portal = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
in {
    wayland.windowManager.hyprland = {
	enable = true; # enable hyprland
	package = hyprland;
	portalPackage = portal; # allows apps to communicate with the compositor
	xwayland.enable = true; # enables xserver to allow x11 apps to run on wayland
    };

    programs.waybar = {
	enable = true;
    };
}
