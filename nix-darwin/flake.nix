{
  description = "configuration flake for my system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
    let
      configuration = { pkgs, ... }: {

        # Setup node version 
        system.activationScripts.fnm = {
          text = ''
            # Check if the default Node version is installed
            if [ -z "$(fnm list | grep '^v19')" ]; then
              # Install and use the default Node version
              fnm install 19
              fnm default 19
            fi
          '';
          deps = [ ];
        };

        services.nix-daemon.enable = true;
        nix.settings.experimental-features = "nix-command flakes repl-flake";
        nix.settings.extra-nix-path = "nixpkgs=flake:nixpkgs";

        programs.zsh.enable = true;
        system.configurationRevision = self.rev or self.dirtyRev or null;
        system.stateVersion = 4;
        nixpkgs.hostPlatform = "aarch64-darwin";
        nixpkgs.config.allowUnfree = true;

        # Allow compilation of x86_64-darwin packages on aarch64-darwin.
        nix.extraOptions = ''
          extra-platforms = x86_64-darwin aarch64-darwin
        '';

        # Set user information
        users.users.bailycase = {
          name = "bailycase";
          home = "/Users/bailycase";
        };
      };
    in
    {
      darwinConfigurations."Bailys-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        system = "aaarch64-darwin";
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          config.allowUnfree = true;
          overlays = [
            (import ./overlays/raycast.nix)
          ];
        };

        modules = [
          ./modules/darwin
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.bailycase.imports = [
                ./modules/home-manager
              ];
            };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."Bailys-MacBook-Pro".pkgs;
    };
}
