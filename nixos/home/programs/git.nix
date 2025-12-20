{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "user";
        email = "email";
      };
    };
  };
}
