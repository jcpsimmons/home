{ pkgs }:

let
  nixTools = with pkgs; [
    cachix
    lorri
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

    #flakes
    (builtins.getFlake "github:jcpsimmons/prsearch/e8920022e247c3c813851bb8e61139cd958101a3").packages."${pkgs.system}".default
  ];
in
nixTools
