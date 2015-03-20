package lexico;
import java_cup.runtime.Symbol;
import static lexico.Token.*;
%%
%line
%column
%class Lexer
%type Token
LETRA=[a-zA-Z_][a-zA-Z0-9_]*
DIGITO=[+-]?[0-9]+
CADENA=[\"][a-zA-Z0-9 ]*[\"]
FLOAT=[+-]?[0-9]+[.][0-9]+
MF=[+-]?[0-9]+[.]+[a-zA-Z_0-9]*
COMENT_BLOQUE = [/][*].*[*][/]
CARACTER=[\'][a-zA-Z0-9][\']
MD=[+-]?[0-9]+[a-zA-Z_][0-9]*
VARIABLE=[\$][a-zA-Z_]+[0-9]*
CONJUNCION=[{}[]()]


ESPACIO=[ \t\r\n]
%{
public String lexema;
%}
%%
{ESPACIO} {/*Ignore*/}
"//".* {/*Ignore*/}
"{" {lexema=yytext(); return LLAVEIZQ;}
"}" {lexema=yytext(); return LLAVEDER;}
"(" {lexema=yytext(); return PARENTESISIZQ;}
")" {lexema=yytext(); return PARENTESISDER;}
"[" {lexema=yytext(); return CORCHETEIZQ;}
"]" {lexema=yytext(); return CORCHETEDER;}
"\'" {lexema=yytext(); return COMILLASIMPLE;}
"\"" {lexema=yytext(); return COMILLADOBLE;}
"." {lexema=yytext(); return PUNTO;} 
"," {lexema=yytext(); return COMA;} 
";" {lexema=yytext(); return PUNTOYCOMA;} 
">" {lexema=yytext(); return MAYOR;}
"<" {lexema=yytext(); return MENOR;}
"=" {lexema=yytext(); return ASIGNACION;}
"==" {lexema=yytext(); return IGUAL;}
"!=" {lexema=yytext(); return DIFERENTE;}
"+" {lexema=yytext(); return MAS;}
"-" {lexema=yytext(); return MENOS;}
"*" {lexema=yytext(); return MULTIPLICACION;}
"/" {lexema=yytext(); return DIVISION;}
"echo" {lexema=yytext(); return ECHO;}
"array" {lexema=yytext(); return ARRAY;}
"&&" {lexema=yytext(); return AND;}
"||" {lexema=yytext(); return OR;}
"break" {lexema=yytext(); return BREAK;}
"case" {lexema=yytext(); return CASE;}
"?>" {lexema=yytext(); return FINAL;}
"do" {lexema=yytext(); return DO;}
"else" {lexema=yytext(); return ELSE;}
"elseif" {lexema=yytext(); return ELSEIF;}
"endfor" {lexema=yytext(); return ENDFOR;}
"endif" {lexema=yytext(); return ENDIF;}
"endswitch" {lexema=yytext(); return ENDSWITCH;}
"endwhile" {lexema=yytext(); return ENDWHILE;}
"switch" {lexema=yytext(); return SWITCH;}
"while" {lexema=yytext(); return WHILE;}
"for" {lexema=yytext(); return FOR;}
"function" {lexema=yytext(); return FUNCTION;}
"if" {lexema=yytext(); return IF;}
"--" {lexema=yytext(); return DECREMENTO;}
"++" {lexema=yytext(); return INCREMENTO;}
"include" {lexema=yytext(); return INCLUDE;}
">=" {lexema=yytext(); return MAYORIGUAL;}
"===" {lexema=yytext(); return IDENTICO;}
"!=" {lexema=yytext(); return DIFERENTE;}
"!==" {lexema=yytext(); return NOIDENTICO;}
"<=" {lexema=yytext(); return MENORIGUAL;}
"<?php" {lexema=yytext(); return INICIO;}
"<?" {lexema=yytext(); return INICIO;}
"<%" {lexema=yytext(); return INICIO;}
"print" {lexema=yytext(); return PRINT;}
"return" {lexema=yytext(); return RETURN;}
"static" {lexema=yytext(); return STATIC;}
{LETRA} {lexema=yytext(); return ID;}
{DIGITO} {lexema=yytext(); return ENTERO;}
{CADENA} {lexema=yytext(); return CADENA;}
{FLOAT} {lexema=yytext(); return FLOAT;}
{VARIABLE} {lexema=yytext(); return VARIABLE;}
{MF} {lexema=yytext(); return MF;}
{CARACTER} {lexema=yytext(); return CARACTER;}
{MD} {lexema=yytext(); return MD;}
{COMENT_BLOQUE} {lexema=yytext(); return COMENT_BLOQUE;}
. {return ERROR;}