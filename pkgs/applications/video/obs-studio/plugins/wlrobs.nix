{ lib, stdenv, fetchhg
, meson, pkg-config, ninja
, wayland, obs-studio, libX11
}:

stdenv.mkDerivation {
  pname = "wlrobs";
  version = "unstable-2022-05-15";

  src = fetchhg {
    url = "https://hg.sr.ht/~scoopta/wlrobs";
    rev = "3eb154e5fe639acb1b6be7041f5d5a62f7e723dc";
    sha256 = "sha256-5b8fU31UjBQ2bEIKWfwRRZc/sMOxxmwrbWDOvO3ubQE=";
  };

  nativeBuildInputs = [ meson pkg-config ninja ];
  buildInputs = [ wayland obs-studio libX11 ];

  meta = with lib; {
    description = "An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors";
    homepage = "https://hg.sr.ht/~scoopta/wlrobs";
    maintainers = with maintainers; [ grahamc V ];
    license = licenses.gpl3Plus;
    platforms = [ "x86_64-linux" ];
  };
}
