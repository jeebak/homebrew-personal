class Vile < Formula
  desc "Very lightweight but seems fully functional editor for author"
  homepage "http://invisible-island.net/vile/"
  url "ftp://invisible-island.net/vile/vile-9.8.tgz"
  sha256 "dea31c023aa7a90271056c712c826a5d16d19ad61df5cf5f299aa1025af280d6"
  version "9.8"

  patch :DATA

  def install
    system "./configure --prefix=#{prefix}"
    system "make -f makefile install"
  end

  test do
    system "false"
  end
end

__END__
diff --git a/filters/filters.h b/filters/filters.h
index 9cb4526..ed5a9a1 100644
--- a/filters/filters.h
+++ b/filters/filters.h
@@ -210,7 +210,7 @@ extern FILE *yyget_in (void);
 extern FILE *yyget_out (void);
 extern char *yyget_text (void);
 extern int yyget_debug (void);
-extern int yyget_leng (void);
+extern yy_size_t yyget_leng (void);
 extern int yyget_lineno (void);
 extern int yylex_destroy (void);
 extern void yyset_debug (int bdebug);
