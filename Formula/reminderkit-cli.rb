class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.5.56.tar.gz"
  sha256 "8c94815717c6f3a8c4d259da0393b6dc51ffcfb9e32883c90e77b414eb496457"
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
