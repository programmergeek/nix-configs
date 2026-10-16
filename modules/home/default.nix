{
  inputs,
  username,
  ...
}:

{
  imports = [
    ./desktop/hyprland
    ./programs
    ./development
    inputs.vicinae.homeManagerModules.default
  ];

  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
      environment.USE_LAYER_SHELL = 1;
    };
  };

  systemd.user.services.vicinae.Service.Environment = [ "QSG_RHI_BACKEND=vulkan" ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };
}
