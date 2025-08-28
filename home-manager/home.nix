{ config, pkgs, inputs, ...}:{
    imports = [
	./desktop-environments/gnome.nix
	./desktop-environments/hyprland.nix
	./programs/main.nix
	./dev-envs/main.nix
    ];

    home.packages = with pkgs; [ 
	neovim 
	httpie
	wl-clipboard
	unzip
	nix-index
	gtk3
	gtk-layer-shell
	pango
	cairo
	gcc
	libgcc
    ];
    programs.zellij.enable = true;

    home.stateVersion = "25.11";
}
