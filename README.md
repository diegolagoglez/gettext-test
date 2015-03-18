# Project to test `gettext` localization toolkit

## Compiling

In order to compile this utility, use `make`:

```bash
user@box ~/projects/gettext-test $ make program
```

Type `make` to get help about building the translations strings:

```bash
user@box ~/projects/gettext-test $ make
Usage: make [target]
Targets:
  program        : Constructs the program.
  extractstrings : Extracts localization strings.
  translate      : Init translation to Spanish (\*.po file should be translated).
  compile-po     : Compile translations file.
  install-po     : Installs translations.
```

Source code is in English. Make command starts translation into Spanish
(but must be translated manually and then compiled and then installed).

## Running

Program takes LANG environment variable to show translated strings. If
not translated strings found, it uses English. In order to test if
Spanish is working, launch it as:

```bash
user@box ~/projects/gettext-test $ LANG=es_ES.utf-8 ./gettext-test
```

Localization files for this program should be saved in:

`./locale/es_ES/LC_MESSAGES`

Folder is relative to the folder the program is launched.

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.html)

[Diego Lago González](mailto:diego.lago.gonzalez@gmail.com)

