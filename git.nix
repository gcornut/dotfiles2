{ config, pkgs, lib, ... }: {
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "guillaume.cornut@lumapps.com";
    userName = "gcornut";
    aliases = {
      cm = "commit";
      ca = "commit --amend --no-edit";
      ps = "push";
      pf = "push --force-with-lease";
      st = "status -sb";
    };
    ignores = [
      ".idea" ".vs" ".vsc" ".vscode" # ide
      ".DS_Store" # mac
      "node_modules" "npm-debug.log" # npm
    ];
    extraConfig = {
      init = { defaultBranch = "main"; };
      pull = {
        ff = false;
        commit = false;
        rebase = true;
      };
      url = {
        "ssh://git@github.com" = { insteadOf = "https://github.com"; };
      };
      delta = {
        line-numbers = true;
      };
    };
  };
}
