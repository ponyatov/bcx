%{
    #include "bc.hpp"
%}

%option noyywrap yylineno

%%
"//"[^\n]*      {}                  // line comment
"/*".*"*/"      {}                  // block comment
[ \t\r\n]+      {printf("\t");}     // drop spaces

":"             {return COLON;}
.               {yyerror("");}      // error on any undetected char
