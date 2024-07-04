class Advcpmv < Formula
  desc "A patch for GNU Core Utilities cp, mv to add progress bars"

  homepage "https://github.com/jarun/advcpmv"
  url "ftp://ftp.gnu.org/gnu/coreutils/coreutils-9.5.tar.xz"
  sha256 "cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a"

  patch do
    url "https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.9-9.5.patch"
    sha256 "2d17dbe2179994050a89797f842fc7828a9e18cc42b7caee058654adbcd21fe6"
  end

  def install
    # compare to: Library/Formula/coreutils.rb
    # system "./bootstrap"
    system "./configure", "--prefix=#{prefix}", "--program-prefix=adv-"
    system "make", "install"
    # TODO: is there a way to build *only* cp and mv?
    system "find #{bin} -type f -not -name adv-cp -not -name adv-mv | xargs rm"
    system "rm", "-rf", "#{info}", "#{share}/locale"
    system "find #{man1} -type f -not -name adv-cp.1 -not -name adv-mv.1 | xargs rm"
  end

  test do
    system "#{bin}/adv-cp --help | grep -- '--progress'"
    system "#{bin}/adv-mv --help | grep -- '--progress'"
  end
end
