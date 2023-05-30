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


    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Meslo" "JetBrainsMono" ]; })

  ];
in
nixTools
