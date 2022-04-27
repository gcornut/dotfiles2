{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "zap"; # "zap" removes manually installed brews and casks
    brews = [
      #"spacebar" # macos bar alternative
      #"skhd" # keybinding manager
      #"openstackclient"
      # broken nix builds
      "starship"
      #"yabai" # tiling window manager
    ];
    casks = [
      # utilities
      "aldente" # battery management
      "bartender" # hides mac bar icons
      #"browserosaurus" # choose browser on each link
      #"karabiner-elements" # remap keyboard
      #"macfuse" # file system utilities

      "chromium"
      "firefox"
      "google-chrome"
      "google-drive"
      "meld" # folder differ
      "postman"
      "shottr" # screenshot tool
      "signal" # messenger
      "the-unarchiver"
      #"ubersicht"
      "visual-studio-code"
      "vlc" # media player
      #"eul" # mac monitoring
    ];
    taps = [
      "cmacrae/formulae" # spacebar
      "koekeishiya/formulae" # yabai
      # default
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/core"
      "homebrew/services"
    ];
  };
}
