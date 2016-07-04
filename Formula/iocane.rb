class Iocane < Formula
  desc "\"Colorless, tasteless, oderless poison that will rid your system of its rodent infestation\" i.e. simulates mouse events from the keyboard"
  homepage "https://github.com/TrilbyWhite/Iocane"
  # https://bbs.archlinux.org/viewtopic.php?id=151691
  #   Iocane: poison the rodent (simulate X11 mouse events from keyboard)
  url "https://github.com/TrilbyWhite/Iocane", :using => GitDownloadStrategy
  version "current"

  def install
    if OS.linux?
      # sudo apt-get install libx11-dev

      # This a quick hack/workaround, specificially for Xubuntu
      system "make PREFIX=#{prefix} install"
    else
      odie "Linux only"
    end
  end

  test do
    system "false"
  end
end
