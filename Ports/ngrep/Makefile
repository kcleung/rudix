include ../../Library/GNU.mk

Description=    ngrep provides a grep-like interface to the network layer
Title=		ngrep
Name=		ngrep
Version=	1.45
Revision=	0
Site=		http://ngrep.sourceforge.net
URL=		http://kent.dl.sourceforge.net/project/ngrep/ngrep/$(Version)/
Source=	        ngrep-$(Version).tar.bz2
License=	BSD like
ReadMeFile=     $(SourceDir)/doc/README.txt
LicenseFile=    $(SourceDir)/LICENSE.txt

ConfigureExtra += --with-pcap-includes=/usr/include/pcap
LdFlags += -lresolv

define prep_post_hook
rm -rf $(SourceDir)/autom4te.cache $(SourceDir)/{.deps,Makefile}
endef

define test_inner_hook
$(SBinDir)/ngrep -V | grep V$(Version)
endef
