{ pkgs, ... }: {
  hm = {
    home.packages = with pkgs; [
      (octaveFull.withPackages (ps: with ps; [ symbolic ]))
      geogebra6
      obsidian
      telegram-desktop
      webcord-vencord
    ];
  };
}
