include ../../Library/Config.mk
RUDIX_UNIVERSAL=no
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		GNU MP (Library)
Name=		libgmp
Version=	5.0.5
Revision=	0
URL=		http://ftp.gnu.org/gnu/gmp/
Source=		gmp-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = gmp-$(Version)

#GnuConfigureExtra += --enable-fat=yes
GnuConfigureExtra += --disable-cxx --disable-static

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
