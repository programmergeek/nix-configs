{pkgs, ...}: {
    services.xserver.desktopManager.gnome.enable = true;

    environment.systemPackages = with pkgs; [
	gnome-tweaks
    ];
}
