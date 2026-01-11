{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      pull.rebase = false;
      init.defaultBranch = "main";

      user = {
        name = "Julien ouellet";
        email = "julienouellet@iusevimbtw.com";
      };
    };
  };
}
