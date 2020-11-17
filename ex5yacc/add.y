/* add.y */
/*L={INTPLUSINTNL}*/
%token INT PLUS NL
%%
add: INT PLUS INT NL { printf("%d\n", $1 + $3);} %%
#include "lex.yy.c"
yyerror(char *s) { printf("%s\n", s); }
main() {
return yyparse(); }