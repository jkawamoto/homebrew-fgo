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
  version "0.3.1"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG['host_os']
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.1/fgo_0.3.1_darwin_amd64.zip"
      sha256 "217c78ba31b2ff535b92d71e8dac27380f615165fbaa7a88e23ef3ca8519f3c2"
    when /linux/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.1/fgo_0.3.1_linux_amd64.tar.gz"
      sha256 "70b07aefc35caa20b3f444bc70f4c4ee96b44e04cac66f3adb3edc3f1ff443a2"
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
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.1/fgo_0.3.1_darwin_386.zip"
      sha256 "3746a7a21409f719f7286c8e4e83b21ada5c6e7e2a4989c3dab6ee628311c046"
    when /linux/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.1/fgo_0.3.1_linux_386.tar.gz"
      sha256 "0709798bf4468feb564b1332a38c7e3fe97a8aa1fd3ef737c98de2ceeb04ae5d"
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
