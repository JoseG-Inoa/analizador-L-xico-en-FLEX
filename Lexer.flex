package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
public String lexeme;
%}
%%
entero |
cadena |
caracter|
flotante|
si|
sino |
principal|
ciclo|
eleccion|
caso|
parar|
presenta|
haz|
mientras|
hacer|
mientras_que|
hasta_que|
para|
selecciona|
rompe|
continua|
nueva_palabra_reservada|
clase|
interfaz|
implementa|
extiende|
importa|
nuevo|
estatico|
fin|
abstracto|
publico|
privado|
protegido|
estatico|
interno|
externo|
sincronizado|
volatil|
transitorio|
nativo|
estricto|
este|
retorno|
lanzar|
lanzado|
goto|
oscar| 
navarrete| 
while {lexeme=yytext(); return Tokens.Reservada;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"/*".*."*/" {/*Ignore*/}
"'".*."'" {return Tokens.Cadena;}
"=" {return Tokens.Asignacion;}
"+" {return Tokens.Suma;}
"-" {return Tokens.Resta;}
"*" {return Tokens.Multiplicacion;}
"/" {return Tokens.Division;}
"==" {return Tokens.Comparacion;}
">" {return Tokens.Mayor;}
"<" {return Tokens.Menor;}
">=" {return Tokens.MayorIgual;}
"<=" {return Tokens.MenorIgual;}
"(" {return Tokens.ParentesisApertura;}
")" {return Tokens.ParentesisCierre;}
"{" {return Tokens.LlaveApertura;}
"}" {return Tokens.LlaveCierre;}
";" {return Tokens.PuntoYComa;}
">" {return Tokens.Mayor;}
"<" {return Tokens.Menor;}
">=" {return Tokens.MayorIgual;}
"<=" {return Tokens.MenorIgual;}
"?" {return Tokens.OpTernario;}
":" {return Tokens.OpSeparacion;}

{L}({L}|{D})* {lexeme=yytext(); return Tokens.Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Tokens.Numero;}
. {return Tokens.ERROR;}
