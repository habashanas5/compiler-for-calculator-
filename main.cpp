#include <iostream>
#include "calculator.tab.h"

int main() {
    yyparse();
    return 0;
}

