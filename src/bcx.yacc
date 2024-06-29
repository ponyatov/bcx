%{
    #include "bcx.hpp"
%}

%defines %union { char c; char *s; uint8_t op; }

%token<op> CMD

%%
syntax: | syntax CMD { cbyte($2); }
