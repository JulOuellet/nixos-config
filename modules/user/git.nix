{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Julien ouellet";
    userEmail = "julienouellet@iusevimbtw.com";
    extraConfig = {
      pull.rebase = false;
      init.defaultBranch = "main";
    };
  };
}
