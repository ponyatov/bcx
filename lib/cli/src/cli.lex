%{
    #include "bcx.hpp"
    char *yyfile = nullptr;
%}

%option noyywrap yylineno

s [+\-]
n [0-9]

/* special states for block comments */
%x STACK

%%
"#!"[^\n]+  {}                  // shebang
"//"[^\n]+  {}                  // line comment
[ \t\r\n]+  {}                  // drop spaces

"("         {BEGIN(STACK  );}   // start stack notation
<STACK>")"  {BEGIN(INITIAL);}   // end stack notation
<STACK>.    {}                  // ignore any chars

.           {yyerror("");}      // any undetected char
