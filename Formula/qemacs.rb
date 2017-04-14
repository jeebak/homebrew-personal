class Qemacs < Formula
  desc "QEmacs (for Quick Emacs) is a very small but powerful UNIX editor."
  homepage "http://bellard.org/qemacs/"
  url "http://bellard.org/qemacs/qemacs-0.3.3.tar.gz"
  sha256 "2ffba66a44783849282199acfcc08707debc7169394a8fd0902626222f27df94"
  version "0.3.3"

  patch :DATA

  def install
    system "./configure --prefix=#{prefix} --disable-x11 --disable-xv --disable-xrender --disable-html --disable-png"
    system "make install"
  end

  test do
    system "false"
  end
end

__END__
diff --git a/Makefile b/Makefile
index aa5f08f..d5e487d 100644
--- a/Makefile
+++ b/Makefile
@@ -47,7 +47,7 @@ endif
 ifdef CONFIG_DLL
 LIBS+=-ldl
 # export some qemacs symbols
-LDFLAGS+=-Wl,-E
+LDFLAGS+=-Wl
 endif
 LIBS+=-lm
 
@@ -85,16 +85,6 @@ endif
 LIBS+= -L/usr/X11R6/lib -lXext -lX11
 endif
 
-ifdef CONFIG_HTML
-CFLAGS+=-I./libqhtml
-DEP_LIBS+=libqhtml/libqhtml.a 
-LIBS+=-L./libqhtml -lqhtml
-OBJS+=html.o docbook.o
-ifndef CONFIG_WIN32
-TARGETS+=html2png
-endif
-endif
-
 ifdef CONFIG_UNICODE_JOIN
 OBJS+= charsetmore.o charset_table.o arabic.o indic.o qfribidi.o unihex.o
 endif
@@ -140,8 +130,6 @@ cfb.o: cfb.c cfb.h fbfrender.h
 
 fbfrender.o: fbfrender.c fbfrender.h libfbf.h
 
-html2png.o: html2png.c qe.h
-
 %.o : %.c
 	$(CC) $(DEFINES) $(CFLAGS) -o $@ -c $<
 
@@ -149,21 +137,22 @@ clean:
 	make -C libqhtml clean
 	rm -f *.o *~ TAGS gmon.out core \
            qe qe_g qe.exe qfribidi kmaptoqe ligtoqe \
-           html2png fbftoqe fbffonts.c
+           fbftoqe fbffonts.c
 
 distclean: clean
 	rm -f config.h config.mak
 
-install: qe qe.1 kmaps ligatures html2png
+install: qe qe.1 kmaps ligatures
+	mkdir -p $(prefix)/bin
 	install -m 755 qe $(prefix)/bin/qemacs
 	ln -sf qemacs $(prefix)/bin/qe
 ifdef CONFIG_FFMPEG
 	ln -sf qemacs $(prefix)/bin/ffplay
 endif
 	mkdir -p $(prefix)/share/qe
+	mkdir -p $(prefix)/man/man1
 	install kmaps ligatures $(prefix)/share/qe
 	install qe.1 $(prefix)/man/man1
-	install -m 755 -s html2png $(prefix)/bin
 
 TAGS: force
 	etags *.[ch]
@@ -180,7 +169,7 @@ hex.c charset.c qe.c qe.h tty.c \
 html.c indic.c unicode_join.c input.c qeconfig.h \
 qeend.c unihex.c arabic.c kmaptoqe.c util.c \
 bufed.c qestyles.h x11.c buffer.c ligtoqe.c \
-qfribidi.c clang.c latex-mode.c xml.c dired.c list.c qfribidi.h html2png.c \
+qfribidi.c clang.c latex-mode.c xml.c dired.c list.c qfribidi.h \
 charsetmore.c charset_table.c cptoqe.c \
 libfbf.c fbfrender.c cfb.c fbftoqe.c libfbf.h fbfrender.h cfb.h \
 display.c display.h mpeg.c shell.c \
@@ -297,10 +286,6 @@ OBJS=util.o cutils.o \
      display.o unicode_join.o charset.o charsetmore.o charset_table.o \
      libfbf.o fbfrender.o cfb.o fbffonts.o
 
