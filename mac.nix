{ config, pkgs, lib, ... }: {
  imports = [
    #./karabiner.nix
    #./yabai.nix
    #./spacebar.nix
    #./alacritty.nix
    ./gcornut.nix
  ];

  programs = {
    zsh = {
      initExtraBeforeCompInit = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
        eval "$(starship init zsh)"
      '';
    };
  };
}
