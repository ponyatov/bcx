%{
    #include "bcx.hpp"
%}

%defines %union { cell n; float f; }

%token<n> INT
%token<f> NUM
%%
syntax: | syntax ex

ex: INT     { fprintf(stderr,"int:%i\n",$1); }
  | NUM     { fprintf(stderr,"num:%f\n",$1); }
