# Scons Formula
#
# Copyright (c) 2011-2014 Rudix
# Authors: Caio Begotti
#

Scons = $(shell which scons)
SconsExtra = CFLAGS="$(CFlags)" CXXFLAGS="$(CxxFlags)" LDFLAGS="$(LdFlags)"

define build_inner_hook
cd $(BuildDir) && $(Scons) $(SconsExtra)
endef

# http://wiki.gentoo.org/wiki/SCons#Why_you_should_NOT_use_SCons_in_your_project
define install_inner_hook
cd $(BuildDir) && $(Scons) install --prefix=$(DestDir)$(Prefix) --full
$(install_base_documentation)
endef

ifeq ($(RUDIX_RUN_ALL_TESTS),yes)
define check_inner_hook
cd $(BuildDir) && $(Scons) test || $(call error_color,One or more tests failed)
endef
endif

buildclean:
	cd $(BuildDir) && $(Scons) . --keep-going --clean || $(call warning_color,Cannot clean)
	rm -f build check .sconf_temp .sconsign.dblite config.log
