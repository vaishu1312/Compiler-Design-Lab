%{    
  #include<stdio.h>	
%}

%option noyywrap

delim	  [ \t\n]
ws		  {delim}+
letter	  [a-zA-Z]
digit 	  [0-9]
identifier  {letter}({letter}|{digit}|_)*
number 	  {digit}+(\.{digit}+)?(E[+|-]?{digit}+)?
sept	  [,.:;!?(){}]
nonblank [ˆ \t]
string    \".*\" 

%%

#.* {printf("\n%s    -    Preprocessor directive",yytext);}


int|float|char|double|while|for|struct|typedef|do|if|break|continue|void|switch|return|else|goto    {printf("\n%s    -    Keyword",yytext);}

{identifier}\(({string}|{identifier}|,)*\)   {printf("\n%s    -    Function call",yytext);}


{sept}	{printf("\n%s    -    Separator",yytext);}

{identifier} {printf("\n%s    -    Identifier",yytext);}

{number} {printf("\n%s    -    Number",yytext);}

\= {printf("\n%s     -    Assignment Operator",yytext);}

\+ | 
\- |
\* |
\/   { printf("\n%s    -    Arithmetic Operator",yytext);}

\<= | 
\>= |
\< |
\> |
== {printf("\n%s    -    Relational Operator",yytext);}

%%

int main()
{
	FILE * fd = fopen("/home/csec86/cdlab/ex2/s1.txt","r");
	if(!fd)
		printf("\nError opening file");
	yyin=fd;
	yylex();
	printf("\n");
}
