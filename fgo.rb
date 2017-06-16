#
# assets/formula.rb
#
# Copyright (c) 2016-2017 Junpei Kawamoto
#
# This software is released under the MIT License.
#
# http://opensource.org/licenses/mit-license.php
#
class Fgo < Formula
  desc "Build, upload, and create brew formula for golang application."
  homepage "https://github.com/jkawamoto/fgo"
  version "0.2.5"

  if Hardware::CPU.is_64_bit?
    url "https://github.com/jkawamoto/fgo/releases/download/v0.2.5/fgo_0.2.5_darwin_amd64.zip"
    sha256 "e382aafdd9f3d2d05183cde74642594f51a9761a786cd10dccc2f516ec122c57"
  else
    url "https://github.com/jkawamoto/fgo/releases/download/v0.2.5/fgo_0.2.5_darwin_386.zip"
    sha256 "345f48a03830e1e5d96173017959b5c368248e2913c313f3028bafdec389949b"
  end

  system "brew tap tcnksm/ghr"
  depends_on "make" => :run
  depends_on "ghr" => :run
  depends_on 'go' => :build

  GOPATH = ENV["GOPATH"]
  def install
    ENV["GOPATH"] = GOPATH
    system "go get -u github.com/laher/goxc"
    bin.install "fgo"
  end

  test do
    system "fgo"
  end

end
