{ config, lib, pkgs, ... }:

with lib;

let compton-inverted = lib.readFile ./compton-inverted;
    compton-noninverted = lib.readFile ./compton-noninverted;
in

{ config.user.resourceFiles = [
    { target = ".bashrc";
      text = lib.readFile ./bashrc;
    }
    { target = ".config/dunst/dunstrc";
      text = lib.readFile ./dunstrc;
    }
    { target = ".xsession";
      text = lib.readFile ./xsession;
    }
    { target = ".Xdefaults";
      text = lib.readFile ./xdefaults;
    }
    { target = ".gitconfig";
      text = lib.readFile ./gitconfig;
    }
    { target = ".compton.conf";
      text = lib.readFile ./compton.conf;
    }
    { target = ".emacs.d/init.el";
      text = lib.readFile ./init.el;
    }
    { target = ".emacs.d/lisp/my-compile.el";
      text = lib.readFile ./my-compile.el;
    }
    { target = ".i3/config";
      text = lib.readFile ./i3-config;
    }
    { target = ".i3/i3status.conf";
      text = lib.readFile ./i3status.conf;
    }
    { target = ".jackdrc";
      text = lib.readFile ./jackdrc;
    }
    { target = ".stack/config.yaml";
      text = lib.readFile ./stack-config.yaml;
    };
  ];

  config.systemd.services = {
    compton = {
      description = "Compton: the lightweight compositing manager";
      environment = { DISPLAY = ":0"; };
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.compton}/bin/compton -cCG --config /home/anders/.config/nixup/compton-noninverted";
        RestartSec = 3;
        Restart = "always";
      };
      wantedBy = [ "default.target" ];
    };

    compton-night = {
      description = "Compton: the lightweight compositing manager";
      environment = { DISPLAY = ":0"; };
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.compton}/bin/compton -cCG --config /home/anders/.config/nixup/compton-inverted";
        Restart = "always";
      };
      conflicts = [ "compton.service" ];
    };

    dropbox = {
      description = "Dropbox";
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.dropbox}/bin/dropbox";
        RestartSec = 3;
        Restart = "always";
      };
      wantedBy = [ "default.target" ];
    };
  };
}
