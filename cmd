git add .

nix build '.#homeConfigurations.joshsimmons.activationPackage' --extra-experimental-features nix-command --extra-experimental-features flakes

./result/activate

i3-msg restart
