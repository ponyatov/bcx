%{
    #include "app.hpp"
    char *yyfile = nullptr; // current file name
%}

%option noyywrap yylineno

%x comment

%%
#![^\n]*    {}              // shebang
\\[^\n]*    {}              // line comment
[ \t\r\n]+  {}              // drop spaces

\(          {BEGIN(comment);}   // start block comment
<comment>\) {BEGIN(INITIAL);}   // stop block comment state

:           {return COLON    ;}
;           {return SEMICOLON;}

jmp         {yylval.cmd = (byte)op::jmp; return CMD0;}

.           {yyerror("");}  // syntax error on any undetected char
