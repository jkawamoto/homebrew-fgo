#
# assets/formula.rb
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
  version "0.2.4"

  if Hardware::CPU.is_64_bit?
    url "https://github.com/jkawamoto/fgo/releases/download/v0.2.4/fgo_0.2.4_darwin_amd64.zip"
    sha256 "c3898b4e92071fd9b2f25c7b408f0a14ea6077e10db7e56e35db1f26a02dc41f"
  else
    url "https://github.com/jkawamoto/fgo/releases/download/v0.2.4/fgo_0.2.4_darwin_386.zip"
    sha256 "075a25d01fb84447c586034e129a02951dce077c7fe060075085980efbcc4544"
  end

  system "brew tap homebrew/dupes"
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
