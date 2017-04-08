class E3 < Formula
  desc "e3 Editor"
  homepage "https://sites.google.com/site/e3editor/"
  url "https://sites.google.com/site/e3editor/Home/e3-2.81.tar.gz"
  sha256 "2f22d33a25b7fe45ee7acc399f62c2a54ebd8e6a8aad87dd68a745a021568139"
  version "2.81"

  def install
    system "make"
    # TODO: currently building for linux
    system "make PREFIX=#{prefix} OS=macosx install"
  end

  test do
    system "false"
  end
end
