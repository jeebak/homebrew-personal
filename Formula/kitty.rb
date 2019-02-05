class Kitty < Formula
  desc "A cross-platform, fast, feature full, GPU based terminal emulator"
  homepage ""
  url "https://github.com/kovidgoyal/kitty/archive/v0.13.3.tar.gz"
  sha256 "b6f48404349ca99049de40e7bb55511de9ea04a6b1567068997d3fddb2c20f08"

  depends_on "pkg-config" => :build
  depends_on "sphinx-doc" => :build
  # pkg_resources.DistributionNotFound: The 'Sphinx==1.8.3' distribution was not found and is required by the application

  depends_on "dbus"
  depends_on 'harfbuzz'
  depends_on "imagemagick"
  depends_on "libpng"
  depends_on "python"
  depends_on "zlib"

  unless OS.mac?
    depends_on "fontconfig"
    depends_on "freetype"
    depends_on "libxkbcommon"
    depends_on "linuxbrew/xorg/mesa"
    depends_on "linuxbrew/xorg/wayland-protocols"
  end

  def install
    system "python3", "setup.py", "--prefix", "#{prefix}", "linux-package"
  end

  test do
    system "true"
  end
end
