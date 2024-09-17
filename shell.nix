with import <nixpkgs> { };
let
  rust-overlay = builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz";
  pkgs = import <nixpkgs> {
    overlays = [(import rust-overlay)];
  };
  toolchain = pkgs.rust-bin.fromRustupToolchainFile ./rust_toolchain.toml;
in
  pkgs.mkShell {
    packages = [
      toolchain
    ];
  buildInputs = [
    darwin.apple_sdk.frameworks.Security
    pkg-config
    openssl
  ];
}
