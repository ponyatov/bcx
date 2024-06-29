%{
    #include "bcx.hpp"
%}

%option noyywrap yylineno

%%
#[^\n]*         {} // line comment
[ \t\r\n]+      {}
nop             COMMAND(NOP)
halt            COMMAND(HALT)
":"             {return COLON;}
[a-z]+          { yylval.s = yytext; return ID; }
.               {yyerror("");}
