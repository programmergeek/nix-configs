{ config, pkgs }: {
    
    imports = [
	./gnome/config.nix
	./hyprland/config.nix
    ];

    # Enable X server windowing system
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true; # Enable gdm display manager

    # Enable sound with pipewire
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
	enable = true;
        alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
    };
}
