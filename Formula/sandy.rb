class Sandy < Formula
  desc "sandy is an ncurses text editor with an easy-to-read, hackable C source"
  homepage "http://tools.suckless.org/sandy"
  # Hmm... their .tar.gz archive changes
  url "http://git.suckless.org/sandy/snapshot/sandy-0.4.zip"
  sha256 "f20ea90b2b14201d0893fc4a307361113258a7a64b9b79b807b1b229f21c80e3"
  version "0.4"
  # head "git://git.suckless.org/sandy", :tag => "0.4"

  # depends_on "cmake" => :build
  depends_on "ncurses"

  def install
    system "make install PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
