class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "7ebf5f178d27df775fb541efc786c0bb27f7d56f13c35e315cdd9483594d9c23"
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
