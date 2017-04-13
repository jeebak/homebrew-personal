class ScIm < Formula
  desc "SC-IM - Spreadsheet Calculator Improvised -- An ncurses spreadsheet program for terminal"
  homepage "https://github.com/andmarti1424/sc-im"
  url "https://github.com/andmarti1424/sc-im", :using => GitDownloadStrategy, :branch => "freeze"
  version "current"

  depends_on "pkg-config" => :build
  depends_on "ncurses"

  def install
    cd "src" do
      system "make"
      # Yes, lowercase "prefix"
      system "make prefix=#{prefix} install"
    end
  end

  test do
    system "false"
  end
end
