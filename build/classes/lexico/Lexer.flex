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

{LETRA} {lexema=yytext(); return ID;}
{DIGITO} {lexema=yytext(); return ENTERO;}
{CADENA} {lexema=yytext(); return CADENA;}
{FLOAT} {lexema=yytext(); return FLOAT;}
{VARIABLE} {lexema=yytext(); return VARIABLE;}
{MF} {lexema=yytext(); return MF;}
"," {return COMA;}
. {return ERROR;}