class TranscribeCli < Formula
  desc "On-device speech-to-text CLI using Apple's SpeechAnalyzer"
  homepage "https://github.com/johnmatthewtennant/transcribe-cli"
  url "https://github.com/johnmatthewtennant/transcribe-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "78870baecd8e3ae7cc9e0d7c0a97f83587dd188caf6f914d887fbb00f93d5e7a"
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
