class Zep < Formula
  desc "Smallest usable Editor in less than 800 lines of C"
  homepage "https://github.com/hughbarney/zep"
  # No tags, so using this for now
  url "https://github.com/hughbarney/zep", :using => GitDownloadStrategy
  version "current"

  def install
    system "make -f makefile && strip zep && mv zep #{prefix}"
    bin.install "#{prefix}/zep"
  end

  test do
    system "false"
  end
end
