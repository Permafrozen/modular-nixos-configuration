{ pkgs, ...}:

let
  vars = import ../../../core/system/variables.nix;
in
{
  environment.systemPackages = with pkgs; [
    base16-schemes
  ];

  stylix = {
    enable = true;
    autoEnable = false;
    image = /home/${vars.username}/.modular-nixos-configuration/external/theme/wallpaper/${vars.wallpaper};
    polarity = "${vars.polarity}";
     
    opacity = {
      applications = "${vars.opacity}";
      desktop = "${vars.opacity}";
      popups = "${vars.opacity}";
      terminal = "${vars.opacity}";
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/${vars.colorScheme}.yaml";

  };

  home-manager.sharedModules = [{
    stylix = {
      enable = true;
      autoEnable = false;
      image = /home/${vars.username}/.modular-nixos-configuration/external/theme/wallpaper/${vars.wallpaper};
      polarity = "${vars.polarity}";
      
      opacity = {
        applications = "${vars.opacity}";
        desktop = "${vars.opacity}";
        popups = "${vars.opacity}";
        terminal = "${vars.opacity}";
      };
      
      targets = {
        kde.enable = true;
        gnome.enable = true;
        gtk.enable = true;

        vesktop.enable = true;
        fish.enable = true;
        neovim.enable = true;

      };

      base16Scheme = "${pkgs.base16-schemes}/share/themes/${vars.colorScheme}.yaml";

    };
  }];
}
