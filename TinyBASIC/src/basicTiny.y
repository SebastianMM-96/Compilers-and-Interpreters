%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

int yylex();
int yyparse();
FILE *yyin;
int line_num;

void yyerror(const char *s);	
%}

%token PRINT IF THEN GOTO INPUT LET GOSUB RETURN CLEAR LIST RUN END STRING COMMA PLUMIN MULDIV EQ LEQGEQ CR DIGIT VAR LPAREN RPAREN

%%

program: lines	{printf( "Successfull parsing of Tiny Basic program\n" );}
		;

lines: lines line {printf( "Successfully parsed lines -> lines line\n" );}
		| line {printf( "Successfully parsed lines -> line\n" );}
		;

line: number statement CR {printf( "Successfully parsed line -> number statement CR\n" );}
	| statement CR {printf( "Successfully parsed line -> statement CR\n" );}
		;

statement:
			PRINT expr-list	{printf( "Parsed PRINT statement\n" );}
			| IF expression LEQGEQ expression THEN statement {printf( "Parsed IF Statement\n" );}
			| IF expression EQ expression THEN statement {printf( "Parsed IF Statement\n" );}
			| GOTO expression {printf( "Parsed GOTO statement\n" );}
			| INPUT var-list {printf( "Parsed INPUT Statement\n" );}
			| LET VAR EQ expression {printf( "Parsed LET Statement\n" );}
			| GOSUB expression {printf( "Parsed GOSUB Statement\n" );}
			| RETURN {printf( "Parsed RETURN Statement\n" );}
			| CLEAR {printf( "Parsed CLEAR Statement\n" );}
			| LIST {printf( "Parsed LIST Statement\n" );}
			| RUN {printf( "Parsed RUN Statement\n" );}
			| END {printf( "Parsed END Statement\n" );}
			;

expr-list:	expr-list COMMA expr-id {printf( "Parsed expr-list -> expr-list COMMA expr-id\n" );}
			| expr-id {printf( "Parsed expr-list -> expr-id\n" );}
			;

expr-id: STRING {printf( "Parsed expr-id -> STRING\n" );}
		| expression {printf( "Parsed expr-id -> expression\n" );}
		;

var-list: VAR COMMA var-list {printf( "Parsed var-list -> VAR COMMA var-list\n" );}
		| VAR {printf( "Parsed var-list -> VAR\n" );}
		;

expression: expression PLUMIN term {printf( "parsed expression -> expression PLUMIN term\n" );}
		| PLUMIN term {printf( "Parsed expression -> PLUMIN term\n" );}
		;

term: term MULDIV factor {printf( "parsed term -> term MULDIV factor\n" );}
	| factor {printf( "Parsed term -> factor\n" );}
	;

factor: VAR {printf( "parsed factor -> VAR\n" );}
		| number {printf( "parsed factor -> number\n" );}
		| LPAREN expression RPAREN {printf( "Parsed factor -> LPAREN expression RPAREN\n" );}
		;

number: number DIGIT | DIGIT {printf( "Parsed number\n" );}
		;

%%

int main(int n, char** f) {
	FILE *myfile;
	if(n > 1) {
		myfile = fopen(f[1], "r");
	} else {
		printf( "No se ha ingresado algun archivo" );
		exit(-1);
	}

	if(!myfile) {
		printf( "No se puede abrir el archivo!" );
		return -1;
	}

	yyin = myfile;

	do {
		yyparse();
	} while(!feof(yyin));
}

void yyerror(const char *s) {
	printf( "Parse Error! Message on Line number: %d, %d\n", line_num, s);
	exit(-1);
}