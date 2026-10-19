/// @defgroup bc bc
/// @ingroup vm
/// @brief bytecode compiler
/// @{

#include <stdio.h>
#include <stdlib.h>

#include "command.hpp"
#include "types.hpp"

/// @defgroup lexer lexer
/// @{
extern int yylex();
extern int yylineno;
extern FILE* yyin;
extern char* yytext;
extern char* yyfile;
/// @}
/// @defgroup parser parser
/// @{
extern int yyparse();
extern void yyerror(const char* msg);
#include "bc.yacc.hpp"
/// @}
/// @}
