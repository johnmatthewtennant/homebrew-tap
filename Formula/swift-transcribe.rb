class SwiftTranscribe < Formula
  desc "CLI for on-device speech-to-text transcription using Apple's SpeechAnalyzer framework"
  homepage "https://github.com/johnmatthewtennant/swift-transcribe"
  url "https://github.com/johnmatthewtennant/swift-transcribe/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8290ac40744d5bbd08221d997e389468c928f9845b49dc8ce0f2bd76b9169ff4"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    bin.install ".build/release/transcribe"
  end

  test do
    assert_match "transcribe", shell_output("#{bin}/transcribe --help 2>&1")
  end
end
