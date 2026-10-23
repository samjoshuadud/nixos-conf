{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua-language-server
    nil
    (typescript-language-server.overrideAttrs (o: {
      pnpmDeps = o.pnpmDeps.overrideAttrs (_: {
        outputHash = "sha256-xR/EF60lVBsITKgH7wCM2wHM46PFQevD51KfCENSUH4=";
      });
    }))
    vscode-langservers-extracted   # html, css, json, eslint
    basedpyright
    gopls
    bash-language-server
    dockerfile-language-server-nodejs
    csharp-ls
  ];
}
