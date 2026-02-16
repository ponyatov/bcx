%{
    #include "app.hpp"
%}

%defines %union { char c; int n; op cmd; }

%token COLON SEMICOLON

%token<cmd> CMD0

%%
syntax: COLON       { std::clog << ":colon\n"    ;}
      | SEMICOLON   { std::clog << "semicolon;\n";}
      | CMD0        { std::clog << "cmd0:" << (int)$1 << "'n";}

%%

void yyerror(std::string msg) {
    std::cerr << "\n\n"
              << yyfile << ':' << yylineno << ' ' << msg << " [" << yytext
              << "]\n\n";
    exit(-1);
}
