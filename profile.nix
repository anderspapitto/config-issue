{ config, lib, pkgs, ... }:

with lib;

{ config.user.resourceFiles = [
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
    }
  ];
}
