{ pkgs }:{
    imports = [
	./desktop-environments/gnome.nix
	./desktop-environments/hyprland.nix
    ];

    home-manager.useUserPackages = true;
    home-manager.useGlobalPackages = true;
    
    home-manager.users.will = {pkgs, ...}: {
	home.packages = with pkgs; [ 
	    neovim 
	    httpie
	    wl-clipboard
	    blender
	    unzip
	    gparted
	    nix-index
	];
    programs.zellij.enable = true;

    home.stateVersion = "25.05";
  };
}
