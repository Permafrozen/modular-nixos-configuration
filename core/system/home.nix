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

  # Temporary AGS config

  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # null or path, leave as null if you don't want hm to manage the config
    configDir = ../ags;

    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}
