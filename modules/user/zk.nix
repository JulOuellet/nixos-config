{
  config,
  pkgs,
  ...
}: {
  programs.zk = {
    enable = true;

    settings = {
      notebook = {
        dir = "~/notes";
      };
    };
  };
}