-html2png: html2png.o $(OBJS) libqhtml/libqhtml.a
-	$(HOST_CC) $(LDFLAGS) -o $@ html2png.o $(OBJS) \
-                   -L./libqhtml -lqhtml $(HTMLTOPPM_LIBS)
-
 # autotest target
 test:
 	make -C tests test
diff --git a/configure b/configure
index 389c52f..dce7ead 100755
--- a/configure
+++ b/configure
@@ -286,7 +286,7 @@ echo "CC=$cc" >> config.mak
 echo "GCC_MAJOR=$gcc_major" >> config.mak
 echo "HOST_CC=$host_cc" >> config.mak
 echo "AR=$ar" >> config.mak
-echo "STRIP=$strip -s -R .comment -R .note" >> config.mak
+echo "STRIP=$strip" >> config.mak
 echo "CFLAGS=$CFLAGS" >> config.mak
 echo "LDFLAGS=$LDFLAGS" >> config.mak
 if test "$cpu" = "x86" ; then
diff --git a/hex.c b/hex.c
index 9c4c8cb..abf5458 100644
--- a/hex.c
+++ b/hex.c
@@ -294,40 +294,40 @@ void hex_mode_line(EditState *s, char *buf, int buf_size)
 
 ModeDef ascii_mode = { 
     "ascii", 
-    instance_size: 0,
-    mode_probe: NULL,
-    mode_init: ascii_mode_init, 
-    mode_close: text_mode_close,
-    text_display: hex_display, 
-    text_backward_offset: hex_backward_offset,
-    
-    move_up_down: hex_move_up_down,
-    move_left_right: hex_move_left_right,
-    move_bol: hex_move_bol,
-    move_eol: hex_move_eol,
-    scroll_up_down: text_scroll_up_down,
-    write_char: text_write_char,
-    mouse_goto: text_mouse_goto,
-    mode_line: hex_mode_line,
+   .instance_size = 0,
+   .mode_probe = NULL,
+   .mode_init = ascii_mode_init, 
+   .mode_close = text_mode_close,
+   .text_display = hex_display, 
+   .text_backward_offset = hex_backward_offset,
+
+   .move_up_down = hex_move_up_down,
+   .move_left_right = hex_move_left_right,
+   .move_bol = hex_move_bol,
+   .move_eol = hex_move_eol,
+   .scroll_up_down = text_scroll_up_down,
+   .write_char = text_write_char,
+   .mouse_goto = text_mouse_goto,
+   .mode_line = hex_mode_line,
 };
 
 ModeDef hex_mode = {
     "hex", 
-    instance_size: 0,
-    mode_probe: hex_mode_probe,
-    mode_init: hex_mode_init, 
-    mode_close: text_mode_close,
-    text_display: hex_display, 
-    text_backward_offset: hex_backward_offset,
-
-    move_up_down: hex_move_up_down,
-    move_left_right: hex_move_left_right,
-    move_bol: hex_move_bol,
-    move_eol: hex_move_eol,
-    scroll_up_down: text_scroll_up_down,
-    write_char: hex_write_char,
-    mouse_goto: text_mouse_goto,
-    mode_line: hex_mode_line,
+   .instance_size = 0,
+   .mode_probe = hex_mode_probe,
+   .mode_init = hex_mode_init, 
+   .mode_close = text_mode_close,
+   .text_display = hex_display, 
+   .text_backward_offset = hex_backward_offset,
+
+   .move_up_down = hex_move_up_down,
+   .move_left_right = hex_move_left_right,
+   .move_bol = hex_move_bol,
+   .move_eol = hex_move_eol,
+   .scroll_up_down = text_scroll_up_down,
+   .write_char = hex_write_char,
+   .mouse_goto = text_mouse_goto,
+   .mode_line = hex_mode_line,
 };
 
 static int hex_init(void)
