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
    btop
    tmux
    terminator
    rofi
    polybar
    feh  
    # fonts 
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Meslo" "JetBrainsMono" ]; })
    google-chrome

    #flakes
    (builtins.getFlake "github:jcpsimmons/prsearch/63618ec2d04e5ae227e10588b221471e391664d1").packages."${pkgs.system}".default
  ];
in
nixTools
