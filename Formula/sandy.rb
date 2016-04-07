class Sandy < Formula
  desc "sandy is an ncurses text editor with an easy-to-read, hackable C source"
  homepage "http://tools.suckless.org/sandy"
  # Hmm... their archive changes
  # url "http://git.suckless.org/sandy/snapshot/sandy-0.4.tar.gz"
  # sha256 "63db19c0f6256145794530914e152a7933cae99a92b06d2bc895ea096c5279c4"
  # version "0.4"
  head "git://git.suckless.org/sandy", :tag => "0.4"

  # depends_on "cmake" => :build
  depends_on "ncurses"

  patch :DATA

  def install
    # This didn't work, so used the patch above:
    # system "PREFIX=#{prefix} LDFLAGS=-L/usr/local/opt/ncurses/lib CPPFLAGS=-I/usr/local/opt/ncurses/include make install"
    system "make install"
  end

  test do
    system "false"
  end
end
__END__
diff --git a/config.mk b/config.mk
index da0f9bc..7b999f2 100644
--- a/config.mk
+++ b/config.mk
@@ -4,7 +4,7 @@ VERSION = 0.4
 # Customize below to fit your system
 
 # paths
-PREFIX = /usr/local
+PREFIX = /usr/local/Cellar/sandy/0.4
 MANPREFIX = ${PREFIX}/share/man
 
 # includes and libs (ncurses)
