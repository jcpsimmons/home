git add .

nix build '.#homeConfigurations.$(whoami).activationPackage' --extra-experimental-features nix-command --extra-experimental-features flakes

./result/activate
