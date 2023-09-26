CC = clang
CFLAGS = -Wall -Wextra -std=c99 -g
CPPFLAGS = -I. -I/opt/homebrew/include -L/opt/homebrew/lib -lintl
LDFLAGS =

EXEC = hello

all: $(EXEC) po/ja/$(EXEC).mo

$(EXEC): $(EXEC).c 
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $< $(LDFLAGS)

po/ja/$(EXEC).mo: po/ja/$(EXEC).po
	msgfmt --output-file=$@ $<

po/ja/$(EXEC).po: po/$(EXEC).pot
	msgmerge --update $@ $<

po/$(EXEC).pot: $(EXEC).c
	xgettext -k_ -j -lC -c -s -o po/hello.pot hello.c

clean:
	@rm -f $(EXEC) po/ja/*.mo *~

.PHONY: clean
