{ stdenv, fetchFromGitHub, Carbon, Cocoa, ScriptingBridge }:

stdenv.mkDerivation rec {
  pname = "spacebar";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "somdoron";
    repo = pname;
    rev = "v${version}";
    sha256 = "12xrj71f1cgc4m5qaj9ffg4lzfw6sf3i9wcwavy4b74i2zwqmvmx";
  };

  buildInputs = [ Carbon Cocoa ScriptingBridge ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/man/man1/
    cp ./bin/spacebar $out/bin/spacebar
    cp ./doc/spacebar.1 $out/share/man/man1/spacebar.1
  '';

  meta = with stdenv.lib; {
    description = "A status bar for yabai tiling window management";
    homepage = "https://github.com/somdoron/spacebar";
    platforms = platforms.darwin;
    maintainers = [ maintainers.cmacrae ];
    license = licenses.mit;
  };
}
