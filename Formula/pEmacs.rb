class Pemacs < Formula
  desc "pEmacs - Perfect Emacs"
  homepage "https://github.com/hughbarney/pEmacs"
  url "https://github.com/hughbarney/pEmacs/", :using => GitDownloadStrategy
  version "current"

  patch :DATA

  def install
    system "make PREFIX=#{prefix} install"
  end

  test do
    system "false"
  end
end

__END__
diff --git a/Makefile b/Makefile
index 6c09fc9..847ad83 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 # The name to install the editor under.
 EXEC=pe
 
-CFLAGS=-Wall -O2
+CFLAGS=-Wall -O2 -D_FORTIFY_SOURCE=0
 # To be /really/ fanatical on the executible's size...
 #CFLAGS=-Os -fomit-frame-pointer -malign-loops=0 -malign-jumps=0 -malign-functions=0 -Wall
 
@@ -36,8 +36,9 @@ all:	$(OFILES)
 #	install -c -m 0755 -o bin -g bin -s $(EXEC) $(BINDIR)
 
 install: all
-	install -c -m 0755 -o bin -g bin -s $(EXEC) $(BINDIR)
-	install -c -m 0644 -o bin -g bin $(EXEC).1 $(MANDIR)/$(EXEC).1
+	mkdir -p $(BINDIR) $(MANDIR)
+	install -c -m 0755 -s $(EXEC) $(BINDIR)
+	install -c -m 0644 $(EXEC).1 $(MANDIR)/$(EXEC).1
 
 clean:
 	rm -f *.o *~ *.core *.bak $(EXEC)
diff --git a/search.c b/search.c
index ba60892..68e6b7c 100644
--- a/search.c
+++ b/search.c
@@ -589,7 +589,7 @@ forwsrch(void)
 	LINE	*clp, *tlp;
 	int	 cbo, tbo, c, i, xcase = 0;
 	char	*pp;
-	int	 nline;
+	int	 nline = 0;
 
 	clp = curwp->w_dotp;
 	cbo = curwp->w_doto;
@@ -647,7 +647,7 @@ backsrch(void)
 	LINE	*clp, *tlp;
 	int	 cbo, tbo, c, i, xcase = 0;
 	char	*epp, *pp;
-	int	 nline;
+	int	 nline = 0;
 
 	for (epp = &pat[0]; epp[1] != 0; ++epp);
 	clp = curwp->w_dotp;
