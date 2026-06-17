{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua-language-server
    nil
    typescript-language-server
    vscode-langservers-extracted   # html, css, json, eslint
    basedpyright
    gopls
    bash-language-server
    dockerfile-language-server-nodejs
    csharp-ls
  ];
}
