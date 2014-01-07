
EXE := gettext-test
SRCS := main.cpp
POT_FILE := messages.pot

default:
	@echo Usage: make [target]
	@echo Targets:
	@echo "  all            : Constructs the program."
	@echo "  extractstrings : Extracts localization strings."
	@echo "  translate      : Init translation to Spanish."
	@echo "  compile-po     : Compile translations file."
	@echo "  install-po     : Installs translations."

all:
	g++ -o $(EXE) $(SRCS)

extractstrings:
	xgettext $(SRCS) --package-name "$(EXE) Spanish Translations" --package-version 1.0 --copyright-holder "HP CDS" --keyword=_ --output=$(POT_FILE)

translate:
	msginit --locale=es_ES --input=$(POT_FILE) --output-file=$(EXE).po
	iconv -f ISO-8859-1 -t UTF-8 -o $(EXE).po $(EXE).po

compile-po:
	msgfmt --check --verbose --output-file $(EXE).mo $(EXE).po

install-po:
	mkdir -p ./locale/es_ES/LC_MESSAGES
	cp $(EXE).mo ./locale/es_ES/LC_MESSAGES/

.PHONY: clean run translate extractstrings compile-po install-po

clean:
	rm -rf ./locale
	rm *.o $(EXE) $(EXE).po $(EXE).mo $(POT_FILE)

run: all
	./$(EXE)

