%{
    #include "app.hpp"
%}

%defines %union { char c; int n; uint8_t cmd; }

%token COLON SEMICOLON

%token<cmd> CMD0

%%
syntax: COLON       { std::clog << ":colon\n"    ;}
      | SEMICOLON   { std::clog << "semicolon;\n";}
      | CMD0        { compile($1); dump(); }

%%

void yyerror(std::string msg) {
    std::cerr << "\n\n"
              << yyfile << ':' << yylineno << ' ' << msg << " [" << yytext
              << "]\n\n";
    exit(-1);
}
