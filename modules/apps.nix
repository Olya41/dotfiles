{ pkgs, ... }: {
  home-manager.users.olga = {
    home.packages = with pkgs; [
      telegram-desktop
      geogebra6
      webcord-vencord
      obsidian
      (octaveFull.withPackages (ps: with ps; [symbolic]))
    ];
  };
}
