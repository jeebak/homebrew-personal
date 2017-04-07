class SpaceNerdsInSpace < Formula
  desc "gtk/linux opengl open source multi-player networked spaceship bridge simulator."
  homepage "http://smcameron.github.io/space-nerds-in-space"
  url "https://github.com/smcameron/space-nerds-in-space", :using => GitDownloadStrategy
  version "current"

  depends_on "pkg-config" => :build

  # brew cask install openscad
  # NOPE: depends_on "Caskroom/cask/openscad"
  # NOPE: depends_on cask: "openscad"
  # NOPE: depends_on :cask => "openscad"

  depends_on "glew"
  depends_on "gtkglext"
  depends_on "lua"
  depends_on "openssl"
  depends_on "sdl"
  # This file started out as a copy of the wordwarvi Formula, so the depdencies
  # below could probably be trimmed down. The a are dependencies are required
  # for this Formula
  depends_on "gtk+"
  depends_on "pango"
  depends_on "glib"
  depends_on "cairo"
  depends_on "pixman"     => :build
  depends_on "fontconfig" => :build
  depends_on "freetype"   => :build
  depends_on "libpng"     => :build
  depends_on "harfbuzz"   => :build
  depends_on "gdk-pixbuf"
  depends_on "atk"

  depends_on "portaudio"
  depends_on "libvorbis"

  patch :DATA

  def install
    # Resolve cask dependencies :/
    system "/usr/local/bin/brew", "cask", "install", "openscad"
    system "make", "PREFIX=#{prefix}", "install"
    # bin.install "#{prefix}/games/snis"
  end

  test do
    system "#{bin}/snis", "--version"
  end
end

# The OSX version of pthread_setname_np() only takes one arg
# The "-ltr" was removed from two Makefiles
# The ${PROG} seems to have been in the git root, not under bin/
# Comment out: ${INSTALL} -m 644 ${DOCKING_PORT_FILES} ${MODELDIR}

__END__
diff --git a/Makefile b/Makefile
index ae5c9c6..07674e0 100644
--- a/Makefile
+++ b/Makefile
@@ -7,7 +7,7 @@ WITHAUDIO=yes
 OSX=0
 
 ifeq (${OSX},0)
-LRTLIB=-lrt
+LRTLIB=
 else
 LRTLIB=
 endif
@@ -302,7 +302,7 @@ MANDIR=${DESTDIR}/${PREFIX}/share/man/man6
 DESKTOPDIR=${DESTDIR}/${PREFIX}/share/applications
 DESKTOPSRCDIR=.
 DESKTOPFILES=${DESKTOPSRCDIR}/snis.desktop
-UPDATE_DESKTOP=update-desktop-database ${DESKTOPDIR} || :
+# UPDATE_DESKTOP=update-desktop-database ${DESKTOPDIR} || :
 
 CC=gcc
 
@@ -500,7 +500,7 @@ LIMCLIENTLINK=$(CC) ${MYCFLAGS} ${SNDFLAGS} -o $@ ${GTKCFLAGS} ${LIMCLIENTOBJS}
 SDLCLIENTLINK=$(CC) ${MYCFLAGS} ${SNDFLAGS} -o $@ ${SDLCFLAGS} ${SDLCLIENTOBJS} ${SDLLIBS} ${LIBS} ${SNDLIBS} && $(ECHO) '  LINK' $@
 SERVERLINK=$(CC) ${MYCFLAGS} -o $@ ${SERVEROBJS} ${SERVERLIBS} && $(ECHO) '  LINK' $@
 MULTIVERSELINK=$(CC) ${MYCFLAGS} -o $@ ${MULTIVERSEOBJS} ${MULTIVERSELIBS} && $(ECHO) '  LINK' $@
-OPENSCAD=openscad -o $@ $< && $(ECHO) '  OPENSCAD' $<
+OPENSCAD=/usr/local/bin/openscad -o $@ $< && $(ECHO) '  OPENSCAD' $<
 EXTRACTSCADPARAMS=$(AWK) -f extract_scad_params.awk $< > $@ && $(ECHO) '  EXTRACT THRUST ATTACHMENTS' $@
 EXTRACTDOCKINGPORTS=$(AWK) -f extract_docking_ports.awk $< > $@ && $(ECHO) '  EXTRACT DOCKING PORTS' $@
 
@@ -993,7 +993,7 @@ install:	${PROGS} ${MODELS} ${AUDIOFILES} ${TEXTURES} \
 	mkdir -p ${DESTDIR}/${PREFIX}/bin
 	${INSTALL} -m 755 ssgl/ssgl_server ${DESTDIR}/${PREFIX}/bin
 	for x in ${PROGS} ${ESSENTIAL_SCRIPTS} ; do \
-		${INSTALL} -m 755 bin/$$x \
+		${INSTALL} -m 755 $$x \
 				${DESTDIR}/${PREFIX}/bin; \
 	done
 	for d in ${MATERIALDIR} ${LUASCRIPTDIR} ${SHADERDIR} ${SOUNDDIR} \
