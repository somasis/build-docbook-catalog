PN = build-docbook-catalog
PV = $(shell awk '/^\# .Header:/{print $$4;exit}' build-docbook-catalog)
P = $(PN)-$(PV)

all:

EPREFIX =
SYSCONFDIR = $(EPREFIX)/etc
CONFDIR = $(SYSCONFDIR)/xml
PREFIX = $(EPREFIX)/usr
SBINDIR = $(PREFIX)/sbin

install:
	install -d $(DESTDIR)$(SBINDIR)
	install -m 755 build-docbook-catalog $(DESTDIR)$(SBINDIR)

dist:
	rm -rf $(P)
	mkdir -p $(P)
	cp -pPR build-docbook-catalog Makefile README $(P)/
	tar --posix --owner 0 --group 0 -cf - $(P) | xz -9 > $(P).tar.xz
	rm -rf $(P)

.PHONY: all clean dist install
