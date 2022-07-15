class Advcp < Formula
  desc "'cp' and 'mv' utilities with progress bar patches"

  homepage "https://aur.archlinux.org/packages/advcpmv"
  url "ftp://ftp.gnu.org/gnu/coreutils/coreutils-9.1.tar.xz"
  sha256 "61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423"

  patch do
    url "https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.9-9.1.patch"
    sha256 "97b91fdafcff85e5b79604fcf720ece5675fcf0dd76dbdd084f19cb7b482aee4"
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
