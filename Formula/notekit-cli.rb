class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "3719861b7499a3e356a9e93c06cf5644e190837b320a8ab9ccf93a0dee961505"
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
