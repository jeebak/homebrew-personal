class The < Formula
  desc "THE is a powerful text editor modelled on the VM/CMS text editor XEDIT with the best features of Mansfield Software's Kedit."
  homepage "http://hessling-editor.sourceforge.net/"
  url "http://downloads.sourceforge.net/project/hessling-editor/hessling-editor/3.3%20Release%20Candidate%204/THE-3.3RC4.tar.gz"
  version "3.3RC4"
  sha256 "8781cd1ae2616a4d424e4847f881709b140cf7da209fe46828170d90a63bd1f0"

  depends_on "regina-rexx"

  def install
    system "./configure", "--with-rexx=regina",
                          "--with-ncurses",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
