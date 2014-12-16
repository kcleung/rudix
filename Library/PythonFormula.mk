#
# Python Formula.
#
# Copyright © 2011-2014 Rudix
# Authors: Rudá Moura, Leonardo Santagada
#

EnvExtra = CFLAGS="$(CFlags)" \
	   CXXFLAGS="$(CxxFlags)" \
	   LDFLAGS="$(LdFlags)" \
	   ARCHFLAGS="$(ArchFlags)"

define build_inner_hook
cd $(BuildDir) && \
env $(EnvExtra) $(Python) setup.py $(SetupExtra) build
endef

define install_inner_hook
cd $(BuildDir) && \
$(Python) \
	setup.py install $(SetupInstallExtra) \
	--no-compile \
	--root=$(DestDir) \
	--prefix=$(Prefix) \
	--install-lib=$(PythonSitePackages)
cd $(BuildDir) && $(Python) -m compileall -d / $(DestDir)
$(install_base_documentation)
endef

ifeq ($(RUDIX_RUN_ALL_TESTS),yes)
define check_inner_hook
cd $(BuildDir) && \
$(Python) setup.py test || $(call error_color,One or more tests failed)
endef
endif

buildclean:
	cd $(BuildDir) && $(Python) setup.py clean || $(call warning_color,Cannot clean)
	rm -f build check
