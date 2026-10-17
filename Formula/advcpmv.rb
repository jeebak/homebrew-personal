class Advcpmv < Formula
  desc "A patch for GNU Core Utilities cp, mv to add progress bars"

  homepage "https://github.com/jarun/advcpmv"
  url "https://ftp.gnu.org/gnu/coreutils/coreutils-9.11.tar.xz"
  sha256 "394024eda0a5955217ceda9cd1201e65dc8fa3aa29c2951135a49521d57c3cc3"

  patch do
    url "https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.9-9.11.patch"
    sha256 "54247b572f015ea7750dce1ac8e45da07736716d62bfc3f26735916cb1c0426f"
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--program-prefix=adv-"

    # Build only cp and mv: naming src/cp and src/mv directly skips
    # BUILT_SOURCES (generated gnulib headers), so depend on them via a
    # throwaway makefile.
    (buildpath/"built-sources.mk").write "cpmv-deps: $(BUILT_SOURCES)\n"
    system "make", "-f", "Makefile", "-f", "built-sources.mk",
           "cpmv-deps", "src/cp", "src/mv", "man/cp.1", "man/mv.1"

    bin.install "src/cp" => "adv-cp"
    bin.install "src/mv" => "adv-mv"
    man1.install "man/cp.1" => "adv-cp.1"
    man1.install "man/mv.1" => "adv-mv.1"
  end

  test do
    assert_match "--progress-bar", shell_output("#{bin}/adv-cp --help")
    assert_match "--progress-bar", shell_output("#{bin}/adv-mv --help")
  end
end
