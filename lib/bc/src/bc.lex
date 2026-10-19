%{
    #include "bc.hpp"
%}

%option noyywrap yylineno

%%
"//"[^\n]*      {}                  // line comment
"/*".*"*/"      {}                  // block comment
[ \t\r\n]+      {printf("\t");}     // drop spaces

"nop"           {yylval.op = Op::nop ; return CMD0; }
"halt"          {yylval.op = Op::halt; return CMD0; }

"call"          {yylval.op = Op::call; return CMD1; }
"ret"           {yylval.op = Op::ret ; return CMD0; }
"jmp"           {yylval.op = Op::jmp ; return CMD1; }
"jz"            {yylval.op = Op::jz  ; return CMD1; }

":"             {return COLON;}
"@"             {return AT   ;}
[a-z]+          {yylval.s = new std::string(yytext); return ID;}

.               {yyerror("");}      // error on any undetected char
