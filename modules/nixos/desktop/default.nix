{ ... }:

{
  imports = [
    ./gnome.nix
    ./hyprland.nix
  ];

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
