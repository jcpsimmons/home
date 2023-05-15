{ homeDirectory
, pkgs
, stateVersion
, system
, username
}:

let
  packages = import ./packages.nix { inherit pkgs; };
in
{
  home = {
    inherit homeDirectory packages stateVersion username;

    shellAliases = {
      reload-home-manager-config = "home-manager switch --flake ${builtins.toString ./.}";
    };

    sessionVariables = {
      EDITOR = "code --wait";
      NIX_PATH = "$HOME/.nix-defexpr/channels:$NIX_PATH";
    };

    file = {
      ".config/nvim" = {
        recursive = true;
        source = pkgs.fetchFromGitHub {
          owner = "AstroNvim";
          repo = "AstroNvim";
          rev = "v3.15.3";
          sha256 = "050k20k7rrm2zp232iynkai5wbkb44d4ib19vn360cby80pljz4f";
        };
      };
      ".itermconfig.json".source = ./resources/iterm-profile.json;
      ".config/i3/config".source = ./resources/i3-config;
      ".config/terminator/config".source = ./resources/terminator-config;
      ".config/polybar/launch.sh" = {
        source = ./resources/polybar-launch.sh;
        executable = true;
      };
      ".config/polybar/config.ini".source = ./resources/polybar-config.ini;
      ".config/i3/launch_rofi.sh" = {
        executable = true;
        text = ''
          #!${pkgs.zsh}/bin/zsh
          rofi -show-icons -sidebar-mode -show drun
          echo test > ~/testfile.txt
        '';
      };
    };

  };

  fonts.fontconfig.enable = true;

  nixpkgs = {
    config = {
      inherit system;
      allowUnfree = true;
      allowUnsupportedSystem = true;
      experimental-features = "nix-command flakes";
    };
  };



  programs = import ./programs.nix;
}
