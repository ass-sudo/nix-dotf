{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "user";
    userEmail = "email";

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = false;
    };
  };
}
