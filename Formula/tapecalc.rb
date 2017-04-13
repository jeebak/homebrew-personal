class Tapecalc < Formula
  desc "a full-screen tape editor that lets the user edit a calculation"
  homepage "http://invisible-island.net/add/add.html"
  url "ftp://invisible-island.net/add/add-20150704.tgz"
  version "20150704"
  sha256 "320b44d22877a02594036a7082fd6b64246ffd4e05beb30294d40a6c6094e090"

  depends_on "ncurses"

  def install
    system "./configure --prefix=#{prefix}"
    system "make -f makefile install"
  end

  test do
    system "false"
  end
end
