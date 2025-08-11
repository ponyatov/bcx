#pragma once
/// @defgroup parser parser
/// @ingroup compiler
/// @{
extern int yylex();                    ///< lexer
extern char *yyfile;                   ///< current file name
extern FILE *yyin;                     ///< @ref yyfile handler
extern char *yytext;                   ///< current lexeme value
extern int yylineno;                   ///< current line number in @ref yyfile
extern int yyparse();                  ///< syntax parser
extern void yyerror(const char *msg);  ///< syntax error callback
// #include "byte.yacc.hpp"
#define TOKEN(P,C,X) {yylval.P = C; return X;}
/// @}
