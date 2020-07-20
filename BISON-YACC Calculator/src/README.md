# Gramática implementada 

La gramatica que se implementa es la misma como la BNF, la cual por si no se recuerda
es la siguiente:

	
		statement:		NAME 	'='		expression

		expression:		NUMBER	'+'		NUMBER
					        |	NUMBER 	'-'		NUMBER


La barra vertical, |, significa que hay dos posibilidades para el mismo símbolo; es decir, 
una expresión puede ser una suma o una resta. El símbolo a la izquierda de: 
se conoce como el lado izquierdo de la regla, a menudo abreviado LHS, y los símbolos a 
la derecha son el lado derecho, generalmente abreviado RHS.	


Los símbolos terminales y no terminales deben ser diferentes. Es un error escribir una regla con un token en el lado izquierdo. 
La forma habitual de representar una oración analizada es como un árbol. 

Por ejemplo, si analizamos la entrada fred = 12 + 13 con esta gramática, el árbol se vería así

							STATEMENT
								|
								|------------
							   / \          |
							  /   \         |
							 /     \        |
						   fred    '='   expression
						   					|\
						   				   /| \
						   				  / |  \
						   				 /  |   \
						   				/   |    \
						   			   /	|     \
						   			 '12'  '+'   '13'


En este ejemplo, 12 + 13 es una expresión, y fred = expression es una declaración. 
Un analizador de BISON no crea automáticamente este árbol como una estructura de datos, aunque, 
como veremos, no es difícil hacerlo usted mismo. Cada gramática incluye un símbolo de inicio, 
el que tiene que estar en la raíz del árbol de análisis. 
En esta gramática, la declaración es el símbolo de inicio.


Las reglas pueden referirse directa o indirectamente a sí mismas; Esta importante capacidad 
hace posible analizar secuencias de entrada arbitrariamente largas. 
Extendamos nuestra gramática para manejar expresiones aritméticas más largas:


	expression	:	NUMBER
				|	expression '+'	NUMBER
				|	expression '-'	NUMBER	

Ahora podemos analizar una secuencia como fred = 14 + 23 - 11 + 7 aplicando las reglas de expresión repetidamente, 
como en el árbol de ejemplo. Bison puede analizar reglas recursivas de manera muy eficiente, 
por lo que veremos reglas recursivas en casi todas las gramática que usamos.

***

# Compilar el archivo

En el directorio que estamos abrimos la terminal y escribimos los siguientes comandos:

$> yacc -d <archivo_Prueba>.y 

Al compilar esto, YACC/BISON nos creara automaticamente dos archivos en el directorio, estos tienen el nombre de:

	1. y.tab.h
	2. y.tab.c

Despues de haber echo esto, lo que haremos será crear nuestro archivo en Flex/Lex que contenga las expresiones o 
reglas que vayamos a implementar, como en este caso es una sencilla calculadora, las reglas que debemos de poner 
son declarar los digitos y los operadores aritmeeticos. 

Una vez que tenemos estos archivos en la terminal escribimos lo siguiente:

$> lex <archivoFles>.l
$> cc y.tab.c lex.yy.c
$> ./a.out

Y empezamos a darle una expresión matematica y obtendremos el resultado. 
