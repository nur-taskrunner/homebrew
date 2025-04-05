#############################################################################
# WARNING: DO NOT EDIT THIS FILE MANUALLY. IT WAS CREATED USING A TEMPLATE  #
#          SEE "nurfile" for DETAILS ON HOW THIS ALL WORKS                  #
#############################################################################

class Nur < Formula
  desc "Task runner based on nu shell"
  homepage "https://github.com/nur-taskrunner/nur"
  url "https://github.com/nur-taskrunner/nur/archive/refs/tags/v0.15.1.tar.gz"
  sha256 "fde27b334ff6392e6dcf68765edcb839cfa056ae808b46d8c80290444b40e454"
  license "MIT"
  head "https://github.com/nur-taskrunner/nur.git", branch: "main"
  version "0.15.1"

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
    assert_match "0.15.1+0.103.0", pipe_output("#{bin}/nur --version", nil)
  end
end
