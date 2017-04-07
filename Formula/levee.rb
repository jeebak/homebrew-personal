class Levee < Formula
  desc "A tiny vi clone"
  homepage "http://www.pell.portland.or.us/~orc/Code/levee/"
  url "http://www.pell.portland.or.us/~orc/Code/levee/levee-3.5b.tar.bz2"
  version "3.5b"
  sha256 "b5060e60f88bf2d07e48c438cc934055baef2c40c9201c74ca4f254da50f47ce"

  def install
    system "./configure.sh"
    system "make install exedir=#{bin} mandir=#{man}"
  end

  test do
    system "false"
  end
end
