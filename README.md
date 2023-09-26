# Hello-gettext

## 1. create the `hello.pot` file.

``` shell
xgettext --keyword=_ --language=C --add-comments --sort-output -o po/hello.pot hello.c
```
## 2. create the Japanese translation of it.

``` shell
msginit --input=po/hello.pot --locale=ja --output=po/ja/hello.po
```
