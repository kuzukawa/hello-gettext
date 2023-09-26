# Hello-gettext

## 1. create the `hello.pot` file.

``` shell
xgettext --keyword=_ --language=C --add-comments --sort-output -o po/hello.pot hello.c
```
