{
  description = "Cross-platform system-wide package installation";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { 
          inherit system;
          config = {
            allowUnfree = true;
            allowUnsupportedSystem = true;
          };
        };
      in
      {
        packages.default = pkgs.buildEnv {
          name = "standard";
          paths = with pkgs; [
            # Common packages for all systems
            git
            vim
            neofetch
            cowsay
            bat
            fzf
            bitwarden-cli
            # Add more common packages here
          ] ++ (if pkgs.stdenv.isDarwin then [
            # macOS-specific packages
            hello
          ] else if pkgs.stdenv.isLinux then [
            # Linux-specific packages
            #vscode
            #firefox
            xclip
            xsel
          ] else []);
        };
      });
}
