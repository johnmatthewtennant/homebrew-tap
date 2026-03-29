class VoiceConversation < Formula
  desc "Transport-agnostic voice interface for Claude Code"
  homepage "https://github.com/johnmatthewtennant/voice-conversation-cli"
  url "https://github.com/johnmatthewtennant/voice-conversation-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256_UPDATE_AFTER_RELEASE"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/voice-conversation"
    # Ad-hoc codesign: required because cp invalidates the linker signature,
    # and the binary needs valid signing for CoreAudio/AVFoundation/Speech/ScreenCaptureKit
    system "codesign", "-f", "-s", "-", bin/"voice-conversation"
    # Install Claude Code plugin
    (prefix/"plugin").install Dir["plugin/*"]
    (prefix/".claude-plugin").install Dir[".claude-plugin/*"]
  end

  def caveats
    <<~EOS
      To use the Claude Code plugin, either:

      1. Run: voice-conversation install-plugin
         (registers the GitHub marketplace in Claude Code settings)

      2. Or in Claude Code: /plugin marketplace add johnmatthewtennant/voice-conversation-cli
    EOS
  end

  test do
    assert_match "voice-conversation", shell_output("#{bin}/voice-conversation help 2>&1")
  end
end
