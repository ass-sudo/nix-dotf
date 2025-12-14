{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "user"; 
    userEmail = "email";

  };
}
