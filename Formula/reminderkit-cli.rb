class ReminderkitCli < Formula
  desc "CLI for Apple Reminders via private ReminderKit framework"
  homepage "https://github.com/johnmatthewtennant/reminderkit-cli"
  url "https://github.com/johnmatthewtennant/reminderkit-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "967d7584bc0768b976d0ea7305b7f53416202ce17f3a8da0c761c20bb7e5b94d"
  license "MIT"

  option "with-skill", "Install Claude Code skill"

  depends_on :macos

  def install
    system "make"
    bin.install "reminderkit"

    if build.with? "skill"
      (share/"skill").install ".agents/skills/apple-reminders/SKILL.md"
    end
  end

  def post_install
    if (share/"skill/SKILL.md").exist?
      agents_dir = Pathname.new(Dir.home)/".agents/skills/apple-reminders"
      claude_dir = Pathname.new(Dir.home)/".claude/skills/apple-reminders"
      agents_dir.mkpath
      claude_dir.mkpath
      cp share/"skill/SKILL.md", agents_dir/"SKILL.md"
      cp share/"skill/SKILL.md", claude_dir/"SKILL.md"
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/reminderkit help 2>&1")
  end
end
