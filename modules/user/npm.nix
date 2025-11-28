{
  config,
  pkgs,
  ...
}: let
  npmGlobalDir = "${config.home.homeDirectory}/.npm-global";
in {
  # We use npm to install global NPM packages in the home directory.
  # This is sometimes required for fast-moving JavaScript tools hat are outdated in the official Nixpkgs.

  # Install a tool with `npm install -g <tool>`.
  # Update a tool with `npm update -g <tool>`.
  # Uninstall a tool with `npm uninstall -g <tool>`.
  # List installed tools with `npm list -g --depth=0`.
  # Nuke the whole npm global directory with `rm -rf ~/.npm-global`.

  home.packages = with pkgs; [
    nodejs_22
  ];

  home.file.".npmrc".text = ''
    prefix=${npmGlobalDir}
  '';

  home.sessionPath = ["${npmGlobalDir}/bin"];

  programs.zsh.initExtra = ''
    export PATH="$HOME/.npm-global/bin:$PATH"
  '';
}
