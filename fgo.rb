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
  version "0.3.3"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG['host_os']
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.3/fgo_v0.3.3_darwin_amd64.zip"
      sha256 "dcf91c2aa8e97176d91ae4a8dd39f2f9dde4c4004b3f646d94e4acc513287095"
    when /linux/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.3/fgo_v0.3.3_linux_amd64.tar.gz"
      sha256 "4366f65bebd44bf1d6baf106f8c20bfe2535ddea6c0e7f72a1bfc22fff51373c"
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
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.3/fgo_v0.3.3_darwin_386.zip"
      sha256 "f0c32a4e9cb0678fa839a6fcb6a071aeb49a803734ef69cfeeefcc83660be586"
    when /linux/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.3/fgo_v0.3.3_linux_386.tar.gz"
      sha256 "dd511dc3d2f11c94fca1de28ad97f43cc243c98093971f427c15efdeda338c75"
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
