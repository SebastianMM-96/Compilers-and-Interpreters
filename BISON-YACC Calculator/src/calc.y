%{ 
   /* Seccion de definiciones */
  #include<stdio.h> 
  int flag=0; 
%} 
  
%token NUMBER 
  
%left '+' '-'
  
%left '*' '/' '%'
  
%left '(' ')'
  
/* Seccion de reglas */
%% 
  
ArithmeticExpression: E{ 
  
         printf("\nResultado de la expresion=%d\n", $$); 
  
         return 0; 
  
        }; 
 E:E'+'E {$$=$1+$3;} 
  
 |E'-'E {$$=$1-$3;} 
  
 |E'*'E {$$=$1*$3;} 
  
 |E'/'E {$$=$1/$3;} 
  
 |E'%'E {$$=$1%$3;} 
  
 |'('E')' {$$=$2;} 
  
 | NUMBER {$$=$1;} 
  
 ; 
  
%% 
/* Funcion Main */  
void main() 
{ 
   printf("\nIngrese una expresion aritmetica:\n"); 
  
   yyparse(); 
   if(flag==0) 
   printf("\nExpresion aritmetica Valida\n\n"); 
} 
  
void yyerror() 
{ 
   printf("\nExpresion aritmetica invalida\n\n"); 
   flag=1; 
} 