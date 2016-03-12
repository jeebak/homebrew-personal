class Advcp < Formula
  desc "'cp' and 'mv' utilities with progress bar patches"
  homepage "https://aur.archlinux.org/packages/advcp/"
  url "http://ftp.gnu.org/gnu/coreutils/coreutils-8.23.tar.xz"
  sha256 "ec43ca5bcfc62242accb46b7f121f6b684ee21ecd7d075059bf650ff9e37b82d"

  patch do
    url "https://gist.githubusercontent.com/Noctem/3e81f726a42beafc6c3a/raw/bba7e01892e53baea8673cc579277950d6bef6d7/advcpmv-8.23_0.5.4.patch"
    sha256 "296ffcd4988a4cb47588cf7fe72f3e796d78af73bf6d38ef101c542b3cfdd454"
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
