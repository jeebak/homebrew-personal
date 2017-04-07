class Vis < Formula
  desc "A vi-like editor based on Plan 9's structural regular expressions"
  homepage "https://github.com/martanne/vis"
  url "https://github.com/martanne/vis/archive/v0.3.tar.gz"
  version "0.3"
  sha256 "bed8ed32ef4f81bc4fd28e297ea8edc80027ac6923b9d3b5bd955d24899c7077"

  depends_on "pkg-config" => :build
  depends_on "libtermkey"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
