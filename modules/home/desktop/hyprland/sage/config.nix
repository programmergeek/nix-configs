{...}:{
    wayland.windowManager.hyprland.settings = {
	"$mainMod" = "SUPER";
	"$terminal" = "alacritty";
	"$fileManager" = "nautilus";
	"$menu" = "vicinae";
	exec-once = [
	    "vicinae server"
	];
	env = [
	    "XCURSOR_SIZE,24"
	    "HYPRCURSOR_SIZE,24"
	];
	input = {
	    kb_layout = "us";
	    follow_mouse = 1;
	    sensitivity = 0;
	    touchpad.natural_scroll = true;
	    numlock_by_default = true;
	};
	general = {};
	decoration = {};
	group = {};
	animations = {};
	gesture = [
	    "3, horizontal, workspace"
	];
	bind = [
	    "$mainMod, T, exec, $terminal"
	    "$mainMod, Q, killactive"
	    "$mainMod, M, exit"
	    "$mainMod, F, exec, $fileManager"
	    "$mainMod, V, togglefloating,"
	    "$mainMod, A, exec, $menu"
	    "$mainMod, P, pseudo"
	    "$mainMod, J, togglesplit"

	    "$mainMod, left, movefocus, l"
	    "$mainMod, right, movefocus, r"
	    "$mainMod, up, movefocus, u"
	    "$mainMod, down, movefocus, d"
	    
	    "$mainMod, 1, workspace, 1"
	    "$mainMod, 2, workspace, 2"
	    "$mainMod, 3, workspace, 3"
	    "$mainMod, 4, workspace, 4"
	    "$mainMod, 5, workspace, 5"
	    "$mainMod, 6, workspace, 6"
	    "$mainMod, 7, workspace, 7"
	    "$mainMod, 8, workspace, 8"
	    "$mainMod, 9, workspace, 9"
	    "$mainMod, 10, workspace, 10"
	    "$mainMod SHIFT, 1, movetoworkspace, 1"
	    "$mainMod SHIFT, 2, movetoworkspace, 2"
	    "$mainMod SHIFT, 3, movetoworkspace, 3"
	    "$mainMod SHIFT, 4, movetoworkspace, 4"
	    "$mainMod SHIFT, 5, movetoworkspace, 5"
	    "$mainMod SHIFT, 6, movetoworkspace, 6"
	    "$mainMod SHIFT, 7, movetoworkspace, 7"
	    "$mainMod SHIFT, 8, movetoworkspace, 8"
	    "$mainMod SHIFT, 9, movetoworkspace, 9"
	    "$mainMod SHIFT, 10, movetoworkspace, 10"
	    "$mainMod, mouse:272, movewindow"
	    "$mainMod, mouse:273, resizewindow"
	    ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	    ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	    ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	    ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
	    ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
	];
	monitor = [",preferred,auto,1"];
	windowrule = [
	    "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
	    "suppressevent maximize, class:.*"
	];
    };
}
