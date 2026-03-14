class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "6fe29d891f860e68d82ac113a20db387bf1f33f9baf76f0a5cf372d825d7a65e"
  license "MIT"

  option "with-skill", "Install Claude Code skill"

  depends_on :macos

  def install
    system "make"
    bin.install "notekit"

    if build.with? "skill"
      agents_dir = File.expand_path("~/.agents/skills/apple-notes")
      claude_dir = File.expand_path("~/.claude/skills/apple-notes")
      mkdir_p agents_dir
      mkdir_p claude_dir
      cp ".agents/skills/apple-notes/SKILL.md", agents_dir
      cp ".agents/skills/apple-notes/SKILL.md", claude_dir
    end
  end

  test do
    assert_match "notekit", shell_output("#{bin}/notekit help 2>&1")
  end
end
