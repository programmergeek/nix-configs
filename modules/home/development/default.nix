{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    libgcc
    cmake
    zed-editor
    android-studio
    vscode
    code-cursor
    codex
    opencode
    pi-coding-agent
  ];
}
