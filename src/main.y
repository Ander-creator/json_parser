

%{
	#include <stdio.h>
	#include <stdlib.h>
	void yyerror(char *c);
	int yylex(void);
%}

%token '{' '}' ',' ':' '[' ']' '"' ALFANUM 

%%
S:
	S J { printf("VALIDO\n");}
	|
	;
J:
	'{' CONT '}'
	|'{' LISTA '}'
	;
CONT:
	STRING ':' VALOR
	;
STRING:
	'"' CONTSTRING '"'
	;
CONTSTRING:
	ALFANUM
	|CONTSTRING ALFANUM
	|
	;
VALOR:
	ALFANUM
	|STRING
	|LISTA
	;
LISTA:
	'[' INLISTA ']'
	|J 
	|CONT ',' CONT
	;
INLISTA:
	ALFANUM
	|STRING
	|LISTA
	|INLISTA ',' INLISTA
	|ALFANUM ',' LISTA
	|ALFANUM ',' ALFANUM ',' LISTA
	|
	;

%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;
}  
