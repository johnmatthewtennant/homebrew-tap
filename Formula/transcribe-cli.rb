class TranscribeCli < Formula
  desc "On-device speech-to-text CLI using Apple's SpeechAnalyzer"
  homepage "https://github.com/johnmatthewtennant/transcribe-cli"
  url "https://github.com/johnmatthewtennant/transcribe-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "09df4ea61a28334e3777d055cc63b0906e21bc99519d98338afdf1f8623a69f4"
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
