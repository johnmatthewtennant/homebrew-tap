class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a67cd8036c7a504a3b76291d10658375248af86ab0b4246236f96a93208888c6"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    bin.install "reminderkit"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/reminderkit 2>&1", 1)
  end
end
