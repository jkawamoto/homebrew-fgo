#
# fgo.rb
#
# Copyright (c) 2016-2018 Junpei Kawamoto
#
# This software is released under the MIT License.
#
# http://opensource.org/licenses/mit-license.php
#
require 'rbconfig'
class Fgo < Formula
  desc "Build, upload, and create brew formula for golang application."
  homepage "https://github.com/jkawamoto/fgo"
  version "0.3.4"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG['host_os']
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.4/fgo_v0.3.4_darwin_amd64.zip"
      sha256 "9988dd5c08e84dfe73908a344d589f1a9260163b64c1206fb19bce619a3970e8"
    when /linux/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.4/fgo_v0.3.4_linux_amd64.tar.gz"
      sha256 "49558165cecc14433ca8ed51513d8ef436e8d825e7ec9ffed1794eeb6d5afc9f"
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
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.4/fgo_v0.3.4_darwin_386.zip"
      sha256 "f3300a14a7de4c9f98e03ab1aa04a16c8cdc5e6dc2c9b9d6166fa99408b11e94"
    when /linux/
      url "https://github.com/jkawamoto/fgo/releases/download/v0.3.4/fgo_v0.3.4_linux_386.tar.gz"
      sha256 "e27dddbbeafa8c0a5faee78507e73fe9491bba0e053b9a992635777a4cfa3fc2"
    when /solaris|bsd/
      :unix
    else
      :unknown
    end
  end

  def install
    bin.install "fgo"
  end

  test do
    system "fgo"
  end

end
