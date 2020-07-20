# Analizador Lexico para el lenguaje BASIC

La tarea principal de un analizador lexico o scanner es dividir un flujo de en-
trada de caracteres en strings (secuencia de caracteres) con significado propio (tokens).

Lex es una utilidad para la generaci ́on autom ́atica de los analizadores lexicos. Para esto, describimos algunos puntos importantes sobre los Analizadores lexicos:

1. El analizador lexico convierte en tokens el flujo (stream) de entrada.

2. Los Tokens son los sımbolos terminales de un lenguaje, por ejemplo: ingles, espanol, lenguajes de programacion, etc.

3. Las expresiones regulares definen los sımbolos terminales  ́o tokens.

***

El analizador lexico del lenguaje BASIC reconoce las siguientes palabras reservadas:

LET|INPUT|PRINT|IF|THEN|ELSE|FOR|NEXT

* Todo lo demas entra como caracteres desconocidos, saltos de linea, símbolos y/o signos. 

Para compilar se muestran los siguientes pasos:

1. Abrir la terminal en el directorio donde se encuentren los archivos. 
2. En terminal escribir los siguietes comandos:
	* $> lex <archivo_analizador_lexico>.l
	* $> cc lex.yy.c -lfl -lm
	* $> ./a.out <archivo_prueba>.txt

3. Una vez ejecutada la ultima instrucción, se generara un archivo en el directorio actual con 
nombre "token.txt", el cual contiene una especia de REPORTE generado por el analizador lexico de BASIC. 
