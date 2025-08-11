%{
    #include "byte.hpp"
%}

%defines %union { Op op; int n; std::string *s; char c; }

%token     COLON
%token<s>  ID
%token<op> CMD0 CMD1
%token<n>  INT

%%
syntax: | syntax ex

ex : COLON ID   { fprintf(stderr,"label:%s %.4X\n",$2->c_str(),Cp); label[*$2] = Cp; }
   | CMD0       { fprintf(stderr," cmd0:%.02X\n",$1);       compile($1); }
   | CMD1  ID   { fprintf(stderr," cmd1:%.02X %s\n",$1,$2); compile($1); compile(label[*$2]);}

%%
void yyerror(const char *msg) {
    fprintf(stderr, "\n\n%s:%d %s [%s]\n\n", yyfile, yylineno, msg, yytext);
    exit(-1);
}
