BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libintl.la

include ../../Library/Config.mk
RUDIX_UNIVERSAL=no

include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

ifdef WITH_STATIC_LIBS
LdFlags += -framework CoreFoundation -liconv
endif

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

Title=		GLib
Name=		glib
Version=	2.28.8
Revision=	0
URL=		http://ftp.gnome.org/pub/GNOME/sources/glib/2.28/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING