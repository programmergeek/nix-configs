# Nix configuration

This flake defines the `nixos` host and its Home Manager configuration.

## Layout

```text
.
├── flake.nix                 # Inputs and configuration wiring
├── hosts/
│   └── nixos/                # Machine-specific system and hardware settings
├── modules/
│   ├── nixos/                # Reusable NixOS modules
│   └── home/                 # Home Manager modules and user configuration
└── rebuild.sh                # Rebuild the nixos flake output
```

Desktop services that affect the whole machine live in `modules/nixos/desktop`.
System-wide packages live in `modules/nixos/packages.nix`.
User-session configuration, applications, and development tools live in
`modules/home`. The files under `modules/home/desktop/hyprland/sage` are kept
together as the in-progress Sage desktop configuration.

Run `./rebuild.sh` to apply the configuration. The script uses a `path:` flake
reference so newly reorganized files are included before they are committed.
