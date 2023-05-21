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
    nil
    nixpkgs-fmt
    iterm2
    
    killall
    tree
    speedtest-cli
    neovim
    cowsay
    htop
    yabai
    sketchybar

    #flakes
    (builtins.getFlake "github:jcpsimmons/prsearch/63618ec2d04e5ae227e10588b221471e391664d1").packages."${pkgs.system}".default
  ];
in
nixTools
