class Uemacs < Formula
  desc "uEmacs/PK 4.0 | Full screen editor based on MicroEMACS 3.9e"
  homepage "http://git.kernel.org/pub/scm/editors/uemacs/"
  url "http://git.kernel.org/pub/scm/editors/uemacs/uemacs.git/", :using => GitDownloadStrategy
  version "4.0.15"

  def install
    mkdir_p "#{bin}"
    mkdir_p "#{lib}"
    system "make", "install", "BINDIR=#{bin}", "LIBDIR=#{lib}"
    # seems to bomb out when reading the "store-macro" lines in .emacsrc file on osx but works fine under linuxbrew
  end

  test do
    system "#{bin}/em", "--version"
  end
end
