{ lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "corefonts"
      "geogebra"
      "obsidian"
      "vscode"
      "vscode-extension-ms-vscode-cpptools"
    ];
}
