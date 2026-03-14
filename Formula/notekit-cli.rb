class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "171033e5a961bccf187c7afa9d6a081ee0bf0cfa96a8a1ad0f731b862e7e0c99"
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
