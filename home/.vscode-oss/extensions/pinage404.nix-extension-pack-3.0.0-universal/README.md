# Nix VS Code Extension Pack

Collection of extensions for Nix ecosystem (NixOS, Flake, DirEnv ...)

[![Visual Studio Marketplace Installs][vscode_marketplace_installs]][vscode_marketplace]
[![Open VSX Downloads][open_vsx_downloads]][open_vsx]

Features includes:

-   Load environment inside VSCode
-   Error reporting
-   Rename
-   Go to definition
-   Syntax highlighting
-   Comment

## Requirements

### Nix IDE

To enjoy all the features of the [Nix IDE](https://marketplace.visualstudio.com/items?itemName=jnoortheen.nix-ide) extension, it is recommended to add it to your settings:

```json
{
	"nix.enableLanguageServer": true
}
```

And have `rnix-lsp` in your environment:

```nix
{ pkgs, ... }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    rnix-lsp
  ];
}
```

Alternative: you can install only `nixpkgs-fmt` but not all features will be available

```nix
{ pkgs, ... }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nixpkgs-fmt
  ];
}
```

### DirEnv

To enjoy the [direnv](https://marketplace.visualstudio.com/items?itemName=mkhl.direnv) extension, follow the [direnv](https://direnv.net/) installation procedure

## Want to see more extension added?

Open a [MR][merge-request-url] or an [issue][issue-url] and i will to take a look

[vscode_marketplace_installs]: https://img.shields.io/visual-studio-marketplace/i/pinage404.nix-extension-pack?label=VSCode%20Marketplace%20Installs
[vscode_marketplace]: https://marketplace.visualstudio.com/items?itemName=pinage404.nix-extension-pack
[open_vsx_downloads]: https://img.shields.io/open-vsx/dt/pinage404/nix-extension-pack?label=Open%20VSX%20Registry%20Downloads
[open_vsx]: https://open-vsx.org/extension/pinage404/nix-extension-pack
[merge-request-url]: https://gitlab.com/pinage404/pinage404-vscode-extension-packs/-/merge_requests
[issue-url]: https://gitlab.com/pinage404/pinage404-vscode-extension-packs/-/issues
