%{
    #include "byte.hpp"
    #include "byte.yacc.hpp"
    char* yyfile = nullptr;
%}

%option noyywrap yylineno

num   [0-9]
alpha [a-zA-Z_]
alnum [a-zA-Z_0-9]

%x block_comment

%%
#![^\n]*            {}                      // shebang
\/\/[^\n]*          {}                      // line comment

\/\*                {BEGIN(block_comment);}
<block_comment>\*\/ {BEGIN(INITIAL);}
<block_comment>.    {}

":"                 TOKEN( c,               yytext[0] , COLON )

"nop"               TOKEN(op,                Op::nop  , CMD0  )
"halt"              TOKEN(op,                Op::halt , CMD0  )

{alpha}{alnum}*     TOKEN( s, new std::string(yytext) , ID    )
{num}+              TOKEN( n,            atoi(yytext) , INT   )

[ \t\r\n]+          {}                      // drop spaces
.                   {yyerror("");}          // any undetected char
