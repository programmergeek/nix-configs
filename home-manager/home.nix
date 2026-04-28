{ config, pkgs, inputs, ...}:{
    imports = [
	./desktop-environments/gnome.nix
	./desktop-environments/hyprland.nix
	./programs/main.nix
	./dev-envs/main.nix
	inputs.vicinae.homeManagerModules.default
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
	zed-editor
	android-studio
	fish
	awww
	obs-studio
    ];

    services.vicinae = {
        enable = true;
	systemd = {
	    enable = true;
	    autoStart = true;
	    environment = {
		USE_LAYER_SHELL = 1;
	};
	};
    };

    home.homeDirectory = "/home/will";

    programs.zellij.enable = true;
    programs.eww.enable = true;
    home.stateVersion = "25.11";
}
