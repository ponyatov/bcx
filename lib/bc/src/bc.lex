%{
    #include "bc.hpp"
%}

%option noyywrap yylineno

%%
"//"[^\n]*      {}                  // line comment
"/*".*"*/"      {}                  // block comment
[ \t\r\n]+      {printf("\t");}     // drop spaces

"nop"           {yylval.op = Op::nop; return CMD0; }
"halt"          {yylval.op = Op::nop; return CMD0; }

"call"          {yylval.op = Op::nop; return CMD1; }
"ret"           {yylval.op = Op::nop; return CMD0; }
"jmp"           {yylval.op = Op::nop; return CMD1; }
"jz"            {yylval.op = Op::nop; return CMD1; }

":"             {return COLON;}
"@"             {return AT   ;}
[a-z]+          {yylval.s = new std::string(yytext); return ID;}

.               {yyerror("");}      // error on any undetected char
