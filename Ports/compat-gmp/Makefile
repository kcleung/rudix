include ../../Library/GNU.mk

CFlags=
CxxFlags=
LdFlags=

Title=		GNU MP (Version 4)
Name=		compat-gmp
Version=	4.3.2
Revision=	3
URL=		http://ftp.gnu.org/gnu/gmp/
Source=		gmp-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = gmp-$(Version)

GnuConfigureExtra += --enable-cxx

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

CFLAGS=
LDFLAGS=
CXXFLAGS=
