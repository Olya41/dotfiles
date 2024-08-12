{ inputs, ... }: {
  imports = [
    ./apps.nix
    ./desktop.nix
    ./firefox.nix
    ./fonts.nix
    ./hardware.nix
    ./python.nix
    ./sboot.nix
    ./shell.nix
    ./unfree.nix
    ./users.nix
    ./vscode.nix
  ];

  nixcfg = {
    username = "olga";
    inherit inputs;
  };

  services.snapper.configs = {
    home = {
      SUBVOLUME = "/home";
      ALLOW_USERS = [ "olga" ];
      TIMELINE_CREATE = true;
      TIMELINE_CLEANUP = true;
    };
  };

  networking.hostName = "capybara";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "ru_RU.UTF-8";

  security.sudo = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = false;
  };

  boot = {
    plymouth.enable = true;
    loader.timeout = 0;
  };

  system.stateVersion = "24.05";
}
