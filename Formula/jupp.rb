class Jupp < Formula
  desc "jupp - The Editor which sucks less"
  homepage "https://www.mirbsd.org/jupp.htm"
  url "https://www.mirbsd.org/MirOS/dist/jupp/joe-3.1jupp30.tgz"
  version "3.1jupp28"
  sha256 "65ddb346364a056c1d78a1cb406b0ebf6c9c2fbd753cd404b1b4c8fd3fa9916d"

  def install
    system "bash", "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
