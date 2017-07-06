#
# fgo.rb
#
# Copyright (c) 2016-2017 Junpei Kawamoto
#
# This software is released under the MIT License.
#
# http://opensource.org/licenses/mit-license.php
#
require 'rbconfig'
class Fgo < Formula
  desc "Build, upload, and create brew formula for golang application."
  homepage "https://github.com/jkawamoto/fgo"
  version "0.3.0"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG['host_os']
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.0/fgo_0.3.0_darwin_amd64.zip"
      sha256 "01d7119de7acdce94eb13577624249dd92d9eff721026f0e0e953e77ac37ac42"
    when /linux/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.0/fgo_0.3.0_linux_amd64.tar.gz"
      sha256 "5d96c39950152b9b8af83b1eb6755b6ea0ae3ebfcd189292ae007ac3e29ff8a9"
    when /solaris|bsd/
      :unix
    else
      :unknown
    end
  else
    case RbConfig::CONFIG['host_os']
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.0/fgo_0.3.0_darwin_386.zip"
      sha256 "720fbc957d7992f24a633a1512053a9257b95639973bc5dcebb2a97704675203"
    when /linux/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.0/fgo_0.3.0_linux_386.tar.gz"
      sha256 "7559963023d6708c9366c6a8d7aa89445a6391946fb757ea60998b249120d43d"
    when /solaris|bsd/
      :unix
    else
      :unknown
    end
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
