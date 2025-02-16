{ sources ? import nix/sources.nix
, channelName ? "nixpkgs-23.05"
, channel ? sources.${channelName}
, system ? "x86_64-linux"
}:
let
  overlay = (import ./overlay.nix) {
    inherit sources channelName;
  };
in
import channel { inherit system; overlays = [ overlay ]; }
