class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "c762d29c4e15612c440b7b50e080cce9df01e8f3212f3d4942201995c3419a86"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    bin.install "reminderkit"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/reminderkit help 2>&1")
  end
end
