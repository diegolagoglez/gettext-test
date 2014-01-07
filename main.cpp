#include <iostream>

#define _(STRING) gettext(STRING)

using namespace std;

#include <locale.h>
#include <libintl.h>

#define PROGRAM_NAME "gettext-test"

void
setup_locale() {
	setlocale(LC_ALL, "");
	bindtextdomain(PROGRAM_NAME, "./locale");
	textdomain(PROGRAM_NAME);
}

int
main() {
	setup_locale();
	cout << _("Hello world!") << endl;
	cout << _("Gnu") << endl;
	return 0;
}

