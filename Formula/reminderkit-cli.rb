class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.5.64.tar.gz"
  sha256 "0a7e36a90c8c1ea5daa80823e8d0d62b61a3fb33f8238a0415331cba561e21be"
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
