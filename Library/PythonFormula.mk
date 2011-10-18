# PythonFormula.mk - Formula to build Python projects
# Copyright (c) 2011 Ruda Moura
# Authors: Ruda Moura, Leonardo Santagada

#
# Python versions
#
# Default
Python = $(Python2.6)
PythonSitePackages = $(PythonSitePackages2.6)
# 2.7
Python2.7 = /usr/bin/python2.7
PythonSitePackages2.7 = /Library/Python/2.7/site-packages
# 2.6
Python2.6 = /usr/bin/python2.6
PythonSitePackages2.6 = /Library/Python/2.6/site-packages

define build_inner_hook
cd $(BuildDir) ; \
env CFLAGS="$(CFlags)" \
	CXXFLAGS="$(CxxFlags)" \
	LDFLAGS="$(LdFlags)" \
	ARCHFLAGS="$(ArchFlags)" $(EnvExtra) \
$(Python) setup.py build $(SetupExtra)
endef

define install_inner_hook
cd $(BuildDir) ; \
$(Python) setup.py install $(SetupInstallExtra) \
	--no-compile \
	--root=$(PortDir)/$(InstallDir) \
	--prefix=$(Prefix) \
	--install-lib=$(PythonSitePackages)
cd $(BuildDir) ; \
$(Python) -m compileall -d / $(PortDir)/$(InstallDir)
$(install_base_documentation)
endef

define test_inner_hook
$(call test_universal)
endef
