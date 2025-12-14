{
  config,
  pkgs,
  lib,
  nvf,
  ...
}: {
  home.packages = with pkgs; [
    #Rust
    rustc
    rust-analyzer
    rustfmt
    clippy
    cargo
    rustPlatform.rustLibSrc

    #C/C++
    pkg-config
    gcc
    gdb
    clang-tools
    cmake
    gnumake

    #Pascal
    fpc

    #Python
    python3
    ruff
    python3Packages.python-lsp-server
    python3Packages.black

    #program
    firefox
    waybar
    rofi
    swww
    mpvpaper
    pywal
    wpgtk
    nwg-look
    kitty
    fish
    neovim
    telegram-desktop
    gimp
    steam
    mpv
    pavucontrol
    playerctl
    cava
    fastfetch
    btop
    grim
    slurp
    wl-clipboard
    lsd
    zoxide
    dconf
    gsettings-desktop-schemas
    yazi
  ];
}
