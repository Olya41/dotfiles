{ pkgs, ... }: {
  nixcfg.gnome.enable = true;

  services.displayManager.autoLogin.user = "olga";

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-connections
    ])
    ++ (with pkgs.gnome; [
      gnome-maps
      gnome-music
    ]);

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "0";
  };

  environment.systemPackages = with pkgs; [
    gnome3.dconf-editor
  ];

  home-manager.users.olga.dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri-dark = "file://${../wallpaper.jpg}";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-show-seconds = true;
      show-battery-percentage = true;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
    };
  };
}
