class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "9b106125574e9f846bb8cb5e8b3ab52279c3b0e4fddf465696686f6503c296f6"
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
