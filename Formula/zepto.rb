class Zepto < Formula
  desc "Smallest usable editor in less than 1000 lines of C"
  homepage "https://github.com/hughbarney/zepto"
  # No tags, so using this for now
  url "https://github.com/hughbarney/zepto", :using => GitDownloadStrategy
  version "current"

  def install
    system "make -f makefile && strip zepto && mv zepto #{prefix}"
    bin.install "#{prefix}/zepto"
  end

  test do
    system "false"
  end
end
