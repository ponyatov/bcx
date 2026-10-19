%{
    #include "bc.hpp"
%}

%defines %union { int n; Op op; std::string s; }

%token COLON SEMICOLON
%token<s> ID
%%
syntax: | ex syntax 

ex: COLON ID        { compile($2,Cp); }  // compile global label
