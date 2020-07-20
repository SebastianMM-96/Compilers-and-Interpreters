digito		[0-9]
digitos		{digito}+
numero		{digitos}(.{digitos})?(E{digitos})?
letra		[A-Za-z]
maymen		[<|>]
oparit		[-|+|*|/]
oprel		={2}|({maymen}(=)?)
id			{letra}(_|{letra}|{digito})*
desc		.
lin			[\n]
asig		\:=
porcentaje	%
%{

#include <stdlib.h>
#include <stdio.h>

int yycolval = 1;

%}

%%
LET 					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <LET> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
INPUT					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <INPUT> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
PRINT 					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <PRINT> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
IF 						{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <IF> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
THEN 					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <THEN> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
ELSE 					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <ELSE> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
FOR 					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <FOR> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
NEXT 					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <NEXT> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
{numero}				{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <numero> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
{id}					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <id> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
{oparit}				{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <oparit> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
{oprel}					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <oparel> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
{asig}					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <asignacion> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
{lin}					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <slinea> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
[\t]					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <tabulador> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
\"						{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <Comillas> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
\{						{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <Llave_abre> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
\}						{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <Llave_cierra> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
;						{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <Punto_y_coma> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
%						{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <Porcentaje> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
{desc}					{fprintf(yyout, "FILA: %d COLUMNA: %d TOKEN: <desconocido> LEXEMA: <%s>\n", yylineno, yycolval+=yyleng, yytext);}
%%

int yywrap(void) {
    return 1;
}

int main(int argc,char **argv)
/*int argc;
char** argv;*/
{
	FILE *leer;
	leer = fopen(argv[1], "r");
	if (!leer){
	    printf("No se encontro %s\n", argv[1]);
	    exit(1);
	}
	yyin = leer;


	FILE *escribir = fopen("tokens.txt", "w");
	if (escribir == NULL){
		printf("Error creando %s\n", "tokens.txt");
		exit(1);
	}
	yyout = escribir;
	yylex();
	fclose(escribir);
	return 0;
}
