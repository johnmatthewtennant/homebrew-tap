class NotekitCli < Formula
  desc "CLI for Apple Notes via private NotesShared framework"
  homepage "https://github.com/johnmatthewtennant/notekit-cli"
  url "https://github.com/johnmatthewtennant/notekit-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "171033e5a961bccf187c7afa9d6a081ee0bf0cfa96a8a1ad0f731b862e7e0c99"
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
