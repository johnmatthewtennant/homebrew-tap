class SwiftTranscribe < Formula
  desc "On-device speech-to-text CLI using Apple's SpeechAnalyzer"
  homepage "https://github.com/johnmatthewtennant/swift-transcribe"
  url "https://github.com/johnmatthewtennant/swift-transcribe/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "78870baecd8e3ae7cc9e0d7c0a97f83587dd188caf6f914d887fbb00f93d5e7a"
  license "MIT"

  option "with-skill", "Install Claude Code skill"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "make"
    bin.install ".build/release/transcribe"

    if build.with? "skill"
      (share/"skill").install ".agents/skills/transcribe-audio/SKILL.md"
    end
  end

  def post_install
    if (share/"skill/SKILL.md").exist?
      agents_dir = Pathname.new(Dir.home)/".agents/skills/transcribe-audio"
      claude_dir = Pathname.new(Dir.home)/".claude/skills/transcribe-audio"
      agents_dir.mkpath
      claude_dir.mkpath
      cp share/"skill/SKILL.md", agents_dir/"SKILL.md"
      cp share/"skill/SKILL.md", claude_dir/"SKILL.md"
    end
  end

  test do
    assert_match "transcribe", shell_output("#{bin}/transcribe --help 2>&1")
  end
end
