class ErsatzEmacs < Formula
  desc "The smallest emacs-like editor I could find"
  homepage "http://hunter.apana.org.au/~cjb/Code/ersatz.shar"
  url "https://github.com/stangelandcl/ersatz-emacs", :using => GitDownloadStrategy
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
index c90e4a6..d053f45 100644
--- a/Makefile
+++ b/Makefile
@@ -38,9 +38,10 @@ all:	$(OFILES)
 	$(CC) $(CFLAGS) $(OFILES) -o $(EXEC) $(LFLAGS)
 
 install: all
-	install -c -m 0755 -o bin -g bin -s $(EXEC) $(BINDIR)
-	install -c -m 0444 -o bin -g bin ERSATZ.keys $(DOCDIR)
-	install -c -m 0644 -o bin -g bin ee.1 $(MANDIR)/$(EXEC).1
+	mkdir -p $(DOCDIR) $(BINDIR) $(MANDIR)
+	install -c -m 0755 -s $(EXEC) $(BINDIR)/$(EXEC)
+	install -c -m 0444 ERSATZ.keys $(DOCDIR)/ERSATZ.keys
+	install -c -m 0644 ee.1 $(MANDIR)/$(EXEC).1
 
 clean:
 	rm -f *.o *~ *.core *.bak ersatz.shar $(EXEC)
