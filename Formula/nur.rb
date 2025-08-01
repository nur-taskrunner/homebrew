#############################################################################
# WARNING: DO NOT EDIT THIS FILE MANUALLY. IT WAS CREATED USING A TEMPLATE  #
#          SEE "nurfile" for DETAILS ON HOW THIS ALL WORKS                  #
#############################################################################

class Nur < Formula
  desc "Task runner based on nu shell"
  homepage "https://github.com/nur-taskrunner/nur"
  url "https://github.com/nur-taskrunner/nur/archive/refs/tags/v0.18.1.tar.gz"
  sha256 "61c978d7e8fc2e70872f73096b01cf18c66773e5da53ba50f7b53ad2096caa42"
  license "MIT"
  head "https://github.com/nur-taskrunner/nur.git", branch: "main"
  version "0.18.1"

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
    assert_match "0.18.1+0.106.1", pipe_output("#{bin}/nur --version", nil)
  end
end
