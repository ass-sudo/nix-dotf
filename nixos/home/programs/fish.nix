{
  config,
  pkgs,
  ...
}: let
  dotfilesPath = ../../dotfiles/fish;
in {
  programs.fish = {
    enable = true;

    interactiveShellInit = builtins.readFile "${dotfilesPath}/config.fish";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  home.file.".config/fish/functions" = {
    source = "${dotfilesPath}/functions";
    recursive = true;
  };
}
