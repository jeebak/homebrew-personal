class Godit < Formula
  desc "A very religious text editor"
  homepage "https://github.com/nsf/godit"
  url "https://github.com/nsf/godit", :using => GitDownloadStrategy
  version "current"

  depends_on "go"

  def install
    system "go get github.com/nsf/termbox-go"
    system "go get github.com/nsf/tulib"
    system "go build -o godit && mv godit #{prefix}"
    bin.install "#{prefix}/godit"
  end

  test do
    system "false"
  end
end
