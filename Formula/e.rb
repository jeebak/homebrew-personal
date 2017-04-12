class E < Formula
  desc "Very lightweight but seems fully functional editor for author"
  homepage "http://frox25.no-ip.org/~mtve/code/"
  url "http://frox25.no-ip.org/~mtve/code/orig/e-0.993.tar.bz2"
  sha256 "32555e2f2f8811c9670c4cd3579a89b316df81e38f699a8235a5497610ebd80c"
  version "0.993"

  def install
    system "make && strip e && mv e #{prefix} && mv README #{prefix}"
    bin.install "#{prefix}/e"
  end

  test do
    system "false"
  end
end
