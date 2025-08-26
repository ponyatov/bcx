/// @defgroup cli cli
/// @ingroup lib

#ifndef _CLI_HPP_
#define _CLI_HPP_

#include "os.hpp"
#include "vm.hpp"

/// @defgroup core core
/// @ingroup vm
/// @brief Object Graph core

/// @defgroup parser parser
/// @ingroup cli
/// @{

extern int yylex();   ///< lexer (`flex`)
extern int yylineno;  ///< current line
extern char *yyfile;  ///< current file name
#ifdef LEMON
extern int yyin;  ///< current file handler
#else
extern FILE *yyin;  ///< current file handler
#endif                                 // LEMON
extern char *yytext;                   ///< token lexeme value
extern int yyparse();                  ///< parser (`bison`)
extern void yyerror(const char *msg);  ///< syntax error callback

#include "cli.yacc.hpp"

#define TOKEN(C, X)               \
    {                             \
        yylval.t = new C(yytext); \
        return X;                 \
    }
/// @}

#endif  // _CLI_HPP_
