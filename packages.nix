{ pkgs }:

let
  nixTools = with pkgs; [
    ponysay
    jq
    fzf
    exa
    ripgrep
    bat
    gh
    rnix-lsp
    killall
    tree
    speedtest-cli
    neovim
    cowsay
    htop
    kitty
    rofi-wayland
    catppuccin-gtk
    gtk4

    #flakes
    (builtins.getFlake "github:jcpsimmons/prsearch/63618ec2d04e5ae227e10588b221471e391664d1").packages."${pkgs.system}".default
  ];
in
nixTools
