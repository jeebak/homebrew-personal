class Ue < Formula
  desc "Tiny console editor for Linux with WordStar Key mapping"
  homepage "http://texteditors.org/cgi-bin/wiki.pl?Ue"
  url "http://sites.google.com/site/texteditors/Home/files/ue.1.25.tgz"
  version "1.25"
  sha256 "80624a30a59aae0d36f78bde0640fcd69a0d24b356aca450d93ffb48a339301b"

  patch :DATA

  def install
    # WIP, compiles but broken
    system "gcc ue.c -o ue && strip ue && mv ue #{prefix} && mv README #{prefix}"
    bin.install "#{prefix}/ue"
  end

  test do
    system "false"
  end
end

__END__
diff --git a/ue.c b/ue.c
index d8ba252..7dc7278 100644
--- a/ue.c
+++ b/ue.c
@@ -37,6 +37,9 @@ terminal is (1,1) based. display() takes care of the conversion.
 #include <ctype.h>
 #include <string.h>
 #include <termios.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <fcntl.h>
 
 #define BUF 65536*4
 #define MODE 0666
@@ -344,7 +347,7 @@ undo()
 		undop--;
 		curp = (char*)undop->pos;
 		if(undop->pos < 0){	// negative means was delete
-			(int)curp = -(int)curp;		// so insert
+			curp = -(int)curp;		// so insert
 			cmove(curp, curp+1, etxt-curp);
 			*curp = undop->ch;
 			if(*curp == '\n') LINES++;
