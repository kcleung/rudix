BuildRequires += $(BinDir)/pcre-config # static-pcre

include ../../Library/GNU.mk

Title=		Lighttpd
Name=		lighttpd
Version=	1.4.35
Revision=	0
Site=		http://www.lighttpd.net
URL=		http://download.lighttpd.net/lighttpd/releases-1.4.x/
Source=		$(Name)-$(Version).tar.bz2
License=	BSD

GnuConfigureExtra += --with-openssl
GnuConfigureExtra += --libdir=$(LibDir)/lighttpd

define install_post_hook
install -d $(InstallDir)/$(SysConfDir)/lighttpd
install -d $(InstallDir)/$(LocalStateDir)/{www,log/lighttpd,run}
install -m 644 lighttpd.conf.default $(InstallDir)/$(SysConfDir)/lighttpd
endef

define test_inner_hook
$(SBinDir)/lighttpd -V | grep "$(Version).*(ssl)"
endef
