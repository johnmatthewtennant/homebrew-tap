class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.5.60.tar.gz"
  sha256 "36794588c8cadf3f1b31f04e33fe06ca211572d38e7d46ea359842ac31f0da41"
  license "MIT"

  depends_on :macos

  def install
    system "make", "VERSION=#{version}"
    bin.install "reminderkit"
    (prefix/".agents/skills/apple-reminders").install Dir[".agents/skills/apple-reminders/*"]
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/reminderkit help 2>&1")
  end
end
