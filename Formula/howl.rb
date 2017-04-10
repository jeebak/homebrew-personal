class Howl < Formula
  desc "A general purpose, fast and lightweight editor with a keyboard-centric minimalistic user interface."
  homepage "http://howl.io/"
  url "https://github.com/howl-editor/howl", :using => GitDownloadStrategy
  version "current"

  depends_on "pkg-config" => :build
  depends_on "wget"       => :build

  depends_on "gtk+3"      => :build
  depends_on "glib"       => :build
  depends_on "pango"      => :build
  depends_on "cairo"      => :build
  depends_on "pixman"     => :build
  depends_on "fontconfig" => :build
  depends_on "freetype"   => :build
  depends_on "libpng"     => :build
  depends_on "harfbuzz"   => :build
  depends_on "gdk-pixbuf" => :build
  depends_on "libepoxy"   => :build

  depends_on "atk"

  patch :DATA

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

# nordman.org is non-responsive :/

__END__
diff --git a/src/Makefile b/src/Makefile
index dbc835b5..13fbe3de 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -11,13 +11,13 @@ LUAJIT = deps/${LUAJIT_VER}
 LUAJIT_SRC_DIR = $(realpath $(LUAJIT)/src)
 LUAJIT_CFLAGS = -I$(LUAJIT_SRC_DIR)
 LUAJIT_ARCHIVE = $(LUAJIT)/src/libluajit.a
-LUAJIT_URL = http://nordman.org/mirror/luajit/$(LUAJIT_VER).tar.gz
+LUAJIT_URL = http://luajit.org/download/$(LUAJIT_VER).tar.gz
 
 LPEG_VER = lpeg-0.10.2
 LPEG_CHECKSUM = 1402433f02e37ddadff04a3d4118b026
 LPEG = deps/$(LPEG_VER)
 LPEG_OBJECT = $(LPEG)/lpeg.o
-LPEG_URL = http://nordman.org/mirror/lpeg/$(LPEG_VER).tar.gz
+LPEG_URL = http://pkgs.fedoraproject.org/lookaside/pkgs/lua-lpeg/$(LPEG_VER).tar.gz/1402433f02e37ddadff04a3d4118b026/$(LPEG_VER).tar.gz
 
 CFLAGS = -Wall -O2 -g $(LUAJIT_CFLAGS) $(GTK_CFLAGS) -DHOWL_PREFIX=$(PREFIX)
 ARCHIVES = $(LUAJIT_ARCHIVE)
