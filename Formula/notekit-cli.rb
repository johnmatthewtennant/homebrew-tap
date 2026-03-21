class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.5.51.tar.gz"
  sha256 "bd75c36af6231b3eabf3a9688591ea01e4e2eccd2a329ca519f1921db6ff092e"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    bin.install "notekit"
    (prefix/".agents/skills/apple-notes").install Dir[".agents/skills/apple-notes/*"]
  end

  test do
    assert_match "notekit", shell_output("#{bin}/notekit help 2>&1")
  end
end
