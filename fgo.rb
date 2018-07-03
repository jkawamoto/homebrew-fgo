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
  version "v0.3.2"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG['host_os']
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jkawamoto/fgo/releases/download/vv0.3.2/fgo_v0.3.2_darwin_amd64.zip"
      sha256 "57b9ba097e800ab0e07521f83d31a33cf6b29db537e1e36508a5efdec645cedb"
    when /linux/
      url "https://github.com/jkawamoto/fgo/releases/download/vv0.3.2/fgo_v0.3.2_linux_amd64.tar.gz"
      sha256 "4c56ecd3eb9d5a009703f5ace67e9804bade937302abb69dee8437a5000b85c8"
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
      url "https://github.com/jkawamoto/fgo/releases/download/vv0.3.2/fgo_v0.3.2_darwin_386.zip"
      sha256 "f9e1bf2f53071434b06c84668118df26f53df4c3500c7cdae4fe31060b542678"
    when /linux/
      url "https://github.com/jkawamoto/fgo/releases/download/vv0.3.2/fgo_v0.3.2_linux_386.tar.gz"
      sha256 "a17906d685d0e0b386d51bfd2ecf778175e64fbdd7a88dd7e2c45a230bc535d6"
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
