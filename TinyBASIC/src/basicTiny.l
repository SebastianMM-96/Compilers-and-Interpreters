%{
#include <stdlib.h>
#define YY_DECL int yylex()
#include "basicTiny.tab.h"

int line_num = 1;
%}

%%

\ 	;
PRINT {return PRINT;}
IF {return IF;}
THEN {return THEN;}
GOTO {return GOTO;}
INPUT {return INPUT;}
LET {return LET;}
GOSUB {return GOSUB;}
RETURN {return RETURN;}
CLEAR {return CLEAR;}
LIST {return LIST;}
RUN {return RUN;}
END {return END;}
[\r\n] {++line_num; return CR;}
[<>] {return LEQGEQ;}
= {return EQ;}
[0-9] {return DIGIT;}
[\*/] {return MULDIV;}
[\+\-] {return PLUMIN;}
[A-Z] {return VAR;}
, {return COMMA;}
\"([a-z\ _0-9A-Z])+\" {return STRING;}
\( {return LPAREN;}
\) {return RPAREN;}

%%