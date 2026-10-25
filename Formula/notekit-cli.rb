class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.5.89.tar.gz"
  sha256 "90cdca8c74a676a1bd3ebf9aabe5e7e4a0259f293a10fc2900e9ecfb022bec6d"
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
