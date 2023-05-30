{
  description = "Josh's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      # Values you should modify
      username = "demoacct"; # $USER
      system = "aarch64-darwin";  # x86_64-linux, aarch64-multiplatform, etc.
      stateVersion = "22.11";

      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
          experimental-features = "nix-command flakes";
        };
      };

      homeDirPrefix = if pkgs.stdenv.hostPlatform.isDarwin then "/Users" else "/home";
      homeDirectory = "/${homeDirPrefix}/${username}";

      home = (import ./home.nix {
        inherit homeDirectory pkgs stateVersion system username;
      });
    in
    {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          home
        ];
      };
    };
}
