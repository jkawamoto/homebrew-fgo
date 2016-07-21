class Fgo < Formula
  desc "Build, upload, and create brew formula for golang application."
  homepage "https://github.com/jkawamoto/fgo"
  version "0.1.1"

  if Hardware.is_64_bit?
    url "https://github.com/jkawamoto/fgo/releases/download/0.1.1/fgo_0.1.1_darwin_amd64.zip"
    sha256 "c562bde4c78fffd7729420748a1dd423205b73d74568fe3e8964f821d93bc566"
  else
    url "https://github.com/jkawamoto/fgo/releases/download/0.1.1/fgo_0.1.1_darwin_386.zip"
    sha256 "52c32075e00d8c7cdecb88763c70e8449b4adf4461bc1bf8bbc1a6beb649641c"
  end

  def install
    bin.install "fgo"
  end

  test do
    system "fgo"
  end

end
