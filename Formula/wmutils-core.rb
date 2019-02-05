class WmutilsCore < Formula
  desc "Set of window manipulation tools"
  homepage "https://github.com/wmutils/core"
  url "https://github.com/wmutils/core/archive/v1.4.tar.gz"
  sha256 "44e16576b7f6e1f126c2cb249449ab7e10fd65289aff774ffaf27d2c15a7b2ba"

  unless OS.mac?
    depends_on "linuxbrew/xorg/xorg"
    depends_on "linuxbrew/xorg/xcb-util"
  end

  def install
    system "make", "PREFIX=#{prefix}", "MANPREFIX=#{prefix}/share/man"
    system "make", "PREFIX=#{prefix}", "MANPREFIX=#{prefix}/share/man", "install"
  end

  test do
    system "#{bin}/lsw"
  end
end
