{
  config,
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$git_branch$git_status$character";

      add_newline = false;

      directory = {
        format = "[$path]($style) ";
        style = "bold blue";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        format = "[$symbol$branch]($style) ";
        style = "bold purple";
        symbol = " ";
      };

      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        conflicted = "[=\${count}](bold red)";
        ahead = "[⇡\${count}](bold cyan)";
        behind = "[⇣\${count}](bold cyan)";
        diverged = "[⇕⇡\${ahead_count}⇣\${behind_count}](bold cyan)";
        untracked = "[?\${count}](bold blue)";
        stashed = "[$\${count}](bold magenta)";
        modified = "[!\${count}](bold yellow)";
        staged = "[+\${count}](bold green)";
        renamed = "[»\${count}](bold cyan)";
        deleted = "[✘\${count}](bold red)";
      };

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
}
