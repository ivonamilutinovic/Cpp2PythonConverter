%option noyywrap
%option noinput
%option nounput

%{
#include <iostream>
#include <cstdlib>
#include <string>
#include <vector>

using namespace std;

#include "parser.tab.hpp"

%}



%%

#include[ \t]+<[a-z]+> 		{} 

using[ \t]namespace[ \t][a-z]+; {}

"//"[^\n]+		{yylval.s = new string(yytext); return komentar_token;}

\"[ \t]\"		return prazan_string_token;

\"[^\n]+\"		{yylval.s = new string(yytext); return string_token;}

"min"			return min_token;	

"max"			return max_token;

"main"			return main_token;

"return"		return return_token;

"cin"			return cin_token;

"cout"			return cout_token;

"endl"			return endl_token;

"int"			return int_token;	

"double"		return double_token;

"if"			return if_token;

"else"			return else_token;

"0"			return nula_token;

[a-zA-Z_][a-zA-Z_0-9]*  {yylval.s = new string(yytext); return id_token;}

[+-]?[0-9]+(\.[0-9]*)?	{yylval.s = new string(yytext); return num_token;}

"<<"			return leva_strelica_token;	

">>"			return desna_strelica_token;

">="			return vece_jednako_token;

"<="			return manje_jednako_token;

[-+*/;=(),{}<>\n]	return *yytext;

[ \t] 		{}

. {

cout<<"Leksicka greska: neprepoznat karakter '"<<*yytext<<"'"<<endl;
exit(EXIT_FAILURE);
}

%%