class Mined < Formula
  desc "Unicode Text Editor"
  homepage "http://towo.net/mined/"
  url "http://downloads.sourceforge.net/project/mined/mined/mined%202015.25/mined-2015.25.tar.gz"
  version "2015.25"
  sha256 "51bca986a9fe49bbce1e41e77dd48591dc775ed93f76f97702a3a73b7ffa67e6"

  def install
    system "make"
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "false"
  end
end
