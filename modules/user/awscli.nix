{
  config,
  pkgs,
  ...
}: {
  programs.awscli = {
    enable = true;
  };
}
