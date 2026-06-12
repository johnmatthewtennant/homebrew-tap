class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.5.83.tar.gz"
  sha256 "5cca598e026ca313280e4e8c776ac3f8a94fe7684cdea050fc32fc3335f5c60f"
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
