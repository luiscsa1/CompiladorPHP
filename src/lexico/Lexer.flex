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
"echo" {return T_ECHO;}
"abstract" {return T_ABSTRACT;}
"&=" {return T_AND_EQUAL;}
"array" {return T_ARRAY;}
"(array)" {return T_ARRAY_CAST;}
"as" {return T_AS;}
"&&" {return T_BOOLEAN_AND;}
"||" {return T_BOOLEAN_OR;}
"(bool)" {return T_BOOL_CAST;}
"(boolean)" {return T_BOOL_CAST;}
"break" {return T_BREAK;}
"callable" {return T_CALLABLE;}
"case" {return T_CASE;}
"catch" {return T_CATCH;}
"class" {return T_CLASS;}
"__CLASS__" {return T_CLASS_C;}
"clone" {return T_CLONE;}
"?>" {return T_CLOSE_TAG;}
".=" {return T_CONCAT_EQUAL;}
"const" {return T_CONST;}
"continue" {return T_CONTINUE;}
"{?" {return T_CURLY_OPEN;}
"--" {return T_DEC;}
"declare" {return T_DECLARE;}
"default" {return T_DEFAULT;}
"__DIR__" {return T_DIR;}
"/=" {return T_DIV_EQUAL;}
"do" {return T_DO;}
"${" {return T_DOLLAR_OPEN_CURLY_BRACES;}
"=>" {return T_DOUBLE_ARROW;}
"(real)" {return T_DOUBLE_CAST;}
"(double)" {return T_DOUBLE_CAST;}
"(float)" {return T_DOUBLE_CAST;}
"::" {return T_DOUBLE_COLON;}
"else" {return T_ELSE;}
"elseif" {return T_ELSEIF;}
"empty" {return T_EMPTY;}
"enddeclare" {return T_ENDDECLARE;}
"endfor" {return T_ENDFOR;}
"endforeach" {return T_ENDFOREACH;}
"endif" {return T_ENDIF;}
"endswitch" {return T_ENDSWITCH;}
"endwhile" {return T_ENDWHILE;}
"eval" {return T_EVAL;}
"exit" {return T_EXIT;}
"die" {return T_EXIT;}
"extends" {return T_EXTENDS;}
"__FILE__" {return T_FILE;}
"final" {return T_FINAL;}
"finally" {return T_FINALLY;}
"for" {return T_FOR;}
"foreach" {return T_FOREACH;}
"function" {return T_FUNCTION;}
"cfunction" {return T_FUNC_C;}
"global" {return T_GLOBAL;}
"goto" {return T_GOTO;}
"if" {return T_IF;}
"implements" {return T_IMPLEMENTS;}
"++" {return T_INC;}
"include" {return T_INCLUDE;}
"include_once" {return T_INCLUDE_ONCE;}
"instanceof" {return T_INSTANCEOF;}
"insteadof" {return T_INSTEADOF;}
"(int)" {return T_INT_CAST;}
"(integer)" {return T_INT_CAST;}
"interface" {return T_INTERFACE;}
"isset" {return T_ISSET;}
"==" {return T_IS_EQUAL;} 
">=" {return T_IS_GREATER_OR_EQUAL;}
"===" {return T_IS_IDENTICAL;}
"!=" {return T_IS_NOT_EQUAL;}
"<>" {return T_IS_NOT_EQUAL;}
"!==" {return T_IS_NOT_IDENTICAL;}
"<=" {return T_IS_SMALLER_OR_EQUAL;}
"__LINE__" {return T_LINE;}
"list" {return T_LIST;}
"and" {return T_LOGICAL_AND;}
"or" {return T_LOGIAL_OR;}
"xor" {return T_LOGICAL_XOR;}
"__METHOD__" {return T_METHOD_C;}
"-=" {return T_MINUS_EQUAL;}
"%=" {return T_MOD_EQUAL;}
"*=" {return T_MUL_EQUAL;}
"namespace" {return T_NAMESPACE;}
"__NAMESPACE__" {return T_NS_C;}
"\\" {return T_NS_SEPARATOR;}
"new" {return T_NEW;}
"(object)" {return T_OBJECT_CAST;}
"->" {return T_OBJECT_OPERATOR;}
"<?php" {return T_OPEN_TAG;}
"<?" {return T_OPEN_TAG;}
"<%" {return T_OPEN_TAG;}
"<?=" {return T_OPEN_TAG_WITH_ECHO;}
"<%=" {return T_OPEN_TAG_WITH_ECHO;}
"|=" {return T_OR_EQUAL;}
"::" {return T_PAAMAYIM_NEKUDOTAYIM;}
"+=" {return T_PLUS_EQUAL;}
{LETRA} {lexema=yytext(); return ID;}
{DIGITO} {lexema=yytext(); return ENTERO;}
{CADENA} {lexema=yytext(); return CADENA;}
{FLOAT} {lexema=yytext(); return FLOAT;}
{VARIABLE} {lexema=yytext(); return VARIABLE;}
{MF} {lexema=yytext(); return MF;}
{ASIG} {lexema=yytext(); return ASIG;}
"," {return COMA;}
. {return ERROR;}