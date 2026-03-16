class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "76543c29d701a9ad18d0f5d4096e37a735379e3e45990f6d211f57784f19713d"
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
