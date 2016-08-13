#
# assets/formula.go
#
# Copyright (c) 2016 Junpei Kawamoto
#
# This software is released under the MIT License.
#
# http://opensource.org/licenses/mit-license.php
#
class Fgo < Formula
  desc "Build, upload, and create brew formula for golang application."
  homepage "https://github.com/jkawamoto/fgo"
  version "0.2.3"

  if Hardware::CPU.is_64_bit?
    url "https://github.com/jkawamoto/fgo/releases/download/v0.2.3/fgo_0.2.3_darwin_amd64.zip"
    sha256 "00fd532eaca22d38db5eb7ed182291662d5dd2cd5cf60a03509b05d21423599f"
  else
    url "https://github.com/jkawamoto/fgo/releases/download/v0.2.3/fgo_0.2.3_darwin_386.zip"
    sha256 "db864b32c22b97a2e0556bc55dec22080ecaa1789be9a138c4f84e734c5d12ef"
  end

  def install
    bin.install "fgo"
  end

  test do
    system "fgo"
  end

end
