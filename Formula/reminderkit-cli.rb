class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0318d8bf2e254a880a2e7c87014012a9559bd3e5b4bb6c421d486c2f43284fd2"
  license "MIT"

  option "with-skill", "Install Claude Code skill"

  depends_on :macos

  def install
    system "make"
    bin.install "reminderkit"

    if build.with? "skill"
      agents_dir = File.expand_path("~/.agents/skills/apple-reminders")
      claude_dir = File.expand_path("~/.claude/skills/apple-reminders")
      mkdir_p agents_dir
      mkdir_p claude_dir
      cp ".agents/skills/apple-reminders/SKILL.md", agents_dir
      cp ".agents/skills/apple-reminders/SKILL.md", claude_dir
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/reminderkit help 2>&1")
  end
end
