class Eon < Formula
  desc "a small but powerful console text editor (C)"
  homepage "https://github.com/tomas/eon"
  url "https://github.com/tomas/eon", :using => GitDownloadStrategy
  version "current"

  depends_on "cmake"      => :build
  depends_on "pkg-config" => :build

  depends_on "luajit"

  def install
    system "cd #{buildpath} && git submodule update --init --recursive"
    system "make"
    system "mv eon #{prefix}"
    bin.install "#{prefix}/eon"
  end

  test do
    system "false"
  end
end
