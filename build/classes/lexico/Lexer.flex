package lexico;
import static lexico.Token.*;
%%
%class Lexer
%type Token
LETRA=[a-zA-Z_][a-zA-Z0-9_]*
DIGITO=[+-]?[0-9]+
CADENA=[\"][a-zA-Z0-9 ]*[\"]
FLOAT=[+-]?[0-9]+[.][0-9]+
MF=[+-]?[0-9]+[.]+[a-zA-Z_0-9]*
VARIABLE=[\$][a-zA-Z_]+[0-9]*
ESPACIO=[ \t\r\n]
%{
public String lexema;
%}
%%
{ESPACIO} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return ASIGNACION;}
"==" {return IGUAL;}
"!=" {return DIFERENTE;}
"+" {return MAS;}
"-" {return MENOS;}
"*" {return MULTIPLICACION;}
"/" {return DIVISION;}
"echo" {return RESERVADA;}
{LETRA} {lexema=yytext(); return ID;}
{DIGITO} {lexema=yytext(); return ENTERO;}
{CADENA} {lexema=yytext(); return CADENA;}
{FLOAT} {lexema=yytext(); return FLOAT;}
{VARIABLE} {lexema=yytext(); return VARIABLE;}
{MF} {lexema=yytext(); return MF;}
"," {return COMA;}
. {return ERROR;}