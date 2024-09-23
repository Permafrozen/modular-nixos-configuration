{ config, pkgs, ...}:
let
  vars = import ../../../../core/system/variables.nix;
in
{

  environment.systemPackages = with pkgs; [
    fastfetch
  ];

  home-manager.sharedModules = [{
    home.file.".config/fastfetch/config.jsonc".text = ''
    {
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "source": "~/.modular-nixos-configuration/external/theme/ascii-icon/rose.txt",
        "padding": {
            "top": 2,
            "right": 6
        }
    },

    "display": {
        "separator": " │ "
    },

    "modules": [
      "break",
      "break",
      {
                "type": "title",
                "color": {
                    "user": "32",  // = color2
                    "at": "37",
                    "host": "32"
                }
            },
            "break",
            {
                "type": "os",
                "key": "distribution   ",
                "keyColor": "33",
            },
            {
                "type": "kernel",
                "key": "linux kernel   ",
                "keyColor": "33",
            },
            {
                "type": "packages",
                "format": "{} (nix)",
                "key": "packages       ",
                "keyColor": "33",  
              },
              {
                  "type": "shell",
                  "key": "unix shell     ",
                  "keyColor": "33", 
              },
              {
                  "type": "terminal",
                  "key": "terminal       ",
                  "keyColor": "33", 
              },
              {
                  "type": "wm",
                  "format": "{} ({3})",
                  "key": "window manager ",
                  "keyColor": "33", 
              },
              "break",
              {
                  "type": "colors",
                  "symbol": "circle",
              },
              "break",
              "break",
          ]
      }
    '';
  }];
}
