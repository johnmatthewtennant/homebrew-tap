class SwiftTranscribe < Formula
  desc "On-device speech-to-text CLI using Apple's SpeechAnalyzer"
  homepage "https://github.com/johnmatthewtennant/swift-transcribe"
  url "https://github.com/johnmatthewtennant/swift-transcribe/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8290ac40744d5bbd08221d997e389468c928f9845b49dc8ce0f2bd76b9169ff4"
  license "MIT"

  option "with-skill", "Install Claude Code skill"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "make"
    bin.install ".build/release/transcribe"

    if build.with? "skill"
      agents_dir = File.expand_path("~/.agents/skills/transcribe-audio")
      claude_dir = File.expand_path("~/.claude/skills/transcribe-audio")
      mkdir_p agents_dir
      mkdir_p claude_dir
      cp ".agents/skills/transcribe-audio/SKILL.md", agents_dir
      cp ".agents/skills/transcribe-audio/SKILL.md", claude_dir
    end
  end

  test do
    assert_match "transcribe", shell_output("#{bin}/transcribe --help 2>&1")
  end
end
