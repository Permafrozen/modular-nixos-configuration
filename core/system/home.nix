{ inputs, config, pkgs, ... }:

let
  vars = import ./variables.nix;
in
{
  # Information what to manage
  home.username = vars.username;
  home.homeDirectory = "/home/${vars.username}";

  # Home Manager release for this config, do not change without reading release notes!!!
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
 
}
