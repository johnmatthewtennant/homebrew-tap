class TranscribeCli < Formula
  desc "On-device speech-to-text CLI using Apple's SpeechAnalyzer"
  homepage "https://github.com/johnmatthewtennant/transcribe-cli"
  url "https://github.com/johnmatthewtennant/transcribe-cli/archive/refs/tags/v0.2.11.tar.gz"
  sha256 "52c888a441249861f56eaa32f1fa90f5921d7a51a8872af4bd9e3aa0e534a379"
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
