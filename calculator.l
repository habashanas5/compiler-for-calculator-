%{
#include "calculator.tab.h"
int l = 0; // Declare and initialize l
%}

%%

[0-9]+ { yylval.num = atoi(yytext); return NUMBER; }
[ \t]  { /* Ignore whitespace */ }
\n     { return '\n'; }
.      { return yytext[0]; }
[-+/*()] { return *yytext; }

%%

int yywrap(void) {
    return l;
}

