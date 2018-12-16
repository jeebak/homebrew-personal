class Advcp < Formula
  desc "'cp' and 'mv' utilities with progress bar patches"

  homepage "https://aur.archlinux.org/packages/advcp/"
  url "ftp://ftp.gnu.org/gnu/coreutils/coreutils-8.30.tar.xz"
  sha256 "e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057"

  patch do
    url "https://raw.githubusercontent.com/mrdrogdrog/advcpmv/master/advcpmv-0.8-8.30.patch"
    sha256 "9954d975554f3c06b518d4d17c5247ef751fe8f29d692799e79c9386ab4a1c1b"
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
