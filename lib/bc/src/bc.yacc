%{
    #include "bc.hpp"
%}

%defines %union { int n; Op op; std::string* s; }

%token COLON AT
%token<s> ID
%token<op> CMD0 CMD1
%%
syntax: | ex syntax 

ex:   COLON ID        { global($2,Cp); }                     // global label
    | AT    ID        { local ($2,Cp); }                     // local label
    | CMD0            { compile($1); }                       // no-op command
    | CMD1 ID         { compile($1); compile(resolve($2)); } // call/jmp label
