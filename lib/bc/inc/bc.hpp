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

/// @name compile
/// @{
extern addr compile(byte b);  ///< single @ref byte
extern addr compile(Op op);   ///< command @ref Op
extern addr compile(addr a);  ///< 16-bit @ref addr
extern addr compile(cell c);  ///< 32-bit @ref cell
/// @}

/// @name labels
/// @{

extern addr global(std::string* label, addr a);  ///< global label
extern std::map<std::string, addr> globals;      ///< @ref global s table
extern addr local(std::string* label, addr a);   ///< local label
extern std::map<std::string, addr> locals;       ///< @ref global s table
extern addr resolve(std::string* label);         ///< @ref local / @ref global
/// @}

/// @name forward refs
/// @{

/// @ref forward s lists for @ref backpatch
extern std::map<std::string, std::vector<addr>> forwards;
extern addr forward(std::string* label, addr a);    ///< push into @ref forwards
extern addr backpatch(std::string* label, addr a);  ///< patch @ref forwards
/// @}

/// @}

/// @}
