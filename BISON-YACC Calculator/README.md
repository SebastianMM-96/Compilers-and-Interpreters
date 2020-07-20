# Conceptos básicos de BISON

Para que Bison analice un idioma, debe describirse mediante una gramática libre de contexto. 
Esto significa que usted especifica una o más agrupaciones sintácticas y da reglas 
para construirlas a partir de sus partes. Por ejemplo, en el lenguaje C, 
un tipo de agrupación se denomina `expresión '. Una regla para hacer una expresión podría ser: 
"Una expresión puede estar hecha de un signo menos y otra expresión". Otro sería: 
"Una expresión puede ser un número entero". Como puede ver, las reglas son a menudo recursivas, 
pero debe haber al menos una regla que salga de la recursividad.

## Archivos para usar BISON

El archivo de entrada para la utilidad Bison es un archivo de gramática de Bison. 
La forma general de un archivo de gramática de Bison es la siguiente:

%{
C declarations
%}

Bison declarations

%%
Grammar rules
%%
Additional C code

***** Los simbolos `%% ',`% {' y `%} 'son signos de puntuación que aparecen en cada archivo de 
gramática de Bison para separar las secciones.


***** Las declaraciones en C pueden definir tipos y variables utilizadas en las acciones. 
También puede usar comandos de preprocesador para definir las macros utilizadas allí, y 
usar #include para incluir archivos de encabezado que hagan cualquiera de estas cosas.


***** Las declaraciones de Bison declaran los nombres de los símbolos terminales 
y no terminales, y también pueden describir la precedencia del operador y los 
tipos de datos de valores semánticos de varios símbolos.


***** Las reglas gramaticales definen cómo construir cada 
símbolo no terminal a partir de sus partes.


***** El código C adicional puede contener cualquier código C que desee usar. 
A menudo, la definición del analizador léxico yylex va aquí, más las subrutinas 
llamadas por las acciones en las reglas gramaticales. En un programa simple, 
todo el resto del programa puede ir aquí.
