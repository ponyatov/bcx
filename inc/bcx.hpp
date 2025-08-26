#ifndef _BCX_HPP_
#define _BCX_HPP_

#include "os.hpp"

class Object {};
class Token : public Object {};

extern int yylex();
extern int yylineno;
extern char *yyfile;
extern char *yytext;
extern void yyerror(const char *msg);

#endif  // _BCX_HPP_
