%{
    #include "bcx.hpp"

/// VM command
#define COMMAND(X) { yylval.op = OP::X;  return CMD; }
#define MARKER(X)  {                     return X;   }
#define TOKEN(X)   { yylval.s  = yytext; return X;   }
%}

%option noyywrap yylineno

%%
#[^\n]*         {}                  // line comment
[ \t\r\n]+      {}                  // drop spaces
nop             COMMAND(NOP)
halt            COMMAND(HALT)
":"             MARKER(COLON)
[a-z]+          TOKEN(ID)
.               {yyerror("");}      // any undetected char
