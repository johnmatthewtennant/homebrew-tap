class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.5.17.tar.gz"
  sha256 "109693b09a0240748f2400818ed78dc40989c918aac5b0a3a5c11835a3b2eb6a"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    bin.install "reminderkit"
    (prefix/".agents/skills/apple-reminders").install Dir[".agents/skills/apple-reminders/*"]
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/reminderkit help 2>&1")
  end
end
