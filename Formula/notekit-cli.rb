class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.5.8.tar.gz"
  sha256 "c4404187b3653b7682e81ebfa9133bdd580cd071369c560466fa4059aee3af38"
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
