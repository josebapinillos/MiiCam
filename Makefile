
TOOLCHAINDIR = /usr/src/arm-linux-3.3/toolchain_gnueabi-4.4.0_ARMv5TE/usr/bin
PATH := $(TOOLCHAINDIR):$(PATH)
TARGET = arm-unknown-linux-uclibcgnueabi
BUILDENV :=                     \
	AR=$(TARGET)-ar         \
	AS=$(TARGET)-as         \
	CC=$(TARGET)-gcc        \
	CXX=$(TARGET)-g++       \
	LD=${TARGET}-ld         \
	NM=$(TARGET)-nm         \
	RANLIB=$(TARGET)-ranlib \
	STRIP=$(TARGET)-strip

TOPDIR      := $(CURDIR)
SOURCEDIR   := src
PREFIXDIR   := prefix
BUILDDIR    := build
INSTALLDIR  := sdcard/firmware/bin
DOWNLOADCMD := wget -t 2 -T 10 -c -O

BINS =  smbpasswd smbstatus smbtree smbclient \
	scp dbclient dropbearkey              \
	arm-php arm-php-cgi                   \
	chuangmi_ctrl                         \
	runas                                 \
	rsync                                 \
	gd2togif gd2topng gdparttopng gdtopng giftogd2 pngtogd pngtogd2

SBINS = dropbear \
	lighttpd \
	nmbd     \
	smbd




GMLIBDIR := gm_lib/gm_graph/gm_lib
RTSPDDIR := gm_lib/gm_graph/product/GM8136_1MP/samples
GMSAMPLEDIR := $(GMLIBDIR)/samples

ZLIBVERSION = 1.2.11
ZLIBARCHIVE = zlib-$(ZLIBVERSION).tar.gz
ZLIBURI = https://www.zlib.net/$(ZLIBARCHIVE)

LIBXML2VERSION = 2.9.7
LIBXML2ARCHIVE = libxml2-$(LIBXML2VERSION).tar.gz
LIBXML2URI = http://xmlsoft.org/sources/$(LIBXML2ARCHIVE)

LIBJPEGVERSION = 1.5.2
LIBJPEGARCHIVE = libjpeg-turbo-$(LIBJPEGVERSION).tar.gz
LIBJPEGURI = https://prdownloads.sourceforge.net/libjpeg-turbo/$(LIBJPEGARCHIVE)

LIBPNGVERSION = 1.6.34
LIBPNGARCHIVE = libpng-$(LIBPNGVERSION).tar.gz
LIBPNGURI = https://prdownloads.sourceforge.net/libpng/$(LIBPNGARCHIVE)

LIBGDVERSION = 2.2.4
LIBGDARCHIVE = libgd-$(LIBGDVERSION).tar.gz
LIBGDURI = https://github.com/libgd/libgd/releases/download/gd-$(LIBGDVERSION)/$(LIBGDARCHIVE)

PCREVERSION = 8.41
PCREARCHIVE = pcre-$(PCREVERSION).zip
PCREURI = https://ftp.pcre.org/pub/pcre/$(PCREARCHIVE)

DROPBEARVERSION = 2017.75
DROPBEARARCHIVE = dropbear-$(DROPBEARVERSION).tar.bz2
DROPBEARURI = https://matt.ucc.asn.au/dropbear/releases/$(DROPBEARARCHIVE)

LIGHTTPDVERSION = 1.4.49
LIGHTTPDARCHIVE = lighttpd-$(LIGHTTPDVERSION).tar.gz
LIGHTTPDURI = https://download.lighttpd.net/lighttpd/releases-1.4.x/$(LIGHTTPDARCHIVE)

PHPVERSION = 7.2.0
PHPARCHIVE = php-$(PHPVERSION).tar.bz2
PHPURI = http://php.net/get/$(PHPARCHIVE)/from/this/mirror

SAMBAVERSION = 3.6.25
SAMBAARCHIVE = samba-$(SAMBAVERSION).tar.gz
SAMBAURI = https://download.samba.org/pub/samba/$(SAMBAARCHIVE)

MIJIACTRLVERSION = master
MIJIACTRLARCHIVE = mijia-720p-ctrl-$(MIJIACTRLVERSION).zip
MIJIACTRLURI = https://github.com/cck56/mijia-720p-ctrl/archive/$(MIJIACTRLVERSION).zip

RUNASVERSION = master
RUNASARCHIVE = runas.zip
RUNASURI = https://github.com/remram44/static-sudo/archive/$(RUNASVERSION).zip

