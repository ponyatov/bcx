#pragma once

/// @defgroup skelex lexical skeleton
/// @{
#include <readline/readline.h>
#include <readline/history.h>
extern int yylex();                    ///< lexer
extern int yylineno;                   ///< current source line
extern char *yytext;                   ///< parsed token value
extern FILE *yyin;                     ///< input file handler
extern int yyparse();                  ///< parser
extern void yyerror(const char *msg);  ///< syntax error callback
#include "bcx.parser.hpp"
/// @}
