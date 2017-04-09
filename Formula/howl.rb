class Howl < Formula
  desc "A general purpose, fast and lightweight editor with a keyboard-centric minimalistic user interface."
  homepage "http://howl.io/"
  url "https://github.com/howl-editor/howl", :using => GitDownloadStrategy
  version "current"

  depends_on "wget" => :build
  depends_on "gtk+3" => :build

  def install
    cd 'src' do
      system "echo $PATH"
      system "make -j 4"
      system "make PREFIX=#{prefix} install"
    end
  end

  test do
    system "false"
  end
end
