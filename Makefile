NAME    = build-docbook-catalog
VERSION = 1.20

prefix      ?= /usr/local
exec_prefix ?= $(prefix)
sysconfdir  ?= $(prefix)/etc
sbindir     ?= $(exec_prefix)/sbin

$(NAME):
	sed -e "s/@@VERSION@@/$(VERSION)/g" $(NAME).in > $(NAME)

install: $(NAME)
	install -d $(DESTDIR)$(sbindir)
	install -m 755 $(NAME) $(DESTDIR)$(sbindir)

dist: $(NAME)
	rm -rf $(P)
	mkdir -p $(P)
	cp -pPR $(NAME) Makefile README $(P)/
	tar --posix --owner 0 --group 0 -cf - $(P) | xz -9 > $(P).tar.xz
	rm -rf $(P)

clean:
	-rm -f $(NAME)

all: $(NAME)

.PHONY: all clean dist install
