#ifndef LUA_VERSION_COMPAT_H
#define LUA_VERSION_COMPAT_H

#include <stdbool.h>
#include "trezor_crypto.h"

void lua_pushinteger_compat(lua_State *L,
                            int value);
bool lua_isinteger_compat(lua_State *L,
                          int index);
int lua_tointeger_compat(lua_State *L,
                         int index);
void setfuncs_compat(lua_State *L,
                     const struct luaL_Reg *R,
                     char *name_for_lua51);
void newlib_compat(lua_State *L,
                   const struct luaL_Reg *R,
                   char *name_for_lua51);

#endif //LUA_VERSION_COMPAT_H
