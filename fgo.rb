class Fgo < Formula
  desc "Build, upload, and create brew formula for golang application."
  homepage "https://github.com/jkawamoto/fgo"
  version "0.2.0"

  if Hardware.is_64_bit?
    url "https://github.com/jkawamoto/fgo/releases/download/0.2.0/fgo_0.2.0_darwin_amd64.zip"
    sha256 "c63cbd7ac9240d674a64ebd80ea9067cec57ecc919e7fb1e32a6b6b3ce5fd8b0"
  else
    url "https://github.com/jkawamoto/fgo/releases/download/0.2.0/fgo_0.2.0_darwin_386.zip"
    sha256 "75f282b5a54702788598ecd47d9881d8c7925145194b29d3621e94be6b14dfcf"
  end

  def install
    bin.install "fgo"
  end

  test do
    system "fgo"
  end

end
