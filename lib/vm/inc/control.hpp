/// @defgroup control control
/// @ingroup command
/// @{
#pragma once

extern void rpush(addr a);  ///< `(R: -- addr)`
extern addr rpop();         ///< `(R: addr -- )

extern void nop();   ///< `( -- )` empty command (do nothing)
extern void halt();  ///< `( -- )` stop system

extern void jmp();   ///< `( -- )` unconditional jump
extern void jz();    ///< `( bool -- )` conditional jump if `false`/`zero`
extern void call();  ///< `(R: -- addr )` nested call
extern void ret();   ///< `(R: addr -- )` return from nested call

/// @}
