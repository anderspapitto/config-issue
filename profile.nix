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
  ];

  config.systemd.services.test_script = {
    description = "this is a test";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = pkgs.writeScript "test_script" ''
        #!${pkgs.bash}/bin/bash
        set -xe
        echo hi
        env | cat
        echo hello
      '';
    };
  };
}
