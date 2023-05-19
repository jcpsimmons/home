{ pkgs, }:

let
  nixTools = with pkgs; [
    ponysay
    python311
    python311Packages.virtualenv
    python311Packages.pip
    jq
    fzf
    exa
    ripgrep
    bat
    gh
    nil # new formatter to replace rnix-lsp
    nixpkgs-fmt
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
    i3

    # nixgl wrapped stuff
    (pkgs.writeScriptBin "alacritty" ''
      #!${pkgs.stdenv.shell}
      ${pkgs.nixgl.nixGLIntel}/bin/nixGLIntel ${pkgs.alacritty}/bin/alacritty $@
    '')


    # flakes
    # cider flake (fixes breaking apple API change)
    (builtins.getFlake "github:jcpsimmons/cider-flake/e6a60324be29cbff5fe15c6b27cf0f65ecdf7046").packages."${pkgs.system}".default
    # prsearch cli
    (builtins.getFlake "github:jcpsimmons/prsearch/63618ec2d04e5ae227e10588b221471e391664d1").packages."${pkgs.system}".default
  ];
in
nixTools
