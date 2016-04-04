class Vis < Formula
  desc "a vim like text editor"
  homepage "https://github.com/martanne/vis"
  url "https://github.com/martanne/vis/archive/v0.2.tar.gz"
  version "0.2"
  sha256 "3e5b81d760849c56ee378421e9ba0f653c641bf78e7594f71d85357be99a752d"

  depends_on "libtermkey"
  depends_on "luarocks"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    system "luarocks", "install", "lpeg"
  end

  test do
    system "false"
  end
end
