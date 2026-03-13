class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b542f569a0ca79ecc7b36a6a22c93fe47dc63bfc3c281a3ae14f8fe670c84526"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    bin.install "notekit"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/notekit 2>&1", 1)
  end
end
