final: prev:
{
  raycast = prev.raycast.overrideAttrs (oldAttrs: rec {
    version = "1.70.0";
    src = prev.fetchurl {
      name = "Raycast-${version}.dmg";
      url = "https://releases.raycast.com/releases/1.70.0/download?build=universal";
      hash = "sha256-BbBnBcSCC/fw6weXVxCjbxREc9ZN+co2aPX/16Zf0M4=";
    };
  });
}
