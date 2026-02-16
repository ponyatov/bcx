#pragma once

extern int yylex();   ///< lexer
extern FILE* yyin;    ///< input file handler
extern char* yyfile;  ///< input file name
extern int yylineno;  ///< current line
extern char* yytext;  ///< current lexeme

extern int yyparse();                  ///< syntax parser
extern void yyerror(std::string msg);  ///< syntax error callback

#include "bcx.yacc.hpp"
