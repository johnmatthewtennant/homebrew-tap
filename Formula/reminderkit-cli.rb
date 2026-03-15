class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "336e791197b2615d5c5e846b4c2d77e5cca9e4d1a750598abe63138947f18a8c"
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
