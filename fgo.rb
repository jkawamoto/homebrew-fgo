class Fgo < Formula
  desc "Build, upload, and create brew formula for golang application."
  homepage "https://github.com/jkawamoto/fgo"
  version "0.2.2"

  if Hardware.is_64_bit?
    url "https://github.com/jkawamoto/fgo/releases/download/0.2.2/fgo_0.2.2_darwin_amd64.zip"
    sha256 "756e2d9edbd8f1c81e30eb8fba3f08d8cbbc409da28914de77f63762575fde33"
  else
    url "https://github.com/jkawamoto/fgo/releases/download/0.2.2/fgo_0.2.2_darwin_386.zip"
    sha256 "088f6283421b1e8aa223f6d075721e020d95a5b22b9333c408ac216a3c4c8b59"
  end

  def install
    bin.install "fgo"
  end

  test do
    system "fgo"
  end

end
