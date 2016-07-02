class Xcape < Formula
  desc "Linux utility to configure modifier keys to act as other keys when pressed and released on their own."
  homepage "https://github.com/alols/xcape"
  url "https://github.com/alols/xcape", :using => GitDownloadStrategy
  version "current"

  def install
    if OS.linux?
      # sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev

      # This a quick hack/workaround, specificially for Xubuntu
      ENV.append_path "PKG_CONFIG_PATH", "/usr/lib/x86_64-linux-gnu/pkgconfig"
      ENV.append_path "PKG_CONFIG_PATH", "/usr/share/pkgconfig"

      system "make"
      system "make PREFIX=#{prefix} MANDIR=#{man}/man1 install"
    else
      odie "Linux only"
    end
  end

  test do
    system "false"
  end
end
