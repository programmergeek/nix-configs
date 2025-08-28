{ pkgs, ... }: {
    imports = [
	./browsers.nix
    ];
    home.packages = with pkgs; [
	gimp3
	blender
	davinci-resolve
	gparted
	google-chrome
	vesktop
	spotify
	vscode
	code-cursor
	ghostty
	btop
	cmake
    ];
}
