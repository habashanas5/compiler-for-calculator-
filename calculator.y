%{
#include <iostream>
using namespace std;

int yylex();
void yyerror(const char *s);

%}

%union {
  int num;
}

%token <num> NUMBER
%type <num> expr 
%left '+' '-'
%left '*' '/'

%%

input: /* empty */
     | input expr '\n'  { cout << "Result: " << $2 << endl; }
     ;

expr: NUMBER         { $$ = $1; }
    | expr '+' expr  { $$ = $1 + $3; }
    | expr '-' expr  { $$ = $1 - $3; }
    | expr '*' expr  { $$ = $1 * $3; }
    | expr '/' expr  { if ($3 != 0) $$ = $1 / $3; else { yyerror("Division by zero"); exit(1); } }
    ;

%%

void yyerror(const char *s) {
    cout << "Error: " << s << endl;
}

