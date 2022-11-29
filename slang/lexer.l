%{
#define YYSTYPE void*
#include "parser.hpp"
extern "C" int yylex();
extern "C" void yyerror(char* str);
%}

%option yylineno
%option noyywrap

%%

[/][/].*\n      			; // comment
"/*"*"*/"					; // comment as well

[0-9]+						{
								//printf("INT %s\n", yytext);
								yylval = strdup(yytext);
								return NUM;
							}
							
"function"					{ /*printf("FunctionBegin\n");*/ return FUNCTION; }
				
"if"						{ /*printf("IfToken\n");*/ return IF; }

"goto"						{ /*printf("GotoToken\n");*/ return GOTO; }

"integer"					{ /*printf("integerToken");*/ return INTEGER; }

[A-Za-z_][A-Za-z_0-9]*      {
                  				/*printf("Identifier %s\n", yytext);*/
                  				yylval = strdup(yytext);
                  				return IDENTIFIER;
							}

[ \t\r\n]					; // whitespace

.							{ return *yytext;/*yyerror("Wrong character"); exit(-1);*/ }

%%