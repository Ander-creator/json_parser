
%{
	#include <stdlib.h>
	void yyerror(char *c);
	#include "y.tab.h"

%}

NUM			[0-9]+
PALAVRA			[a-zA-Z]+[0-9]?



%%

[[:SPACE:]]  ;
\{				{return '{';}
\}				{return '}';}
\"				{return '"';}
(:)				{return ':';}
\,				{return ',';}
\[				{return '[';}
\]				{return ']';}	
{PALAVRA}			{return ALFANUM;}
{NUM}				{return ALFANUM;}
{NUM}\.{NUM}			{return ALFANUM;}
. 	;

%%

int yywrap() {
  return 1;
}