@@ -1019,14 +1019,15 @@ install:	${PROGS} ${MODELS} ${AUDIOFILES} ${TEXTURES} \
 	${INSTALL} -m 644 ${MODELSRCDIR}/wombat/snis3006.mtl ${MODELDIR}/wombat
 	${INSTALL} -m 644 ${MODELSRCDIR}/wombat/snis3006.obj ${MODELDIR}/wombat
 	${INSTALL} -m 644 ${MODELSRCDIR}/wombat/snis3006.png ${MODELDIR}/wombat
-	${INSTALL} -m 644 ${DOCKING_PORT_FILES} ${MODELDIR}
-	${INSTALL} -m 644 ${SCAD_PARAMS_FILES} ${MODELDIR}
+	# The ${DOCKING_PORT_FILES} and ${SCAD_PARAMS_FILES} are not found
+	# ${INSTALL} -m 644 ${DOCKING_PORT_FILES} ${MODELDIR}
+	# ${INSTALL} -m 644 ${SCAD_PARAMS_FILES} ${MODELDIR}
 	${INSTALL} -m 644 ${SHADERS} ${SHADERDIR}
 	mkdir -p ${MANDIR}
 	${INSTALL} -m 644 ${MANPAGES} ${MANDIR}
 	mkdir -p ${DESKTOPDIR}
 	${INSTALL} -m 644 ${DESKTOPFILES} ${DESKTOPDIR}
-	${UPDATE_DESKTOP}
+	# ${UPDATE_DESKTOP}
 
 uninstall:
 	@# check that PREFIX is sane
@@ -1054,7 +1055,7 @@ uninstall:
 	rm -f ${MANDIR}/earthlike.1.gz ${MANDIR}/earthlike.1
 	rm -f ${MANDIR}/gaseous-giganticus.1.gz ${MANDIR}/gaseous-giganticus.1
 	rm -f ${DESKTOPDIR}/snis.desktop
-	${UPDATE_DESKTOP}
+	# ${UPDATE_DESKTOP}
 
 clean:	mostly-clean
 	rm -f ${MODELS} test_marshal test_crater
diff --git a/pthread_util.c b/pthread_util.c
index fc49822..a554c0e 100644
--- a/pthread_util.c
+++ b/pthread_util.c
@@ -45,6 +45,6 @@ int create_thread(pthread_t *thread,  void *(*start_routine) (void *), void *arg
 		rc = pthread_create(thread, NULL, start_routine, arg);
 	}
 	if (!rc && name)
-		pthread_setname_np(*thread, thread_name);
+		pthread_setname_np(thread_name);
 	return rc;
 }
diff --git a/ssgl/Makefile b/ssgl/Makefile
index 97790ae..d731d7c 100644
--- a/ssgl/Makefile
+++ b/ssgl/Makefile
@@ -55,8 +55,8 @@ ifeq (${OSX},1)
 LINKFLAGS=
 LRTFLAGS=
 else
-LINKFLAGS=-lrt
-LRTFLAGS=-lrt
+LINKFLAGS=
+LRTFLAGS=
 endif
 
 COMPILE=$(CC) ${MYCFLAGS} -c -o $@ $< && $(ECHO) '  COMPILE' $<
diff --git a/ssgl/ssgl_register_gameserver.c b/ssgl/ssgl_register_gameserver.c
index f829ffb..f1eeb10 100644
--- a/ssgl/ssgl_register_gameserver.c
+++ b/ssgl/ssgl_register_gameserver.c
@@ -68,7 +68,7 @@ static void *update_lobby_thread(void *arg)
 
 	free(arg);
 
-	pthread_setname_np(*thread, "ssgl-lobby");
+	pthread_setname_np("ssgl-lobby");
 	while (1) {
 		lobbysock = ssgl_gameserver_connect_to_lobby(lobbyhost);
 		if (lobbysock < 0) {
diff --git a/ssgl/ssgl_server.c b/ssgl/ssgl_server.c
index e861d7d..8f0ab91 100644
--- a/ssgl/ssgl_server.c
+++ b/ssgl/ssgl_server.c
@@ -257,7 +257,7 @@ static void *expire_game_servers(__attribute__((unused)) void *arg)
 	int i, j;
 	struct timeval tv;
 
-	pthread_setname_np(expiry_thread, "ssgl-expiry");
+	pthread_setname_np("ssgl-expiry");
 	ssgl_log(SSGL_INFO, "ssgl_server: game server expiration thread started.\n");
 	while (1) { /* TODO, replace this with some condition... */
 		(void) gettimeofday(&tv, NULL);
@@ -375,7 +375,7 @@ static void *service_thread(void *arg)
 
 	char threadname[16];
 	snprintf(threadname, sizeof(threadname), "ssglcon-%d", connection);
-	pthread_setname_np(threadinfo->thread, threadname);
+	pthread_setname_np(threadname);
 
 	/* Get the SSGL protocol version number from connection
 	 * and make sure it's a version we understand.