RSYNCVERSION = 3.1.3
RSYNCARCHIVE = rsync-$(RSYNCVERSION).tar.gz
RSYNCURI = https://download.samba.org/pub/rsync/src/$(RSYNCARCHIVE)




SAMPLES :=                                             \
	gm_lib/audio_livesound                         \
	gm_lib/audio_playback                          \
	gm_lib/audio_record                            \
	gm_lib/display_with_encode                     \
	gm_lib/encode_and_liveview_with_notification   \
	gm_lib/encode_capture_substream                \
	gm_lib/encode_force_keyframe                   \
	gm_lib/encode_scaler_substream                 \
	gm_lib/encode_update_notification              \
	gm_lib/encode_with_advance_feature             \
	gm_lib/encode_with_av_sync                     \
	gm_lib/encode_with_capture_motion_detection    \
	gm_lib/encode_with_capture_motion_detection2   \
	gm_lib/encode_with_capture_tamper_detection    \
	gm_lib/encode_with_capture_tamper_detection2   \
	gm_lib/encode_with_deinterlace                 \
	gm_lib/encode_with_eptz                        \
	gm_lib/encode_with_getraw                      \
	gm_lib/encode_with_getraw2                     \
	gm_lib/encode_with_osd                         \
	gm_lib/encode_with_roi                         \
	gm_lib/encode_with_snapshot                    \
	gm_lib/encode_with_watermark_and_vui           \
	gm_lib/liveview_with_clearwin                  \
	gm_lib/liveview_with_pip

samples: $(SAMPLES)




.PHONY: all libs fetch-sources

all:                                                   \
	$(BUILDDIR)/dropbear                           \
	$(BUILDDIR)/lighttpd                           \
	$(BUILDDIR)/php                                \
	$(BUILDDIR)/samba                              \
	$(BUILDDIR)/chuangmi_ctrl                      \
	$(BUILDDIR)/runas                              \
	$(BUILDDIR)/rsync                              \
	sdcard/manufacture.bin                         \
	gm_lib/rtspd                                   \
	samples

libs:                                                  \
	$(BUILDDIR)/zlib                               \
	$(BUILDDIR)/libxml2                            \
	$(BUILDDIR)/libjpeg-turbo                      \
	$(BUILDDIR)/libpng                             \
	$(BUILDDIR)/libgd                              \
	$(BUILDDIR)/pcre

