/// @defgroup bc bc
/// @ingroup vm
/// @brief bytecode compiler
/// @{

#include "command.hpp"
#include "lib.hpp"
#include "memory.hpp"
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

/// @defgroup compiler compiler
/// @{
extern addr compile(byte b);                       ///< single @ref byte
extern addr compile(addr a);                       ///< 16-bit @ref addr
extern addr compile(cell c);                       ///< 32-bit @ref cell
extern addr compile(std::string* label, addr Cp);  ///< global label
/// @}

/// @}
