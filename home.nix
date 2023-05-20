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
      NVM_DIR = ''
        "$HOME/.nvm"
        [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
        [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
      '';
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
      ".p10k.zsh".source = ./resources/.p10k.zsh;
      ".itermconfig.json".source = ./resources/iterm-profile.json;
    };
  };

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
