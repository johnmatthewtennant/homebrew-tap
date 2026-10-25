class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.5.90.tar.gz"
  sha256 "3814210fb5fe7274d300e5877a3596e4df2e9e4e3f9319aa829fb6377c2f0ceb"
  license "MIT"

  depends_on :macos

  def install
    system "make", "VERSION=#{version}"
    bin.install "notekit"
    (prefix/".agents/skills/apple-notes").install Dir[".agents/skills/apple-notes/*"]
  end

  test do
    assert_match "notekit", shell_output("#{bin}/notekit help 2>&1")
  end
end
