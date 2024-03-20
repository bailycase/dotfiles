{ pkgs, ... }: {
  users.users.bailycase.home = "/home/bailycase";

  imports = [
    ./packages/raycast.nix
  ];
}
