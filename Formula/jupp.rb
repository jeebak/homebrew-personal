class Jupp < Formula
  desc "jupp - The Editor which sucks less"
  homepage "https://www.mirbsd.org/jupp.htm"
  url "https://www.mirbsd.org/MirOS/dist/jupp/joe-3.1jupp28.tgz"
  version "28"
  sha256 "be4d16cb44f002a3f6f5069471096c53d9c184b7366ef1a055422d2f0006851f"

  def install
    system "bash", "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