diff --git a/qe.c b/qe.c
index db53f1a..095a508 100644
--- a/qe.c
+++ b/qe.c
@@ -5877,22 +5877,22 @@ void text_mode_close(EditState *s)
 
 ModeDef text_mode = {
     "text", 
-    instance_size: 0,
-    mode_probe: text_mode_probe,
-    mode_init: text_mode_init,
-    mode_close: text_mode_close,
-
-    text_display: text_display,
-    text_backward_offset: text_backward_offset, 
-
-    move_up_down: text_move_up_down,
-    move_left_right: text_move_left_right_visual,
-    move_bol: text_move_bol,
-    move_eol: text_move_eol,
-    move_word_left_right: text_move_word_left_right,
-    scroll_up_down: text_scroll_up_down,
-    write_char: text_write_char,
-    mouse_goto: text_mouse_goto,
+   .instance_size = 0,
+   .mode_probe = text_mode_probe,
+   .mode_init = text_mode_init,
+   .mode_close = text_mode_close,
+
+   .text_display = text_display,
+   .text_backward_offset = text_backward_offset, 
+
+   .move_up_down = text_move_up_down,
+   .move_left_right = text_move_left_right_visual,
+   .move_bol = text_move_bol,
+   .move_eol = text_move_eol,
+   .move_word_left_right = text_move_word_left_right,
+   .scroll_up_down = text_scroll_up_down,
+   .write_char = text_write_char,
+   .mouse_goto = text_mouse_goto,
 };
 
 ModeDef minibuffer_mode;
@@ -6159,7 +6159,7 @@ static void show_help(void)
 
 static CmdOptionDef cmd_options[] = {
     { "h", NULL, 0, "show help", 
-      {func_noarg: show_help}},
+      {.func_noarg = show_help}},
     { NULL },
 };
 
diff --git a/qe.h b/qe.h
index 043af84..2aa34ca 100644
--- a/qe.h
+++ b/qe.h
@@ -578,8 +578,8 @@ extern EditBufferDataType raw_data_type;
 #undef __attribute__ 
 
 /* same method as the linux kernel... */
-#define __init_call	__attribute__ ((unused,__section__ (".initcall.init")))
-#define __exit_call	__attribute__ ((unused,__section__ (".exitcall.exit")))
+#define __init_call	__attribute__ ((section("unused,.initcall.init")))
+#define __exit_call	__attribute__ ((section("unused,.exitcall.init")))
 
 #define qe_module_init(fn) \
 	int (*__initcall_##fn)(void) __init_call = fn
diff --git a/tty.c b/tty.c
index 2e84b20..b447eb7 100644
--- a/tty.c
+++ b/tty.c
@@ -362,9 +362,9 @@ static void tty_read_handler(void *opaque)
 static inline int color_dist(unsigned int c1, unsigned c2)
 {
 
-    return (abs( (c1 & 0xff) - (c2 & 0xff)) +
-            2 * abs( ((c1 >> 8) & 0xff) - ((c2 >> 8) & 0xff)) +
-            abs( ((c1 >> 16) & 0xff) - ((c2 >> 16) & 0xff)));
+    return ( (c1 & 0xff) - (c2 & 0xff) +
+            2 *  ((c1 >> 8) & 0xff) - ((c2 >> 8) & 0xff) +
+            ((c1 >> 16) & 0xff) - ((c2 >> 16) & 0xff));
 }
 
 #define NB_COLORS 8
diff --git a/unihex.c b/unihex.c
index f3be869..74b0c1e 100644
--- a/unihex.c
+++ b/unihex.c
@@ -152,20 +152,20 @@ void unihex_move_up_down(EditState *s, int dir)
 
 ModeDef unihex_mode = {
     "unihex", 
-    instance_size: 0,
-    mode_probe: NULL,
-    mode_init: unihex_mode_init, 
-    mode_close: text_mode_close,
-    text_display: unihex_display, 
-    text_backward_offset: unihex_backward_offset,
-
-    move_up_down: unihex_move_up_down,
-    move_left_right: unihex_move_left_right,
-    move_bol: unihex_move_bol,
-    move_eol: unihex_move_eol,
-    scroll_up_down: text_scroll_up_down,
-    write_char: hex_write_char,
-    mouse_goto: text_mouse_goto,
+   .instance_size = 0,
+   .mode_probe = NULL,
+   .mode_init = unihex_mode_init, 
+   .mode_close = text_mode_close,
+   .text_display = unihex_display, 
+   .text_backward_offset = unihex_backward_offset,
+
+   .move_up_down = unihex_move_up_down,
+   .move_left_right = unihex_move_left_right,
+   .move_bol = unihex_move_bol,
+   .move_eol = unihex_move_eol,
+   .scroll_up_down = text_scroll_up_down,
+   .write_char = hex_write_char,
+   .mouse_goto = text_mouse_goto,
 };
 
 
