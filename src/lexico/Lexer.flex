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
COMENT_BLOQUE = [/][*].*[*][/]
CARACTER=[\'][a-zA-Z0-9][\']
MD=[+-]?[0-9]+[a-zA-Z_][0-9]*
VARIABLE=[\$][a-zA-Z_]+[0-9]*
CONJUNCION=[{}[]()]
SEPARADOR=[;,.]

ESPACIO=[ \t\r\n]
%{
public String lexema;
%}
%%
{ESPACIO} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {lexema=yytext(); return ASIGNACION;}
"==" {lexema=yytext(); return IGUAL;}
"!=" {lexema=yytext(); return DIFERENTE;}
"+" {lexema=yytext(); return MAS;}
"-" {lexema=yytext(); return MENOS;}
"*" {lexema=yytext(); return MULTIPLICACION;}
"/" {lexema=yytext(); return DIVISION;}
"echo" {lexema=yytext(); return T_ECHO;}
"abstract" {lexema=yytext(); return T_ABSTRACT;}
"&=" {lexema=yytext(); return T_AND_EQUAL;}
"array" {lexema=yytext(); return T_ARRAY;}
"(array)" {lexema=yytext(); return T_ARRAY_CAST;}
"as" {lexema=yytext(); return T_AS;}
"&&" {lexema=yytext(); return T_BOOLEAN_AND;}
"||" {lexema=yytext(); return T_BOOLEAN_OR;}
"(bool)" {lexema=yytext(); return T_BOOL_CAST;}
"(boolean)" {lexema=yytext(); return T_BOOL_CAST;}
"break" {lexema=yytext(); return T_BREAK;}
"callable" {lexema=yytext(); return T_CALLABLE;}
"case" {lexema=yytext(); return T_CASE;}
"catch" {lexema=yytext(); return T_CATCH;}
"class" {lexema=yytext(); return T_CLASS;}
"__CLASS__" {lexema=yytext(); return T_CLASS_C;}
"clone" {lexema=yytext(); return T_CLONE;}
"?>" {lexema=yytext(); return T_CLOSE_TAG;}
".=" {lexema=yytext(); return T_CONCAT_EQUAL;}
"const" {lexema=yytext(); return T_CONST;}
"continue" {lexema=yytext(); return T_CONTINUE;}
"{?" {lexema=yytext(); return T_CURLY_OPEN;}
"--" {lexema=yytext(); return T_DEC;}
"declare" {lexema=yytext(); return T_DECLARE;}
"default" {lexema=yytext(); return T_DEFAULT;}
"__DIR__" {lexema=yytext(); return T_DIR;}
"/=" {lexema=yytext(); return T_DIV_EQUAL;}
"do" {lexema=yytext(); return T_DO;}
"${" {lexema=yytext(); return T_DOLLAR_OPEN_CURLY_BRACES;}
"=>" {lexema=yytext(); return T_DOUBLE_ARROW;}
"(real)" {lexema=yytext(); return T_DOUBLE_CAST;}
"(double)" {lexema=yytext(); return T_DOUBLE_CAST;}
"(float)" {lexema=yytext(); return T_DOUBLE_CAST;}
"::" {lexema=yytext(); return T_DOUBLE_COLON;}
"else" {lexema=yytext(); return T_ELSE;}
"elseif" {lexema=yytext(); return T_ELSEIF;}
"empty" {lexema=yytext(); return T_EMPTY;}
"enddeclare" {lexema=yytext(); return T_ENDDECLARE;}
"endfor" {lexema=yytext(); return T_ENDFOR;}
"endforeach" {lexema=yytext(); return T_ENDFOREACH;}
"endif" {lexema=yytext(); return T_ENDIF;}
"endswitch" {lexema=yytext(); return T_ENDSWITCH;}
"endwhile" {lexema=yytext(); return T_ENDWHILE;}
"eval" {lexema=yytext(); return T_EVAL;}
"exit" {lexema=yytext(); return T_EXIT;}
"die" {lexema=yytext(); return T_EXIT;}
"extends" {lexema=yytext(); return T_EXTENDS;}
"__FILE__" {lexema=yytext(); return T_FILE;}
"final" {lexema=yytext(); return T_FINAL;}
"finally" {lexema=yytext(); return T_FINALLY;}
"for" {lexema=yytext(); return T_FOR;}
"foreach" {lexema=yytext(); return T_FOREACH;}
"function" {lexema=yytext(); return T_FUNCTION;}
"cfunction" {lexema=yytext(); return T_FUNC_C;}
"global" {lexema=yytext(); return T_GLOBAL;}
"goto" {lexema=yytext(); return T_GOTO;}
"if" {lexema=yytext(); return T_IF;}
"implements" {lexema=yytext(); return T_IMPLEMENTS;}
"++" {lexema=yytext(); return T_INC;}
"include" {lexema=yytext(); return T_INCLUDE;}
"include_once" {lexema=yytext(); return T_INCLUDE_ONCE;}
"instanceof" {lexema=yytext(); return T_INSTANCEOF;}
"insteadof" {lexema=yytext(); return T_INSTEADOF;}
"(int)" {lexema=yytext(); return T_INT_CAST;}
"(integer)" {lexema=yytext(); return T_INT_CAST;}
"interface" {lexema=yytext(); return T_INTERFACE;}
"isset" {lexema=yytext(); return T_ISSET;}
">=" {lexema=yytext(); return T_IS_GREATER_OR_EQUAL;}
"===" {lexema=yytext(); return T_IS_IDENTICAL;}
"!=" {lexema=yytext(); return T_IS_NOT_EQUAL;}
"<>" {lexema=yytext(); return T_IS_NOT_EQUAL;}
"!==" {lexema=yytext(); return T_IS_NOT_IDENTICAL;}
"<=" {lexema=yytext(); return T_IS_SMALLER_OR_EQUAL;}
"__LINE__" {lexema=yytext(); return T_LINE;}
"list" {lexema=yytext(); return T_LIST;}
"and" {lexema=yytext(); return T_LOGICAL_AND;}
"or" {lexema=yytext(); return T_LOGICAL_OR;}
"xor" {lexema=yytext(); return T_LOGICAL_XOR;}
"__METHOD__" {lexema=yytext(); return T_METHOD_C;}
"-=" {lexema=yytext(); return T_MINUS_EQUAL;}
"%=" {lexema=yytext(); return T_MOD_EQUAL;}
"*=" {lexema=yytext(); return T_MUL_EQUAL;}
"namespace" {lexema=yytext(); return T_NAMESPACE;}
"__NAMESPACE__" {lexema=yytext(); return T_NS_C;}
"\\" {lexema=yytext(); return T_NS_SEPARATOR;}
"new" {lexema=yytext(); return T_NEW;}
"(object)" {lexema=yytext(); return T_OBJECT_CAST;}
"->" {lexema=yytext(); return T_OBJECT_OPERATOR;}
"<?php" {lexema=yytext(); return T_OPEN_TAG;}
"<?" {lexema=yytext(); return T_OPEN_TAG;}
"<%" {lexema=yytext(); return T_OPEN_TAG;}
"<?=" {lexema=yytext(); return T_OPEN_TAG_WITH_ECHO;}
"<%=" {lexema=yytext(); return T_OPEN_TAG_WITH_ECHO;}
"|=" {lexema=yytext(); return T_OR_EQUAL;}
"+=" {lexema=yytext(); return T_PLUS_EQUAL;}
"," {lexema=yytext(); return COMA;}
"**" {lexema=yytext(); return T_POW;}
"**=" {lexema=yytext(); return T_POW_EQUAL;}
"print" {lexema=yytext(); return T_PRINT;}
"private" {lexema=yytext(); return T_PRIVATE;}
"public" {lexema=yytext(); return T_PUBLIC;}
"protected" {lexema=yytext(); return T_PROTECTED;}
"require" {lexema=yytext(); return T_REQUIRE;}
"require_once" {lexema=yytext(); return T_REQUIRE_ONCE;}
"return" {lexema=yytext(); return T_RETURN;}
"<<" {lexema=yytext(); return T_SL;}
"<<=" {lexema=yytext(); return T_SL_EQUAL;}
">>" {lexema=yytext(); return T_SR;}
">>=" {lexema=yytext(); return T_SR_EQUAL;}
"<<<" {lexema=yytext(); return T_START_HEREDOC;}
"static" {lexema=yytext(); return T_STATIC;}
{LETRA} {lexema=yytext(); return ID;}
{DIGITO} {lexema=yytext(); return ENTERO;}
{CADENA} {lexema=yytext(); return CADENA;}
{FLOAT} {lexema=yytext(); return FLOAT;}
{VARIABLE} {lexema=yytext(); return VARIABLE;}
{MF} {lexema=yytext(); return MF;}
{CARACTER} {lexema=yytext(); return CARACTER;}
{MD} {lexema=yytext(); return MD;}
{COMENT_BLOQUE} {lexema=yytext(); return COMENT_BLOQUE;}
{CONJUNCION} {lexema=yytext(); return CONJUNCION;}
{SEPARADOR} {lexema=yytext(); return SEPARADOR;}
. {return ERROR;}