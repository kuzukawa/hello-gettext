# Hello-gettext

## 1. create the `hello.pot` file.

``` shell
xgettext --keyword=_ --language=C --add-comments --sort-output -o po/hello.pot hello.c
```
## 2. create the Japanese translation of it.

``` shell
msginit --input=po/hello.pot --locale=ja --output=po/ja/hello.po
```

## 3. create `.mo` file.

``` shell
msgfmt --output-file=po/ja/hello.mo po/ja/hello.po
```

## 4. copy `.mo` file to the right place

``` shell
cp -p po/ja/hello.mo ja/LC_MESSAGES/hello.mo
```
## 5. update the PO/POT files

At first, modify our Hello package sources as follow.

``` C
#include <stdio.h>
#include <stdlib.h>
#include <libintl.h>
#include <locale.h>

#define _(STRING) gettext(STRING)

int main() {
  /* Setting the i18n environment */
  setlocale(LC_ALL, "");
  bindtextdomain("hello", getenv("/usr/share/locale"));
  textdomain("hello");

  /* Example of i18n usage */
  printf(_("Hello World\n"));
  puts(_("Good night"));

  return EXIT_SUCCESS;
}
```

We first need to update the `pot` file(as previously).

``` shell
xgettext --keyword=_ --language=C --add-comments --sort-output -o po/hello.pot hello.c
```

