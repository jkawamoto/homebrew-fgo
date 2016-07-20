class Fgo < Formula
  desc "Build, upload, and create brew formula for golang application."
  homepage "https://github.com/jkawamoto/fgo"
  version "0.1.0"

  if Hardware.is_64_bit?
    url "https://github.com/jkawamoto/fgo/releases/download/0.1.0/fgo_0.1.0_darwin_amd64.zip"
    sha256 "ef2a9a2fb4e64a3a8c1e37d13ad43cb470d4e1a8adf3aa02537ace05633dc743"
  else
    url "https://github.com/jkawamoto/fgo/releases/download/0.1.0/fgo_0.1.0_darwin_386.zip"
    sha256 "7a1d998f20d1e1e56ce11260480ba90d700ae4b427a9951309a82e1305d72931"
  end

  def install
    bin.install "fgo"
  end

  test do
    system "fgo"
  end

end
