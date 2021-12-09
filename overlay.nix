self: super:

with super.lib;

let
  override = {
    # These packages will hide packages in the top level nixpkgs

    # TODO: Re-enabled once we have hydra.
    # Swift is not included in the unstable overlay to reduce extra swift builds.
    # swift = self.callPackage ./pkgs/swift { };
  };
in {
  replitPackages = rec {
    # Any other packages should go in the replitPackages namespace
    jdt-language-server = self.callPackage ./pkgs/jdt-language-server { };
    replbox = self.callPackage ./pkgs/replbox { };

    # The override packages are injected into the replitPackages namespace as
    # well so they can all be built together
  } // override;
} // override

