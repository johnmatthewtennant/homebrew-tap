class TranscribeCli < Formula
  desc "On-device speech-to-text CLI using Apple's SpeechAnalyzer"
  homepage "https://github.com/johnmatthewtennant/transcribe-cli"
  url "https://github.com/johnmatthewtennant/transcribe-cli/archive/refs/tags/v0.2.21.tar.gz"
  sha256 "bd246ce5c55efa68b7c082c1b38c611942ea23b973f3988a27606734f844d943"
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
