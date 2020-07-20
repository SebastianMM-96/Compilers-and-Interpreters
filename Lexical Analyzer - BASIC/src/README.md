# Analizador léxico
## Teoría de Lex

La entrada a Lex se divide en tres secciones con el s ́ımbolo %% dividiendo las
secciones.

La entrada se copia para generar un caracter a la vez. Siempre se requiere
el primer %%, ya que siempre debe haber una seccion de reglas. Sin embargo,
si no especificamos ninguna regla, la accion predeterminada es hacer coincidir
todo y copiarlo en la salida.

La secci ́on de definiciones se compone de sustituciones, codigo y estados de
inicio. El codigo en la seccion de definiciones simplemente se copia como esta
en la parte superior del archivo C generado y debe estar entre corchetes con 
marcadores ”% {” y ”%}”. Las sustituciones simplifican las reglas de coinciden-
cia de patrones.
