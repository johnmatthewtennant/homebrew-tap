class TranscribeCli < Formula
  desc "On-device speech-to-text CLI using Apple's SpeechAnalyzer"
  homepage "https://github.com/johnmatthewtennant/transcribe-cli"
  url "https://github.com/johnmatthewtennant/transcribe-cli/archive/refs/tags/v0.2.20.tar.gz"
  sha256 "510ea711527ff164af6c1c9b649001a152ef179cc401adc43670d4edb0cc07ee"
  license "MIT"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/transcribe"
  end

  test do
    assert_match "transcribe", shell_output("#{bin}/transcribe --help 2>&1")
  end
end
