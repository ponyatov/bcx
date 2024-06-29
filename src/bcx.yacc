%{
    #include "bcx.hpp"
%}

%defines %union { char c; char *s; uint8_t op; }

%token<op> CMD
%token<s> ID
%token COLON

%%
syntax: | syntax ex

ex : CMD        { cbyte($1); }
   | COLON ID   { cword($2); }
