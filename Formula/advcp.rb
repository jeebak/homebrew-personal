class Advcp < Formula
  desc "'cp' and 'mv' utilities with progress bar patches"

  homepage "https://aur.archlinux.org/packages/advcp/"
  url "ftp://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz"
  sha256 "4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa"

  patch do
    url "https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.8-8.32.patch"
    sha256 "6919835aac53c873267d199de8823e993d72870a5eb7b6caf566803a7f3f861e"
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
