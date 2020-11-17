%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
#include<math.h>
extern int yylval;
%}
%%
[0-9]+ { yylval = atoi(yytext); return INTEGER; }
("+"|"-"|"*"|"/"|"^"|"("|")"|"\n") { return *yytext; }
. {
char err[25];
sprintf(err, "Invalid character: %s\n", yytext);
//yyerror(err);
}
