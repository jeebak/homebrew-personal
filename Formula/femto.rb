class Femto < Formula
  desc "Atto Emacs extended !"
  homepage "https://github.com/hughbarney/femto"
  # No tags, so using this for now
  url "https://github.com/hughbarney/femto", :using => GitDownloadStrategy
  version "current"

  depends_on "ncurses" => :build

  def install
    system "make -f makefile && strip femto && mv femto #{prefix}"
    bin.install "#{prefix}/femto"
  end

  test do
    system "false"
  end
end
