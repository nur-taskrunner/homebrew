#############################################################################
# WARNING: DO NOT EDIT THIS FILE MANUALLY. IT WAS CREATED USING A TEMPLATE  #
#          SEE "nurfile" for DETAILS ON HOW THIS ALL WORKS                  #
#############################################################################

class Nur < Formula
  desc "Task runner based on nu shell"
  homepage "https://github.com/ddanier/nur"
  url "https://github.com/ddanier/nur/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "780ed02e3b1c6ebeda9129ca9921690c83201d79d5638a5cd1ec3469e69067af"
  license "MIT"
  head "https://github.com/ddanier/nur.git", branch: "main"

  livecheck do
    url :stable
    regex(/v?(\d+(?:[._]\d+)+)/i)
    strategy :github_latest
  end

  depends_on "rust" => :build
  depends_on "openssl@3"

  uses_from_macos "zlib"

  on_linux do
    depends_on "pkg-config" => :build
    depends_on "libx11"
    depends_on "libxcb"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "0.2.0", pipe_output("#{bin}/nur --version", nil)
  end
end
