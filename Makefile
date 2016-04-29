NAME    = build-docbook-catalog
VERSION = 1.20

prefix      ?= /usr/local
exec_prefix ?= $(prefix)
sysconfdir  ?= $(prefix)/etc
bindir      ?= $(exec_prefix)/bin

$(NAME):
	sed -e "s/@@VERSION@@/$(VERSION)/g" $(NAME).in > $(NAME)

install: $(NAME)
	install -d $(DESTDIR)$(bindir)
	install -m 755 $(NAME) $(DESTDIR)$(bindir)

clean:
	-rm -f $(NAME)

all: $(NAME)

.PHONY: all clean install
