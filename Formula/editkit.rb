class Editkit < Formula
  desc "Editkit extends Terry Loveall's lightweight editX project with other keymappings."
  homepage "http://freecode.com/projects/editkit"
  url "ftp://ftp.ac-grenoble.fr/ge/office/editkit-1.05.tar.bz2"
  sha256 "5548c3f5359848878aaf5430a515510017f924496fef245dcc9e9e0cc9bf6a3d"
  version "1.05"

  def install
    mkdir_p "#{bin}"
    system "make -f Makefile.kit SHAREDIR=#{share} DESTDIR=#{prefix} BINDIR=#{bin} all"
    system "make -f Makefile.kit SHAREDIR=#{share} DESTDIR=#{prefix} BINDIR=#{bin} install"
  end

  test do
    system "false"
  end
end
