class Uemacs < Formula
  desc "uEmacs/PK 4.0 | Full screen editor based on MicroEMACS 3.9e"
  homepage "http://git.kernel.org/pub/scm/editors/uemacs/"
  url "http://git.kernel.org/pub/scm/editors/uemacs/uemacs.git/", :using => GitDownloadStrategy
  version "4.0.15"

  def install
    mkdir_p "#{bin}"
    mkdir_p "#{lib}"
    system "make", "install", "BINDIR=#{bin}", "LIBDIR=#{lib}"
    # seems to bomb out when reading its .emacsrc file on osx but works fine under linuxbrew
    # system "iconv -f ISO-8859-1 -t UTF-8 #{lib}/.emacsrc"
  end

  test do
    system "#{bin}/em", "--version"
  end
end
