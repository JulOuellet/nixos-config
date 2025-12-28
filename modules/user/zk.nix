{
  config,
  pkgs,
  ...
}: {
  programs.zk = {
    enable = true;

    settings = {
      notebook = {
        dir = "~/zk-notebook";
      };

      note = {
        filename = ''{{format-date now "%Y%m%d%H%M"}}-{{slug title}}'';
        extension = "md";
      };
    };
  };
}
