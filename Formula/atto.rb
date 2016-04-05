class Atto < Formula
  desc "Atto Emacs is a minimal functional Emacs in less than 2000 lines of C code"
  homepage "https://github.com/hughbarney/atto"
  # No tags, so using this for now
  url "https://github.com/hughbarney/atto/archive/master.tar.gz"
  sha256 "e8aa013f9f274acc51da8f383b53c4cb70d873ca6d3e85a14e9a4217021198c9"
  version "644ba20a"

  # depends_on "cmake" => :build

  def install
    system "make -f makefile && strip atto && mv atto #{prefix}"
    bin.install "#{prefix}/atto"
  end

  test do
    system "false"
  end
end
