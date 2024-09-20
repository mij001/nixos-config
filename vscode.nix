{ config, lib, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.debugpy
      continue.continue
      sourcery.sourcery
      jdinhlife.gruvbox
      dart-code.flutter
      visualstudioexptteam.intellicode-api-usage-examples
      llvm-vs-code-extensions.vscode-clangd
      _13xforever.language-x86-64-assembly
      shd101wyy.markdown-preview-enhanced
      ms-toolsai.vscode-jupyter-slideshow
      ms-vscode.cpptools-extension-pack
      ms-vscode.cpptools-extension-pack
      # installed "nixpkgs-fmt" in home manager config to get formatting
    ];
  };
}
