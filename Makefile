# zDmenu - zSph dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c zdmenu.c stest.c util.c
OBJ = $(SRC:.c=.o)

all: zdmenu stest

.c.o:
	$(CC) -c $(CFLAGS) $<

config.h:
	cp config.def.h $@

$(OBJ): arg.h config.h config.mk drw.h

zdmenu: zdmenu.o drw.o util.o
	$(CC) -o $@ zdmenu.o drw.o util.o $(LDFLAGS)

stest: stest.o
	$(CC) -o $@ stest.o $(LDFLAGS)

clean:
	rm -f zdmenu stest $(OBJ) zdmenu-$(VERSION).tar.gz

dist: clean
	mkdir -p zdmenu-$(VERSION)
	cp LICENSE Makefile README.md arg.h config.def.h config.mk zdmenu.1\
		drw.h util.h zdmenu_path zdmenu_run stest.1 $(SRC)\
		zdmenu-$(VERSION)
	tar -cf zdmenu-$(VERSION).tar zdmenu-$(VERSION)
	gzip zdmenu-$(VERSION).tar
	rm -rf zdmenu-$(VERSION)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f zdmenu zdmenu_path zdmenu_run stest $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/zdmenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/zdmenu_path
	chmod 755 $(DESTDIR)$(PREFIX)/bin/zdmenu_run
	chmod 755 $(DESTDIR)$(PREFIX)/bin/stest
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < zdmenu.1 > $(DESTDIR)$(MANPREFIX)/man1/zdmenu.1
	sed "s/VERSION/$(VERSION)/g" < stest.1 > $(DESTDIR)$(MANPREFIX)/man1/stest.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/zdmenu.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/stest.1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/zdmenu\
		$(DESTDIR)$(PREFIX)/bin/zdmenu_path\
		$(DESTDIR)$(PREFIX)/bin/zdmenu_run\
		$(DESTDIR)$(PREFIX)/bin/stest\
		$(DESTDIR)$(MANPREFIX)/man1/zdmenu.1\
		$(DESTDIR)$(MANPREFIX)/man1/stest.1

.PHONY: all clean dist install uninstall