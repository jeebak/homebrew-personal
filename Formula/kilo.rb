class Kilo < Formula
  desc "Kilo is a small text editor in less than 1K lines of code (counted with cloc)."
  homepage "https://viewsourcecode.org/snaptoken/kilo/"
  # No tags, so using this for now
  url "https://github.com/antirez/kilo", :using => GitDownloadStrategy
  version "current"

  def install
    system "make && strip kilo && mv kilo #{prefix}"
    bin.install "#{prefix}/kilo"
  end

  test do
    system "false"
  end
end