fetch-sources:                                         \
	$(SOURCEDIR)/$(ZLIBARCHIVE)                    \
	$(SOURCEDIR)/$(LIBXML2ARCHIVE)                 \
	$(SOURCEDIR)/$(LIBJPEGARCHIVE)                 \
	$(SOURCEDIR)/$(LIBPNGARCHIVE)                  \
	$(SOURCEDIR)/$(LIBGDARCHIVE)                   \
	$(SOURCEDIR)/$(PCREARCHIVE)                    \
	$(SOURCEDIR)/$(DROPBEARARCHIVE)                \
	$(SOURCEDIR)/$(LIGHTTPDARCHIVE)                \
	$(SOURCEDIR)/$(PHPARCHIVE)                     \
	$(SOURCEDIR)/$(SAMBAARCHIVE)                   \
	$(SOURCEDIR)/$(MIJIACTRLARCHIVE)               \
	$(SOURCEDIR)/$(RSYNCARCHIVE)                   \
	$(SOURCEDIR/$(RUNASARCHIVE)




$(SOURCEDIR)/$(ZLIBARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(ZLIBURI)      || rm -f $@

$(SOURCEDIR)/$(LIBXML2ARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(LIBXML2URI)   || rm -f $@

$(SOURCEDIR)/$(LIBJPEGARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(LIBJPEGURI)   || rm -f $@

$(SOURCEDIR)/$(LIBPNGARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(LIBPNGURI)    || rm -f $@

$(SOURCEDIR)/$(LIBGDARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(LIBGDURI)     || rm -f $@

$(SOURCEDIR)/$(PCREARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(PCREURI)      || rm -f $@

$(SOURCEDIR)/$(DROPBEARARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(DROPBEARURI)  || rm -f $@

$(SOURCEDIR)/$(LIGHTTPDARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(LIGHTTPDURI)  || rm -f $@

$(SOURCEDIR)/$(PHPARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(PHPURI)       || rm -f $@

$(SOURCEDIR)/$(SAMBAARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(SAMBAURI)     || rm -f $@

$(SOURCEDIR)/$(MIJIACTRLARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(MIJIACTRLURI) || rm -f $@

$(SOURCEDIR)/$(RSYNCARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(RSYNCURI)     || rm -f $@

$(SOURCEDIR)/$(RUNASARCHIVE):
	mkdir -p $(TOPDIR)/$(SOURCEDIR)   && \
	$(DOWNLOADCMD) $@ $(RUNASURI)     || rm -f $@




$(BUILDDIR)/zlib: $(SOURCEDIR)/$(ZLIBARCHIVE)
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(ZLIBVERSION)
	tar -xzf $(TOPDIR)/$(SOURCEDIR)/$(ZLIBARCHIVE) -C $(TOPDIR)/$(BUILDDIR)
	cd $@-$(ZLIBVERSION) && \
		$(BUILDENV) \
		./configure \
			--prefix=$(TOPDIR)/$(PREFIXDIR) \
			--static && \
		make && \
		make install
	rm -rf $@-$(ZLIBVERSION)
	touch $@

$(BUILDDIR)/libxml2: $(SOURCEDIR)/$(LIBXML2ARCHIVE) $(BUILDDIR)/zlib
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(LIBXML2VERSION)
	tar -xzf $(TOPDIR)/$(SOURCEDIR)/$(LIBXML2ARCHIVE) -C $(TOPDIR)/$(BUILDDIR)
	cd $@-$(LIBXML2VERSION) && \
		$(BUILDENV) \
		ARCH=arm \
		Z_CFLAGS="-DHAVE_ZLIB_H=1 -DHAVE_LIBZ=1 -I$(TOPDIR)/$(PREFIXDIR)/include" \
		./configure \
			--prefix=$(TOPDIR)/$(PREFIXDIR) \
			--host=$(TARGET) \
			--disable-shared \
			--enable-static \
			--with-zlib=$(TOPDIR)/$(PREFIXDIR) \
			--without-python \
			--without-iconv \
			--without-lzma && \
		make && \
		make install
	rm -rf $@-$(LIBXML2VERSION)
	touch $@

$(BUILDDIR)/libjpeg-turbo: $(SOURCEDIR)/$(LIBJPEGARCHIVE)
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(LIBJPEGVERSION)
	tar -xzf $(TOPDIR)/$(SOURCEDIR)/$(LIBJPEGARCHIVE) -C $(TOPDIR)/$(BUILDDIR)
	cd $@-$(LIBJPEGVERSION) && \
		$(BUILDENV) \
		./configure \
			--prefix=$(TOPDIR)/$(PREFIXDIR) \
			--host=$(TARGET) \
			--disable-shared \
			--enable-static && \
		make && \
		make install
	rm -rf $@-$(LIBJPEGVERSION)
	touch $@

$(BUILDDIR)/libpng: $(SOURCEDIR)/$(LIBPNGARCHIVE)
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(LIBPNGVERSION)
	tar -xzf $(TOPDIR)/$(SOURCEDIR)/$(LIBPNGARCHIVE) -C $(TOPDIR)/$(BUILDDIR)
	cd $@-$(LIBPNGVERSION) && \
		$(BUILDENV) \
		LDFLAGS="-L$(TOPDIR)/$(PREFIXDIR)/lib" \
		CPPFLAGS="-I$(TOPDIR)/$(PREFIXDIR)/include" \
		./configure \
			--prefix=$(TOPDIR)/$(PREFIXDIR) \
			--host=$(TARGET) \
			--disable-shared \
			--enable-static && \
		make && \
		make install
	rm -rf $@-$(LIBPNGVERSION)
	touch $@

$(BUILDDIR)/libgd: $(SOURCEDIR)/$(LIBGDARCHIVE) $(BUILDDIR)/zlib $(BUILDDIR)/libjpeg-turbo $(BUILDDIR)/libpng
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(LIBGDVERSION)
	tar -xzf $(TOPDIR)/$(SOURCEDIR)/$(LIBGDARCHIVE) -C $(TOPDIR)/$(BUILDDIR)
	cd $@-$(LIBGDVERSION) && \
		$(BUILDENV) \
		ARCH=arm \
		./configure \
			--prefix=$(TOPDIR)/$(PREFIXDIR) \
			--host=$(TARGET) \
			--disable-shared \
			--enable-static \
			--with-jpeg=$(TOPDIR)/$(PREFIXDIR) \
			--with-png=$(TOPDIR)/$(PREFIXDIR) \
			--with-zlib=$(TOPDIR)/$(PREFIXDIR) \
			--without-tiff \
			--without-freetype \
			--without-fontconfig && \
		make && \
		make install
	rm -rf $@-$(LIBGDVERSION)
	touch $@

$(BUILDDIR)/pcre: $(SOURCEDIR)/$(PCREARCHIVE) $(BUILDDIR)/zlib
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(PCREVERSION)
	unzip -q $(TOPDIR)/$(SOURCEDIR)/$(PCREARCHIVE) -d $(TOPDIR)/$(BUILDDIR)
	cd $@-$(PCREVERSION) && \
		$(BUILDENV) \
		./configure \
			--prefix=$(TOPDIR)/$(PREFIXDIR) \
			--host=$(TARGET) \
			--disable-shared \
			--enable-static && \
		make && \
		make install
	rm -rf $@-$(PCREVERSION)
	touch $@

$(BUILDDIR)/dropbear: $(SOURCEDIR)/$(DROPBEARARCHIVE) $(BUILDDIR)/zlib
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(DROPBEARVERSION)
	tar -xjf $(TOPDIR)/$(SOURCEDIR)/$(DROPBEARARCHIVE) -C $(TOPDIR)/$(BUILDDIR)
	sed -i 's|\(#define DROPBEAR_PATH_SSH_PROGRAM\).*|\1 "/tmp/sd/ft/dbclient"|' $@-$(DROPBEARVERSION)/options.h
	sed -i 's|\(#define DEFAULT_PATH\).*|\1 "/bin:/sbin:/usr/bin:/usr/sbin:/tmp/sd/ft:/mnt/data/ft"|' $@-$(DROPBEARVERSION)/options.h
	cd $@-$(DROPBEARVERSION) && \
		$(BUILDENV) \
		./configure \
			--prefix=$(TOPDIR)/$(PREFIXDIR) \
			--host=$(TARGET) \
			--with-zlib=$(TOPDIR)/$(PREFIXDIR) \
			--disable-wtmp \
			--disable-lastlog && \
		make PROGRAMS="dropbear scp dbclient dropbearkey" MULTI=0 STATIC=1 && \
		make PROGRAMS="dropbear scp dbclient dropbearkey" MULTI=0 STATIC=1 install && \
	rm -rf $@-$(DROPBEARVERSION)
	touch $@

$(BUILDDIR)/lighttpd: $(SOURCEDIR)/$(LIGHTTPDARCHIVE) $(BUILDDIR)/zlib $(BUILDDIR)/pcre
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(LIGHTTPDVERSION)
	tar -xzf $(TOPDIR)/$(SOURCEDIR)/$(LIGHTTPDARCHIVE) -C $(TOPDIR)/$(BUILDDIR)
	for i in access accesslog alias auth authn_file cgi compress deflate dirlisting evasive expire extforward fastcgi flv_streaming indexfile proxy redirect rewrite rrdtool scgi secdownload setenv simple_vhost ssi staticfile status uploadprogress userdir usertrack vhostdb webdav; do \
		echo "PLUGIN_INIT(mod_$$i)" >> $@-$(LIGHTTPDVERSION)/src/plugin-static.h; \
	done
	cd $@-$(LIGHTTPDVERSION) && \
		$(BUILDENV) \
		LIGHTTPD_STATIC=yes \
		CPPFLAGS=-DLIGHTTPD_STATIC \
		./configure \
			--prefix=$(TOPDIR)/$(PREFIXDIR) \
			--host=$(TARGET) \
			--disable-shared \
			--enable-static \
			--with-zlib=$(TOPDIR)/$(PREFIXDIR) \
			--with-pcre=$(TOPDIR)/$(PREFIXDIR) \
			--without-mysql \
			--without-bzip2 && \
		make && \
		make install
	rm -rf $@-$(LIGHTTPDVERSION)
	touch $@

$(BUILDDIR)/php: $(SOURCEDIR)/$(PHPARCHIVE) $(BUILDDIR)/zlib $(BUILDDIR)/libxml2 $(BUILDDIR)/libjpeg-turbo $(BUILDDIR)/libpng $(BUILDDIR)/pcre $(BUILDDIR)/libgd
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(PHPVERSION)
	tar -xjf $(TOPDIR)/$(SOURCEDIR)/$(PHPARCHIVE) -C $(TOPDIR)/$(BUILDDIR)
	sed -i -e '/.*hp_ini_register_extensions.*/d' $@-$(PHPVERSION)/main/main.c
	cd $@-$(PHPVERSION) && \
		$(BUILDENV) \
		LIBS='-ldl' \
		./configure \
			--prefix=$(TOPDIR)/$(PREFIXDIR) \
			--host=$(TARGET) \
			--target=$(TARGET) \
			--program-prefix="arm-" \
			--with-config-file-path=$(TOPDIR)/$(TOOLSDIR)/etc \
			--with-libxml-dir=$(TOPDIR)/$(PREFIXDIR) \
			--with-jpeg-dir=$(TOPDIR)/$(PREFIXDIR) \
			--with-png-dir=$(TOPDIR)/$(PREFIXDIR) \
			--with-zlib-dir=$(TOPDIR)/$(PREFIXDIR) \
			--enable-pdo \
			--enable-simplexml \
			--enable-json \
			--enable-sockets \
			--enable-fpm \
			--enable-libxml \
			--enable-ftp \
			--enable-mbstring \
			--enable-mbregex \
			--enable-mbregex-backtrack \
			--enable-hash \
			--enable-xml \
			--enable-session \
			--enable-soap \
			--enable-tokenizer \
			--enable-xmlreader \
			--enable-xmlwriter \
			--enable-dom \
			--enable-zip \
			--disable-mbregex \
			--disable-opcache \
			--with-mhash \
			--with-pdo-mysql \
			--with-sqlite3 \
			--with-pdo-sqlite \
			--with-xmlrpc \
			--with-zlib \
			--with-pcre-regex \
			--with-pcre-jit \
			--with-gd \
			--with-xpm-dir=no \
			--without-pear \
			--without-xsl \
			--disable-all && \
		make && \
		make install-binaries
	rm -rf $@-$(PHPVERSION)
	touch $@

$(BUILDDIR)/samba: $(SOURCEDIR)/$(SAMBAARCHIVE)
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(SAMBAVERSION)
	tar -xzf $(TOPDIR)/$(SOURCEDIR)/$(SAMBAARCHIVE) -C $(TOPDIR)/$(BUILDDIR)
	cd $@-$(SAMBAVERSION)/source3 && \
		$(BUILDENV) \
		./autogen.sh && \
		./configure \
			--prefix=$(TOPDIR)/$(PREFIXDIR) \
			--host=$(TARGET) \
			--target=$(TARGET) \
			--disable-shared \
			--enable-static \
			--enable-swat=no \
			--enable-shared-libs=no \
			--disable-cups \
			--with-configdir=/tmp/sd/firmware/etc \
			--with-nmbdsocketdir=/tmp/sd/firmware/tmp/samba \
			--with-winbind=no \
			--with-sys-quotas=no \
			--without-krb5 \
			--without-ldap \
			--without-ads \
			libreplace_cv_HAVE_GETADDRINFO=no \
			ac_cv_file__proc_sys_kernel_core_pattern=yes \
			samba_cv_USE_SETRESUID=yes \
			samba_cv_CC_NEGATIVE_ENUM_VALUES=yes && \
		for i in smbd nmbd smbpasswd; do \
			make bin/$$i; \
		done && \
		make installservers && \
		make installbin
	rm -rf $@-$(SAMBAVERSION)
	touch $@

$(BUILDDIR)/chuangmi_ctrl: $(SOURCEDIR)/$(MIJIACTRLARCHIVE)
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $(TOPDIR)/$(BUILDDIR)/mijia-720p-ctrl-$(MIJIACTRLVERSION) && \
	unzip $(TOPDIR)/$(SOURCEDIR)/$(MIJIACTRLARCHIVE) -d $(TOPDIR)/$(BUILDDIR)                          && \
	cd $(TOPDIR)/$(BUILDDIR)/mijia-720p-ctrl-$(MIJIACTRLVERSION)                                       && \
	make                                                                                               && \
	cp mijia_ctrl $(TOPDIR)/$(PREFIXDIR)/bin/chuangmi_ctrl                                             && \
	rm -rf $(TOPDIR)/$(BUILDDIR)/mijia-720p-ctrl-$(MIJIACTRLVERSION)                                   && \
	cd $(TOPDIR)                                                                                       && \
	touch $@

$(BUILDDIR)/runas: $(SOURCEDIR)/$(RUNASARCHIVE)
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $(TOPDIR)/$(BUILDDIR)/static-sudo-$(RUNASVERSION)         && \
	unzip $(TOPDIR)/$(SOURCEDIR)/$(RUNASARCHIVE) -d $(TOPDIR)/$(BUILDDIR)                              && \
	cd $(TOPDIR)/$(BUILDDIR)/static-sudo-$(RUNASVERSION)                                               && \
	$(TARGET)-gcc -static -W -Wall -Wextra -Werror -pedantic rpzsudo.c -o runas                        && \
        cp runas $(TOPDIR)/$(PREFIXDIR)/bin/runas                                                          && \
	rm -rf $(TOPDIR)/$(BUILDDIR)/static-sudo-$(RUNASVERSION)                                           && \
	cd $(TOPDIR)                                                                                       && \
	touch $@

$(BUILDDIR)/rsync: $(SOURCEDIR)/$(RSYNCARCHIVE)
	mkdir -p $(TOPDIR)/$(BUILDDIR) && rm -rf $@-$(RSYNCVERSION)                                        && \
	tar -xzf $(TOPDIR)/$(SOURCEDIR)/$(RSYNCARCHIVE) -C $(TOPDIR)/$(BUILDDIR)                           && \
	cd $@-$(RSYNCVERSION)                                                                              && \
		$(BUILDENV)                                   \
		./configure CFLAGS="-static" EXEEXT="-static" \
                        --host=$(TARGET)                      \
                        --target=$(TARGET)                                                                 && \
		make                                                                                       && \
        cp rsync $(TOPDIR)/$(PREFIXDIR)/bin/rsync                                                          && \
	rm -rf $(TOPDIR)/$(BUILDDIR)/$@-$(RSYNCVERSION)                                                    && \
	cd $(TOPDIR)                                                                                       && \
	touch $@




sdcard/manufacture.bin:
	tar -cf $(TOPDIR)/sdcard/manufacture.bin manufacture/test_drv

gm_lib/rtspd:
	$(TARGET)-gcc -Wall -I$(GMLIBDIR)/inc $(RTSPDDIR)/$(@F).c $(RTSPDDIR)/librtsp.a -L$(GMLIBDIR)/lib -lpthread -lm -lrt -lgm -o $@


$(SAMPLES):
	$(TARGET)-gcc -Wall -I$(GMLIBDIR)/inc -L$(GMLIBDIR)/lib -lpthread -lgm $(GMSAMPLEDIR)/$(@F).c -o $@




.PHONY: install uninstall images clean

install: all
	mkdir -p $(TOPDIR)/$(INSTALLDIR)                                                                                                   && \
	echo "*** Moving binaries to $(TOPDIR)/$(INSTALLDIR)"                                                                              && \
	cd $(TOPDIR)/$(PREFIXDIR)/bin && cp $(BINS) $(TOPDIR)/$(INSTALLDIR)                                                                && \
	cd $(TOPDIR)/$(PREFIXDIR)/sbin && cp $(SBINS) $(TOPDIR)/$(INSTALLDIR)                                                              && \
	cd $(TOPDIR)/gm_lib && find . -maxdepth 1 -type f -not -name 'README' -not -name 'gm_graph' -exec cp {} $(TOPDIR)/$(INSTALLDIR) \; && \
	echo "*** Stripping binaries"                                                                                                      && \
	$(TARGET)-strip $(TOPDIR)/$(INSTALLDIR)/*

uninstall:
	cd $(TOPDIR)/                                                                                                                      && \
	rm -f chuangmi-720p-hack.tgz chuangmi-720p-hack.zip                                                                                && \
	rm -rf $(TOPDIR)/$(INSTALLDIR) $(TOPDIR)/$(SOURCEDIR) $(TOPDIR)/$(PREFIXDIR) $(TOPDIR)/$(BUILDDIR)                                 && \
	cd $(TOPDIR)/ && find gm_lib -maxdepth 1 -type f -not -name 'README' | xargs rm -f

images: install
	echo "*** Creating archive of sdcard/ to image.tgz"                                                                                && \
	zip -r --quiet chuangmi-720p-hack.zip README.md sdcard                                                                             && \
	tar czf chuangmi-720p-hack.tgz -C $(TOPDIR) README.md sdcard                                                                       && \
	echo "*** chuangmi-720p-hack.zip and chuangmi-720p-hack.tgz created"

clean:
	rm -rf $(TOPDIR)/$(INSTALLDIR) $(TOPDIR)/$(SOURCEDIR) $(TOPDIR)/$(PREFIXDIR) $(TOPDIR)/$(BUILDDIR)                                 && \
	cd $(TOPDIR)/ && find gm_lib -maxdepth 1 -type f -not -name 'README' | xargs rm -f

