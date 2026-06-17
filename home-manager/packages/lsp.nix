{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Lua
    lua-language-server

    # Nix
    nil  # already in dev-tools but fine to be explicit here too

    # Web / TS / Node / React
    typescript-language-server
    vscode-langservers-extracted   # html, css, json, eslint

    # Python (FastAPI)
    basedpyright

    # Go
    gopls

    # Bash / Fish / Shell
    bash-language-server
    
    # Docker
    dockerfile-language-server-nodejs

    # C# / ASP.NET
    csharp-ls
  ];
}
