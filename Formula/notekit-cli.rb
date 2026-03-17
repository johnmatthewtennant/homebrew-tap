class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "178efbc1d8c140d1767a48b15602d62639cecd5e87802a5031d735a57bf60d74"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    bin.install "notekit"
  end

  test do
    assert_match "notekit", shell_output("#{bin}/notekit help 2>&1")
  end
end
