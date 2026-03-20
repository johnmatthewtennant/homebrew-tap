class TranscribeCli < Formula
  desc "On-device speech-to-text CLI using Apple's SpeechAnalyzer"
  homepage "https://github.com/johnmatthewtennant/transcribe-cli"
  url "https://github.com/johnmatthewtennant/transcribe-cli/archive/refs/tags/v0.2.23.tar.gz"
  sha256 "bfe31600e66313f99db2724eed1e0bedacf6241075ceb183037f0db511d45436"
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
