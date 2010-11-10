# Utility to turn simply formatted text into markup
# http://txt2tags.org/
# GPL

include ../../Library/Rules.mk

NAME=		txt2tags
VERSION=	2.6
REVISION=	0
URL=		http://txt2tags.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).tgz

DEPENDS=	/usr/local/bin/msgfmt

prep: retrieve
	tar zxvf $(SOURCE)
	cp $(PORTDIR)/txt2tags.Makefile $(BUILDDIR)/Makefile
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; make
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install install-man
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,ChangeLog,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/*.pdf $(INSTALLDOCDIR)
	install -d $(INSTALLDIR)/usr/local/lib/txt2tags
	cp -av $(BUILDDIR)/extras/* $(INSTALLDIR)/usr/local/lib/txt2tags
	$(TOUCH) install

test: install
	cd $(BUILDDIR)/test ; ./run.py
	$(TOUCH) test
