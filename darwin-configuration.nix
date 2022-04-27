{ config, pkgs, lib, ... }:
let
  home-manager = builtins.fetchGit {
    url = "https://github.com/nix-community/home-manager.git";
  };
in {
  imports = [
    (import "${home-manager}/nix-darwin")
    ./modules
    ./homebrew.nix
  ];

  system.stateVersion = 4;
  environment = {
    systemPackages = with pkgs; [ vim ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      # make libgc++ available in the terminal
      #LD_LIBRARY_PATH = "${lib.makeLibraryPath [pkgs.stdenv.cc.cc]}";
    };
  };

  nixpkgs.config.allowUnfree = true;
  nix = {
    allowedUsers = [ "gcornut" ];
    package = pkgs.nix;
    #autoOptimiseStore = true; # TODO doesnt work on mac

    #gc = {
      #automatic = true;
      #user = "gcornut";
      #options = "--delete-older-than 7d";
    #};
  };

  users.users.gcornut = {
    home = "/Users/gcornut";
    shell = pkgs.zsh;
  };

  programs = {
    zsh.enable = true;
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.gcornut = import ./mac.nix;
  };

  #networking = {
    #hostName = "alucard";
    #knownNetworkServices = [ "Wi-Fi" ];
    #dns = [ "1.1.1.1" "8.8.8.8" ];
  #};

  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      nerdfonts
      corefonts
      recursive
    ];
  };
}
