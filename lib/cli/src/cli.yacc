%{
    #include "cli.hpp"
%}

%defines %union { cell n; float f; }

%token<n> INT HEX OCT BIN
%token<f> NUM
%%
syntax: | syntax ex

ex: INT     { fprintf(stderr,"int:%i\n",$1); }
  | HEX     { fprintf(stderr,"hex:%f\n",$1); }
  | OCT     { fprintf(stderr,"oct:%f\n",$1); }
  | BIN     { fprintf(stderr,"bin:%f\n",$1); }
  | NUM     { fprintf(stderr,"num:%f\n",$1); }
