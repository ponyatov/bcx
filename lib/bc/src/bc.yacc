%{
    #include "bc.hpp"
%}

%defines %union { int n; Op op; std::string* s; }

%token COLON AT
%token<s> ID
%token<op> CMD0 CMD1
%%
syntax: | ex syntax 

ex:   COLON ID        {} // global($2,Cp); }    // compile global label
    | AT    ID        {} // local ($2,Cp); }    // compile local label
    | CMD0            {}
    | CMD1 ID
