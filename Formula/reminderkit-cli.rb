class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.5.62.tar.gz"
  sha256 "e8bbaa1f76ac459a0e4a63175b4480b076f5e927aa8a23e0735ca6aa234b1a97"
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
