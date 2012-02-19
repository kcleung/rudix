# GNUFormula.mk - Build software in GNU Style (with help of configure)
# Copyright (c) 2011-2012 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada

ifeq ($(RUDIX_ENABLE_NLS),yes)
GnuConfigureExtra += --enable-nls
BuildRequires += /usr/local/lib/libintl.la
else ifeq ($(RUDIX_ENABLE_NLS),no)
GnuConfigureExtra += --disable-nls
endif

define install_gnu_documentation
for x in $(wildcard \
	$(BuildDir)/AUTHORS* \
	$(BuildDir)/ACKS* \
	$(BuildDir)/CHANGES* \
	$(BuildDir)/COPYING* \
	$(BuildDir)/CREDITS* \
	$(BuildDir)/NOTICE* \
	$(BuildDir)/README* \
	$(BuildDir)/INSTALL* \
	$(BuildDir)/NEWS* \
	$(BuildDir)/LICENSE* \
	$(BuildDir)/ChangeLog*) ; do \
	install -m 644 $$x $(PortDir)/$(InstallDir)/$(DocDir)/$(Name) ; \
done
rm -f $(InstallDir)/$(InfoDir)/dir
rm -f $(InstallDir)/$(LibDir)/charset.alias
rm -f $(InstallDir)/$(DataDir)/locale/locale.alias
endef

define build_inner_hook
$(call info_color,Running Configure)
cd $(BuildDir) ; \
env CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)" $(EnvExtra) \
$(gnu_configure)
$(call info_color,Done)
cd $(BuildDir) ; $(make) $(MakeExtra)
endef

define install_inner_hook
cd $(BuildDir) ; \
$(make) install DESTDIR="$(PortDir)/$(InstallDir)" $(MakeInstallExtra)
$(install_base_documentation)
$(install_gnu_documentation)
endef

define test_inner_hook
$(call test_universal)
cd $(BuildDir) ; $(make) check || $(call error_color,One or more tests failed)
endef

buildclean:
	cd $(BuildDir) ; $(make) clean
	rm -f build
