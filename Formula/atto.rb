class Atto < Formula
  desc "Atto Emacs is a minimal functional Emacs in less than 2000 lines of C code"
  homepage "https://github.com/hughbarney/atto"
  # No tags, so using this for now
  url "https://github.com/hughbarney/atto", :using => GitDownloadStrategy
  version "current"

  def install
    system "make -f makefile && strip atto && mv atto #{prefix}"
    bin.install "#{prefix}/atto"
  end

  test do
    system "false"
  end
end
