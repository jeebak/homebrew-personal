class Elvis < Formula
  desc "The elvis vi-clone (written by Steve Kirkendall)"
  homepage "https://github.com/mbert/elvis/"
  url "https://github.com/mbert/elvis/", :using => GitDownloadStrategy
  version "current"

  def install
    mkdir_p "#{man}/man1"
    system "./configure", "--prefix=#{prefix}"
    system "make install"
    system "for i in doc/elv*.man; do /usr/bin/nroff -man $i > #{man}/man1/`basename $i .man`.1; done"
  end

  test do
    system "false"
  end
end
