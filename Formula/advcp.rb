class Advcp < Formula
  desc "'cp' and 'mv' utilities with progress bar patches"
  homepage "https://aur.archlinux.org/packages/advcp/"
  url "ftp://ftp.gnu.org/gnu/coreutils/coreutils-8.25.tar.xz"
  sha256 "31e67c057a5b32a582f26408c789e11c2e8d676593324849dcf5779296cdce87"

  patch do
    url "https://aur.archlinux.org/cgit/aur.git/plain/advcpmv-8.25.patch?h=advcp"
    sha256 "357034a0dca1a5f2e8fc3a0fabe0268c378192449c4094f690e3f900f7a5ae7f"
  end

  def install
    # compare to: Library/Formula/coreutils.rb
    # system "./bootstrap"
    system "./configure", "--prefix=#{prefix}", "--program-prefix=adv-"
    system "make", "install"
    # TODO: is there a way to build *only* cp and mv?
    system "find #{bin} -type f -not -name adv-cp -not -name adv-mv | xargs rm"
    system "rm", "-rf", "#{info}"
    system "find #{man1} -type f -not -name adv-cp.1 -not -name adv-mv.1 | xargs rm"
  end

  test do
    system "#{bin}/adv-cp --help | grep -- '--progress'"
    system "#{bin}/adv-mv --help | grep -- '--progress'"
  end
end
