%{
    #include "bcx.hpp"
%}

%option noyywrap yylineno

%%
#[^\n]*         {} // line comment
[ \t\r\n]+      {}
nop             COMMAND(NOP)
halt            COMMAND(HALT)
.               {yyerror("");}
