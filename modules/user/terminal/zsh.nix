{
  config,
  pkgs,
  ...
}: {
  imports = [./starship.nix];

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "history-substring-search"
      ];
    };

    shellAliases = {
      ll = "ls -l";
      la = "ls -l -a";
      ff = "fastfetch";
    };
  };
}
