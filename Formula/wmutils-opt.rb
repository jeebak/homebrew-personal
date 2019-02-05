class WmutilsOpt < Formula
  desc "optional addons to wmutils"
  homepage "https://github.com/wmutils/opt"
  url "https://github.com/wmutils/opt/archive/v1.0.tar.gz"
  sha256 "f30bb409bdcfa6720015dbca5356e04d4359cca3800a39948822152a94bcd055"

  unless OS.mac?
    depends_on "linuxbrew/xorg/xorg"
    depends_on "linuxbrew/xorg/xcb-util"
  end

  def install
    system "make", "PREFIX=#{prefix}", "MANPREFIX=#{prefix}/share/man"
    system "make", "PREFIX=#{prefix}", "MANPREFIX=#{prefix}/share/man", "install"
  end

  test do
    system "#{bin}/wew"
  end
end
